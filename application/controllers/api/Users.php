<?php

use Restserver\Libraries\REST_Controller;

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/Format.php';

class Users extends REST_Controller {

    public function login_post() {

        // reglas de validacion
        $this->form_validation->set_rules('password', 'Password', 'required|max_length[20]');
        $this->form_validation->set_rules('email', 'Email', 'required|max_length[30]|valid_email|trim');

        $data = array(
            'user_id' => 0,
            'email' => "",
            'name' => ""
        );

        //revisar reglas de validacion
        if (!$this->form_validation->run() == FALSE) {
            // el formulario es valido
            // obteniendo los datos de usuario
            $email = $this->input->post('email');
            $password = $this->input->post('password');

            //verificamos credenciales
            $user = $this->User->checkLogin($email, $password);

            $token = generateTokenAuth();

            if (is_object($user)) {
                $data = array(
                    'user_id' => $user->user_id,
                    'email' => $user->email,
                    'name' => $user->name,
                    'avatar' => $user->avatar,
                    'token' => $token
                );
            }

            $save = array(
                "user_id" => $user->user_id,
                "token" => $token
            );

            $this->User_token->insert($save);
        }

        $this->response($data);
    }

    public function sign_up_post() {

        // reglas de validacion
        $this->form_validation->set_rules('email', 'Email', 'required|max_length[30]|valid_email|trim|is_unique[users.email]');
        $this->form_validation->set_rules('name', 'Nombre', 'required|max_length[20]');
        $this->form_validation->set_rules('password', 'Contraseña', 'required|max_length[20]');
        $this->form_validation->set_rules('confirm_password', 'Confirmar Contraseña', 'required|matches[password]');

        $data = array(
            'user_id' => 0,
            'email' => "",
            'name' => ""
        );

        //revisar reglas de validacion
        if (!$this->form_validation->run() == FALSE) {
            // el formulario es valido
            // obteniendo los datos de usuario
            $save = [
                "name" => $this->input->post('name'),
                "email" => $this->input->post('email'),
                "password" => hashPassword($this->input->post('password'))];

            $user_id = $this->User->insert($save);
            $user = $this->User->find($user_id);

            $data = array(
                'user_id' => $user->user_id,
                'email' => $user->email,
                'name' => $user->name,
                'avatar' => $user->avatar
            );
        } else {
            $data = array(
                'user_id' => 0,
                'email' => form_error('email'),
                'password' => form_error('confirm_password'),
                'name' => form_error('name')
            );
        }

        $this->response($data);
    }

    public function delete_session_get() {
        // $this->response(date('Y-m-d H:i:s', strtotime("-30 days")));
        //$this->response($this->User_token->findDayAgo());
        $this->User_token->deleteByDayAgo();
        $this->response(array("res" => "ok"));
    }

    public function is_login_get($token) {
        $res = "";
        $aux = $this->User_token->findByToken($token);
        if ($aux) {
            $res = $aux->token;
            $save = array(
                "update_at" => date('Y-m-d H:i:s')
            );
            $aux = $this->User_token->update($aux->token, $save);
        }

        $this->response(array("res" => $res));
    }

    public function cargar_avatar_post($user_id) {
        $this->upload_avatar($user_id);
    }

    private function upload_avatar($user_id) {

        // configuraciones sobre la carga del archivo
        $config['upload_path'] = 'uploads/avatar/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['overwrite'] = TRUE;
        $config['max_size'] = 20000;
        $config['file_name'] = "image_" . $user_id;

        // carga de la libreria
        $this->load->library('upload', $config);

        // intento de subida de la imagen
        if (!$this->upload->do_upload('image')) {
            // mostrar errores
            $this->response(array("res" => $this->upload->display_errors()));
        } else {
            // mostrar datos de la carga de la imagen
            $data = $this->upload->data();

            // actualizamos en base de datos
            $name = "image_" . $user_id . $data['file_ext'];

            $this->resize_image($data['full_path']);

            $save = array(
                "avatar" => $name
            );
            $this->User->update($user_id, $save);

            $this->response(array("res" => $name));
        }
    }

    private function resize_image($path_image) {
        $config['image_library'] = 'gd2';
        $config['source_image'] = $path_image;
        $config['maintain_ratio'] = TRUE;
        $config['width'] = 1000;
        $config['height'] = 1000;

        $this->load->library('image_lib', $config);

        $this->image_lib->resize();
    }

}

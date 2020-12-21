<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

    public function __construct() {
        parent::__construct();
    }

    /*
     * Vista para el login
     */

    public function index() {
        //echo hashPassword("12345");
        // echo verifyHashedPassword("12345s", hashPassword("12345"));

        if (!isLoggedIn()) {
            // que el usuario no esta autenticado
            $this->login();
            $this->load->view('user/login');
        } else //el usuario esta autenticado
            redirect("/core/dashboard");
    }

    /*/Library/WebServer/Documents/movie_rest/application/controllers/api/Users.php
     * Vista para el logout
     */

    public function logout() {

        // preguntamos por la uri string
        if ($this->uri->uri_string() == "login/logout") {
            show_404();
        }

        // destruimos la session y redireccionamos a login
        $this->session->sess_destroy();
        redirect("/login");
    }

    /*
     * Vista para el login privada - no se accede via HTTP
     */

    private function login() {
        
        // reglas de validacion
        $this->form_validation->set_rules('password', 'Password', 'required|max_length[20]');
        $this->form_validation->set_rules('email', 'Email', 'required|max_length[30]|valid_email|trim');

        //revisar reglas de validacion
        if ($this->form_validation->run() == FALSE) {
            
        } else {
            // el formulario es valido
            
            // obteniendo los datos de usuario
            $email = $this->input->post('email');
            $password = $this->input->post('password');

            //verificamos credenciales
            $user = $this->User->checkLogin($email, $password);

            if (is_object($user)) {
                $sessionUser = array(
                    'user_id' => $user->user_id,
                    'email' => $user->email,
                    'name' => $user->name
                );
                // sesion de usuario
                $this->session->set_userdata($sessionUser);
                $this->session->set_flashdata("msj", "Bienvenido $user->name");
                $this->session->set_flashdata("type", "success");

                // vamos al admin
                redirect("/core/dashboard");
            } else {
                // autenticacion fallo y mostramos mensajes de errores
                $this->session->set_flashdata("msj", "Email o contraseña incorrecta");
                $this->session->set_flashdata("type", "error");
               // echo "Email o contraseña incorrecta";
            }
        }
    }

}

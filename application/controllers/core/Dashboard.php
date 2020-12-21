<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    public function __construct() {
        parent::__construct();

        verifyAuth();
    }

    public function index() {
        redirect("/core/dashboard/movie_list");
    }

    public function movie_list() {

        // Capa de Modelo, carga la data  
        $data["movies"] = $this->Movie->findAll();

        // Capa de la Vista
        $view['body'] = $this->load->view("core/movies/list", $data, TRUE);
        $view['title'] = "Listado de películas";
        $this->parser->parse('core/templates/body', $view);
    }

    public function movie_save($movie_id = null) {

        // Capa de Modelo, carga la data  
        // por el metodo de HTTP

        $vdata["movie_id"] = $vdata["type_movie_id"] = $vdata["name"] = $vdata["year"] = $vdata["description"] = $vdata["image"] = "";

        $vdata["types_movie"] = type_movies_to_form($this->Type_movie->findAll());

        if ($movie_id != null) {
            $movie = $this->Movie->find($movie_id);

            if (is_object($movie)) {
                $vdata["name"] = $movie->name;
                $vdata["year"] = $movie->year;
                $vdata["description"] = $movie->description;
                $vdata["image"] = $movie->image;
                $vdata["type_movie_id"] = $movie->type_movie_id;
                $vdata["movie_id"] = $movie->movie_id;
            }
        }

        if ($this->input->server("REQUEST_METHOD") == "POST") {

            // reglas de validacion
            $this->form_validation->set_rules('name', 'Nombre', 'required|min_length[3]');
            $this->form_validation->set_rules('description', 'Descripción', 'required|min_length[10]');
            $this->form_validation->set_rules('year', 'Año', 'required');

            // obteniendo los datos del formulario
            $save["name"] = $vdata["name"] = $this->input->post("name");
            $save["year"] = $vdata["year"] = $this->input->post("year");
            $save["description"] = $vdata["description"] = $this->input->post("description");
            $save["type_movie_id"] = $vdata["type_movie_id"] = $this->input->post("type_movie_id");

            //revisar reglas de validacion
            if ($this->form_validation->run() == FALSE) {
                
            } else {
                if ($movie_id == null)
                    $movie_id = $this->Movie->insert($save);
                else
                    $this->Movie->update($movie_id, $save);

                $save = array("image" => $this->do_upload());
                $this->Movie->update($movie_id, $save);

                $this->session->set_flashdata("msj", "Película guardada");
                $this->session->set_flashdata("type", "success");

               // redirect("/core/dashboard/movie_save/$movie_id");
            }
        }

        // Capa de la Vista
        $view['body'] = $this->load->view("core/movies/save", $vdata, TRUE);
        $view['title'] = "Registrar película";
        $this->parser->parse('core/templates/body', $view);
    }

    function movie_delete_image($movie_id = null) {
        if (!isset($movie_id)) {
            show_404();
        }

        $movie = $this->Movie->find($movie_id);

        if (!isset($movie)) {
            show_404();
        }

        if ($movie->image !== "") {
            unlink("uploads/movies/$movie->image");

            $save["image"] = "";

            $this->Movie->update($movie_id, $save);

            $this->session->set_flashdata("msj", "Imagen eliminada");
            $this->session->set_flashdata("type", "success");

            redirect("/core/dashboard/movie_save/$movie->movie_id");
        }
    }

    public function image_promotional() {

        // Capa de Modelo, carga la data  
        // por el metodo de HTTP

        $api = $this->Api->findByTag("IMAGE_PROMOTIONAL");
        $vdata["image"] = $api->value;

        if ($this->input->server("REQUEST_METHOD") == "POST") {
            $save = array("value" => $this->do_upload('api'));
            $this->Api->update($api->api_id, $save);
        }

        // Capa de la Vista
        $view['body'] = $this->load->view("core/api/image_promotional/save", $vdata, TRUE);
        $view['title'] = "Registrar película";
        $this->parser->parse('core/templates/body', $view);
    }

    public function movie_show($movie_id = null) {

        // Capa de Modelo, carga la data  
        // por el metodo de HTTP

        if ($movie_id == null) {
            show_404();
        }

        $movie = $this->Movie->find($movie_id);

        if (!is_object($movie)) {
            show_404();
        }

        $vdata["name"] = $movie->name;
        $vdata["year"] = $movie->year;
        $vdata["description"] = $movie->description;
        $vdata["image"] = $movie->image;

        // Capa de la Vista
        $view['body'] = $this->load->view("core/movies/show", $vdata, TRUE);
        $view['title'] = "Mostrar película: " . $movie->name;
        $this->parser->parse('core/templates/body', $view);
    }

    public function movie_delete($movie_id) {

        $this->Movie->delete($movie_id);

        echo 1;
    }

    /* CRUD para tipos de peliculas */

    public function type_movie_list() {

        // Capa de Modelo, carga la data  
        $data["types_movie"] = $this->Type_movie->findAll();

        // Capa de la Vista
        $view['body'] = $this->load->view("core/types_movie/list", $data, TRUE);
        $view['title'] = "Listado de tipos de películas";
        $this->parser->parse('core/templates/body', $view);
    }

    public function type_movie_save($type_movie_id = null) {

        // Capa de Modelo, carga la data  
        // por el metodo de HTTP

        $vdata["name"] = "";

        if ($type_movie_id != null) {
            $type_movie = $this->Type_movie->find($type_movie_id);

            if (is_object($type_movie)) {
                $vdata["name"] = $type_movie->name;
            }
        }

        if ($this->input->server("REQUEST_METHOD") == "POST") {

            // reglas de validacion
            $this->form_validation->set_rules('name', 'Nombre', 'required|min_length[3]');

            // obteniendo los datos del formulario
            $save["name"] = $vdata["name"] = $this->input->post("name");

            //revisar reglas de validacion
            if ($this->form_validation->run() == FALSE) {
                
            } else {
                if ($type_movie_id == null)
                    $type_movie_id = $this->Type_movie->insert($save);
                else
                    $this->Type_movie->update($type_movie_id, $save);

                $this->session->set_flashdata("msj", "Tipo guardado");
                $this->session->set_flashdata("type", "success");

                redirect("/core/dashboard/type_movie_save/$type_movie_id");
            }
        }

        // Capa de la Vista
        $view['body'] = $this->load->view("core/types_movie/save", $vdata, TRUE);
        $view['title'] = "Registrar tipos de películas";
        $this->parser->parse('core/templates/body', $view);
    }

    public function type_movie_show($type_movie_id = null) {

        // Capa de Modelo, carga la data  
        // por el metodo de HTTP

        if ($type_movie_id == null) {
            show_404();
        }

        $type_movie = $this->Type_movie->find($type_movie_id);

        if (!is_object($type_movie)) {
            show_404();
        }

        $vdata["name"] = $type_movie->name;

        // Capa de la Vista
        $view['body'] = $this->load->view("core/types_movie/show", $vdata, TRUE);
        $view['title'] = "Mostrar película: " . $type_movie->name;
        $this->parser->parse('core/templates/body', $view);
    }

    public function type_movie_delete($type_movie_id) {

        $this->Type_movie->delete($type_movie_id);

        echo 1;
    }

    private function do_upload($uri = "movies") {

        // configuraciones sobre la carga del archivo
        $config['upload_path'] = 'uploads/' . $uri;
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = 20000; //20 mb = 20000 kilobyte
        $config['max_width'] = 3840;
        $config['max_height'] = 2160;
        $config['file_name'] = time() . "_" . $_FILES['image']['name'];

        // carga de la libreria
        $this->load->library('upload', $config);

        // intento de subida de la imagen
        if (!$this->upload->do_upload('image')) {
            // mostrar errores
            return $this->upload->display_errors();
        } else {
            // mostrar datos de la carga de la imagen
            $data = $this->upload->data();

            // actualizamos en base de datos
            $name = $data['file_name'];

            $this->resize_image($data['full_path']);

            return $name;
        }
    }

    private function resize_image($path_image) {
        $config['image_library'] = 'gd2';
        $config['source_image'] = $path_image;
        $config['maintain_ratio'] = FALSE;
        $config['width'] = 900;
        $config['height'] = 500;

        $this->load->library('image_lib', $config);

        $this->image_lib->resize();
    }

}

<?php

use Restserver\Libraries\REST_Controller;

require APPPATH . '/libraries/REST_Controller.php';
require APPPATH . '/libraries/Format.php';

class Movies extends REST_Controller {

    public function show_get($id = null) {

        if (isset($id)) {
            $data = $this->Movie->find($id);
            // TODO TOKEN
            if ($this->input->get("user_id") != "" && $this->input->get("user_id") != NULL) {
                $data->favorite = $this->Movie_favorite->findByUserIdAndMovieId($this->input->get("user_id"), $id);
                $data->qualification = $this->Movie_qualification->findByUserIdAndMovieId($this->input->get("user_id"), $id);
            }
            $data->favorites = $this->Movie_favorite->findByMovieId($id);
            $data->qualifications = $this->Movie_qualification->findByMovieId($id);
            $data->average = $this->Movie_qualification->averageByMovieId($id);
        } else {
            // busqueda
            $name = $this->input->get("name");
            $search = explode(" ", $name);

            // filtros
            $type_movie_id = $this->input->get("type_movie_id");
            $year = $this->input->get("year");

            // paginacion
            $offset = $this->input->get("offset");

            $data = $this->Movie->findRecords($search, $type_movie_id, $year, $offset);
        }

        $this->response($data);
    }

    public function types_movie_get() {
        $this->response($this->Type_movie->findAll());
    }

    public function image_promotional_get() {

        $api = $this->Api->findByTag("IMAGE_PROMOTIONAL");

        $this->response(array("res" => $api->value));
    }

    public function favorite_get() {



        if ($this->input->get("user_id") != "" &&
                $this->input->get("user_id") != NULL) {

            // TODO: falta validacion con el token

            $data = $this->Movie_favorite->findByUserIdAndMovieId($this->input->get("user_id"), $this->input->get("movie_id"));
        } else {
            $data = $this->Movie_favorite->findByMovieId($this->input->get("movie_id"));
        }

        $this->response($data);
    }

    public function qualification_get() {



        if ($this->input->get("user_id") != "" &&
                $this->input->get("user_id") != NULL) {

            // TODO: falta validacion con el token

            $data = $this->Movie_qualification->findByUserIdAndMovieId($this->input->get("user_id"), $this->input->get("movie_id"));
        } else {
            $data = $this->Movie_qualification->findByMovieId($this->input->get("movie_id"));
        }

        $this->response($data);
    }

    public function user_qualification_get($movie_id) {
        $data = $this->User->findByMovieId($movie_id);
        $this->response($data);
    }

    public function favorite_post() {

        // TODO: falta validacion con el token
        if (!compareTokenAuth($this->input->post("token"))) {
            return;
        }

        $favorite = $this->Movie_favorite->findByUserIdAndMovieId($this->input->post("user_id"), $this->input->post("movie_id"));

        if ($this->input->post("favorite") == 1 && !is_object($favorite)) {

            $save = array(
                "user_id" => $this->input->post("user_id"),
                "movie_id" => $this->input->post("movie_id")
            );

            $this->Movie_favorite->insert($save);
        } else if ($this->input->post("favorite") == 0) {
            $this->Movie_favorite->deleteByUserIdAndMovieId($this->input->post("user_id"), $this->input->post("movie_id"));
        }

        $this->response(array("res" => "ok"));
    }

    public function qualification_post() {

        if (!compareTokenAuth($this->input->post("token"))) {
            return;
        }

        $qualification = $this->Movie_qualification->findByUserIdAndMovieId($this->input->post("user_id"), $this->input->post("movie_id"));

        $save = array(
            "user_id" => $this->input->post("user_id"),
            "movie_id" => $this->input->post("movie_id"),
            "qualification" => $this->input->post("qualification")
        );


        if (is_object($qualification)) {
            $this->Movie_qualification->update($qualification->movie_qualification_id, $save);
        } else {
            $this->Movie_qualification->insert($save);
        }

        $save = array(
            "user_id" => $this->input->post("user_id"),
            "movie_id" => $this->input->post("movie_id"),
            "qualification" => $this->input->post("qualification")
        );

        $this->response(array("res" => $this->Movie_qualification->averageByMovieId($this->input->post("movie_id"))));
    }
  
}

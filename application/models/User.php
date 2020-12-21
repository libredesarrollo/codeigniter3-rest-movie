<?php

class User extends MY_Model {

    public function __construct() {
        parent::__construct();
    }

    public $table = "users";
    public $table_id = "user_id";

    function checkLogin($email, $plainPassword) {
        $this->db->select();
        $this->db->from($this->table);
        $this->db->where("email", $email);
        $query = $this->db->get();
        $user = $query->row();

        if (!empty($user)) {
            if (verifyHashedPassword($plainPassword, $user->password)) {
                return $user;
            }
        }

        return null;
    }

    function findRecords($search = array(), $type_movie_id = null, $year = null, $offset = 0) {
        $this->db->select("m.*, tm.name as type_movie");
        $this->db->from("$this->table as m");
        $this->db->join('types_movie as tm', 'tm.type_movie_id = m.type_movie_id', 'LEFT');


        //*** busqueda
        foreach ($search as $key => $token) {
            $this->db->like('m.name', $token);
        }

        //*** filtros
        if (isset($type_movie_id)) {
            $this->db->where('tm.type_movie_id', $type_movie_id);
        }
        if (isset($year)) {
            $this->db->where('year', $year);
        }

        $this->db->limit(PAGE_SIZE, $offset);

        $query = $this->db->get();
        return $query->result();
    }

    function findAll() {
        $this->db->select("m.*, tm.name as type_movie");
        $this->db->from("$this->table as m");
        $this->db->join('types_movie as tm', 'tm.type_movie_id = m.type_movie_id', 'LEFT');

        $query = $this->db->get();
        return $query->result();
    }

    function findByMovieId($movie_id) {
        $this->db->select("u.name, u.email, u.user_id");
        $this->db->from("$this->table as u");
        $this->db->join('movie_qualifications as mq', 'mq.user_id = u.user_id');
        $this->db->where("mq.movie_id", $movie_id);

        $query = $this->db->get();
        return $query->result();
    }

}

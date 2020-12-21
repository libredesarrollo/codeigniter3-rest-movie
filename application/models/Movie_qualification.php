<?php

class Movie_qualification extends MY_Model {

    public function __construct() {
        parent::__construct();
    }

    public $table = "movie_qualifications";
    public $table_id = "movie_qualification_id";

    function findByuserIdAndMovieId($userId, $movieId) {
        $this->db->select();
        $this->db->from($this->table);
        $this->db->where("user_id", $userId);
        $this->db->where("movie_id", $movieId);

        $query = $this->db->get();
        return $query->row();
    }

    function findByMovieId($movieId) {
        $this->db->select("mq.*, u.name, u.avatar");
        $this->db->from("$this->table as mq");
        $this->db->join('users as u', 'mq.user_id = u.user_id');
        $this->db->where("movie_id", $movieId);

        $query = $this->db->get();
        return $query->result();
    }

    function averageByMovieId($movieId) {
        $this->db->select("ROUND(AVG(qualification),1) as average");
        $this->db->from($this->table);
        $this->db->where("movie_id", $movieId);

        $query = $this->db->get();
        return $query->row();
    }

}

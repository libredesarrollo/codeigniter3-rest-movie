<?php

class Api extends MY_Model {

    public function __construct() {
        parent::__construct();
    }

    public $table = "api";
    public $table_id = "api_id";

    function findByTag($tag) {
        $this->db->select();
        $this->db->from($this->table);
        $this->db->where("tag", $tag);

        $query = $this->db->get();
        return $query->row();
    }

}

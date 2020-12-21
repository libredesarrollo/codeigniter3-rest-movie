<?php

class User_token extends MY_Model {

    public function __construct() {
        parent::__construct();
    }

    public $table = "user_tokens";
    public $table_id = "token";

    function findByToken($token) {
        $this->db->select();
        $this->db->from($this->table);
        $this->db->where("token", $token);

        $query = $this->db->get();
        return $query->row();
    }

    function findDayAgo($days = 30) {
        $this->db->select();
        $this->db->from($this->table);
        $this->db->where("update_at <=", date('Y-m-d H:i:s', strtotime("-$days days")));

        $query = $this->db->get();
        return $query->result();
    }

    function deleteByDayAgo($days = 30) {
        $this->db->where("update_at <=", date('Y-m-d H:i:s', strtotime("-$days days")));
        $this->db->delete($this->table);
    }

}

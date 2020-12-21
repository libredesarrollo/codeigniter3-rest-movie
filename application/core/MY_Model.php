<?php

class MY_Model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
    }

    function findAll() {
        $this->db->select();
        $this->db->from($this->table);

        $query = $this->db->get();
        return $query->result();
    }

    function find($id) {
        $this->db->select();
        $this->db->from($this->table);
        $this->db->where($this->table_id, $id);

        $query = $this->db->get();
        return $query->row();
    }

    function update($id, $data) {
        $this->db->where($this->table_id, $id);
        $this->db->update($this->table, $data);
    }

    function delete($id) {
        $this->db->where($this->table_id, $id);
        $this->db->delete($this->table);
    }

    function insert($data) {
        $this->db->insert($this->table, $data);
        return $this->db->insert_id();
    }
    
    function count(){
        $count = $this->db->query("SELECT $this->table_id FROM $this->table");
        return $count->num_rows();
    }

}

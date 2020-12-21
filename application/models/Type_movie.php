<?php

class Type_movie extends MY_Model {
    public function __construct() {
        parent::__construct();
    }
    
    public $table = "types_movie";
    public $table_id = "type_movie_id";
    
}
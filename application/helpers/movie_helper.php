<?php

/*
 * Convierte un texto plano a hash
 */

if (!function_exists('type_movies_to_form')) {

    function type_movies_to_form($types_movies) {

        $aTypeMovie = array();

        foreach ($types_movies as $key => $tm) {
            $aTypeMovie[$tm->type_movie_id] = $tm->name;
        }

        return $aTypeMovie;
    }

}

<?php

/*
 * Convierte un texto plano a hash
 */

if (!function_exists('hashPassword')) {

    function hashPassword($plainPassword) {
        return password_hash($plainPassword, PASSWORD_DEFAULT);
    }

}

/*
 * Verifica el hash
 */

if (!function_exists('verifyHashedPassword')) {

    function verifyHashedPassword($plainPassword, $hashPassword) {
        return password_verify($plainPassword, $hashPassword) ? TRUE : FALSE;
    }

}

/*
 * Verifica si el usuario esta autenticado
 */

if (!function_exists('isLoggedIn')) {

    function isLoggedIn() {

        $CI = & get_instance();

        $user_id = $CI->session->userdata('user_id');

        if (!isset($user_id)) {
            return false;
        }
        return true;
    }

}


/*
 * Verifica si el usuario esta autenticado y actua en concencuencia
 */

if (!function_exists('verifyAuth')) {

    function verifyAuth() {
        if (!isLoggedIn()) {
            redirect("/login");
        }
    }

}

/*
 * Generar token auth
 */

if (!function_exists('generateTokenAuth')) {

    function generateTokenAuth($size = 50) {
        return bin2hex(openssl_random_pseudo_bytes($size));
    }

}

/*
 * Comparar token auth
 */

if (!function_exists('compareTokenAuth')) {

    function compareTokenAuth($token) {

        $CI = & get_instance();

        return $CI->User_token->findByToken($token) !== null;

    }

}
<?php

defined('SYSPATH') or die('No direct script access.');

/**
 * commetn Model
 * Handles CRUD for user messages
 */
class Model_Base extends Kohana_ORM {

    protected $_table_name = 'users';
    protected $_primary_key = 'id';

    /**
     * Получение пользователя или пользователей по id
     * 
     * @param type $users_id
     */
    public function getUsersById($user_id = '') {
        $query = DB::select('user_info.id', 'user_info.user_id', 'user_info.fio')
                ->from('users')
                ->where('users.id', '=', $user_id)
                ->join('user_info')
                ->on('users.id', '=', 'user_info.user_id')
                ->limit(1)
                ->execute()
                ->as_array();


        if ($query) {
            $query = $query[0];
            return $query;
        } else {
            return FALSE;
        }
    }

    function RusToLat($string) {
        static $lang2tr = array(
// russian
    'й' => 'j', 'ц' => 'c', 'у' => 'u', 'к' => 'k', 'е' => 'e', 'н' => 'n', 'г' => 'g', 'ш' => 'sh',
    'щ' => 'sh', 'з' => 'z', 'х' => 'h', 'ъ' => '', 'ф' => 'f', 'ы' => 'y', 'в' => 'v', 'а' => 'a',
    'п' => 'p', 'р' => 'r', 'о' => 'o', 'л' => 'l', 'д' => 'd', 'ж' => 'zh', 'э' => 'e', 'я' => 'ja',
    'ч' => 'ch', 'с' => 's', 'м' => 'm', 'и' => 'i', 'т' => 't', 'ь' => '', 'б' => 'b', 'ю' => 'ju', 'ё' => 'e', 'и' => 'i',
    'Й' => 'J', 'Ц' => 'C', 'У' => 'U', 'К' => 'K', 'Е' => 'E', 'Н' => 'N', 'Г' => 'G', 'Ш' => 'SH',
    'Щ' => 'SH', 'З' => 'Z', 'Х' => 'H', 'Ъ' => '', 'Ф' => 'F', 'Ы' => 'Y', 'В' => 'V', 'А' => 'A',
    'П' => 'P', 'Р' => 'R', 'О' => 'O', 'Л' => 'L', 'Д' => 'D', 'Ж' => 'ZH', 'Э' => 'E', 'Я' => 'JA',
    'Ч' => 'CH', 'С' => 'S', 'М' => 'M', 'И' => 'I', 'Т' => 'T', 'Ь' => '', 'Б' => 'B', 'Ю' => 'JU', 'Ё' => 'E', 'И' => 'I',
    // special
    ' ' => '-', '\'' => '', '"' => '', '\t' => '', '«' => '', '»' => '', '?' => '', '!' => '', '*' => ''
        );
        $url = preg_replace('/[\-]+/', '-', preg_replace('/[^\w\-\*]/', '', strtolower(strtr($string, $lang2tr))));

        return $url;
    }

}
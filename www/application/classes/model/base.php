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
    public function getUsersById($user_id) {
        $query = DB::select('*')
                ->from('users')
                ->where('users.id', '=', $user_id)
                ->join('user_info')
                ->on('users.id', '=', 'user_info.user_id')
                ->execute()
                ->as_array();

        if ($query)
            return $query;
        else
            return array();
    }

}
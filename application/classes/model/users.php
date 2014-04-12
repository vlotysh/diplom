<?php

defined('SYSPATH') or die('No direct script access.');

class Model_Users extends Model {
    
    public function find_all($limit = 10,$offset = 0) {
        $query = DB::select('users.id','users.email','users.username','users.avatar','users.last_activity','user_info.fio')
                ->from('users')
                ->join('user_info')
                ->on('users.id', '=', 'user_info.user_id')              
                ->order_by('user_info.fio')
                ->offset($offset)
                ->limit($limit)
                ->execute()
                ->as_array();
        
        return $query;
    }
    
     public function find_users($user_name = '') {
         $query = DB::select('users.id','users.email','users.username','users.avatar','users.last_activity','user_info.fio')
                ->from('users')
                ->join('user_info')
                ->on('users.id', '=', 'user_info.user_id')
                ->order_by('user_info.fio')
                ->where('user_info.fio', 'LIKE', '%'.$user_name.'%')
                ->execute()
                ->as_array();
        
        return $query;
     }
}
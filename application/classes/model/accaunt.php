<?php

defined('SYSPATH') or die('No direct script access.');

class Model_Accaunt extends Model {

    public function add_user($data) {
        $user = ORM::factory('user'); 
        $user['active'] = 0;
        $id = $user->create_user($data, array('username', 'email', 'password','active'));
        $role = ORM::factory('role')->where('name', '=', 'login')->find();

        $query = DB::insert('user_info', array('user_id', 'fio'))
                ->values(array($id, $data['username']))
                ->execute();

        if(!$query) {
            return FALSE;
        }
        $user->add('roles', $role);
        $data['complate'] = TRUE;
        
        return true;

    }
    
    public function activate_user($data) {
        
    }

    

}

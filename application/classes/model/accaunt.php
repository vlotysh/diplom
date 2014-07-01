<?php

defined('SYSPATH') or die('No direct script access.');

class Model_Accaunt extends Model {

    public function add_user($data) {
         $user = ORM::factory('user'); 
        
        $id = $user->create_user($data, array('username', 'email', 'password'));
        $role = ORM::factory('role')->where('name', '=', 'login')->find();

        $query = DB::insert('user_info', array('user_id', 'fio'))
                ->values(array($id, $data['username']))
                ->execute();

        if(!$query) {
            exit();
        }
        $user->add('roles', $role);
        $data['complate'] = TRUE;

        $config = Kohana::$config->load('email');

        Email::connect($config);

        $to = $data['email'];
        $subject = 'Сообщение от Коханой..т.е. Коханы.';
        $from = 'admin@edusystem.in.ua';

        $message = View::factory('email')->set('content', 'Вы успешно зарагестрированны!')->render();

        $res = Email::send($to, $from, $subject, $message, $html = true);


    }

    

}

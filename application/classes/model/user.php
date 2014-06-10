<?php defined('SYSPATH') or die('No direct script access.');

class Model_User extends Model_Auth_User {

public function labels()
{
    return array(
        'username' => 'Логин',
        'email' => 'Электронная почта',
        'name' => 'Имя',
        'password' => 'Пароль',
        'password_confirm' => 'Повторить пароль',
        'sex' => 'Пол',
        'birth_date' => 'Дата рождения',
        'land' => 'Страна',
        'city' => 'Город',
        'work' => 'Род занятий',
        'about' => 'О себе',
        'status' => 'Статус',
        'image' => 'Аватар'
    );
}

public function rules()
{
    return array(
        'username' => array(
            array('not_empty'),
            array('min_length', array(':value', 4)),
            array('max_length', array(':value', 32)),
            array('regex', array(':value', '/^[-\pL\pN_.]++$/uD')),
            array(array($this, 'unique'), array('username', ':value')),
        ),
        'password' => array(
            array('min_length', array(':value', 6)),
            array('not_empty'),
        ),
        'email' => array(
            array('not_empty'),
            array('min_length', array(':value', 6)),
            array('max_length', array(':value', 127)),
            array('email'),
            array(array($this, 'unique'), array('email', ':value')),
        ),
    );
}
public function filters()
{
    return array(
        TRUE => array(
            array('trim'),
        ),
        TRUE => array(
            array('strip_tags'),
        )
    );
}
}
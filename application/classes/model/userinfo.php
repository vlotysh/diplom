<?php

defined('SYSPATH') or die('No direct script access.');

class Model_Userinfo extends Model_Base {
    protected $_table_name = 'user_info';
    protected $_table_columns = array(
        'user_id' => 'fio',
        'file' => 'info',
    
    );
}
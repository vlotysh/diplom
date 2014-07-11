<?php

defined('SYSPATH') or die('No direct access allowed.');

/**
 * Extending the HTML helper class
 */
class Ajax {
    
    static function setResponse($array) {
        if(is_array($array)) {
            $GLOBALS['ajax'] = $array;
        }
    }
}
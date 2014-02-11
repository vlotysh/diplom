<?php

defined('SYSPATH') or die('No direct access allowed.');

/**
 * Extending the HTML helper class
 */
class HTML extends Kohana_HTML {

    /**
     * Format a message in a div with spans for author and fuzzy time
     * 
     * @param string The content of the message
     * @param string The author of the message
     * @param int The timestamp the message was published
     * @return string
     * @uses HTML::chars
     * @uses Date::fuzzy_span
     */
    public static function rusTime($time) {
        
        $date=explode(" ", date('j m',$time));

        switch ($date[1]) {
            case 1: $m = 'Января';
                break;
            case 2: $m = 'Февраля';
                break;
            case 3: $m = 'Марта';
                break;
            case 4: $m = 'Апреля';
                break;
            case 5: $m = 'Мая';
                break;
            case 6: $m = 'Июня';
                break;
            case 7: $m = 'Июля';
                break;
            case 8: $m = 'Августа';
                break;
            case 9: $m = 'Сентября';
                break;
            case 10: $m = 'Октября';
                break;
            case 11: $m = 'Ноября';
                break;
            case 12: $m = 'Декабря';
                break;
        }
        
       return $date[0].'&nbsp;'.$m.'&nbsp;'.date('H:i:s',$time);
    }

    public static function message($content, $author, $timestamp) {
        $formatted = '<div class="message">';
        $formatted .= self::chars($content);
        $formatted .= '<span class="author">' . self::chars($author) . '</span>';
        $formatted .= '<span class="published">' . Date::fuzzy_span($timestamp) . '</span>';
        $formatted .= '</div>';
        return $formatted;
    }

}

<?php

defined('SYSPATH') or die('No direct script access.');

class Model_File extends Model_Base {

    protected $_table_name = 'files';
    protected $_table_columns = array(
        'user_id' => 'user_id',
        'file' => 'file',
        'src' => 'src',
        'type' => 'type',
        'size' => 'size',
        'date' => 'date',
    );

    /**
     * Label definitions for validation
     *
     * @return array
     */
    public function labels() {
        return array(
            'file' => 'File',
            'description' => 'Description',
        );
    }

    /**
     * Filter definitions for validation
     *
     * @return array
     */
    public function filters() {
        return array(
            TRUE => NULL,
            'description', array(
                array('trim'),
            ),
        );
    }

    /**
     * Rule definitions for validation
     *
     * @return array
     */
    public function rules() {
        return array(
            'file' => array(
               array('Upload::valid'),
                array('Upload::not_empty'),
                array('Upload::type', array(':value', array('jpg', 'jpeg', 'png','rar','gif', 'zip', 'pdf', 'doc', 'docx', 'xls','bmp'))),
                array(array($this, 'file_save'), array(':value'))
            ),
        );
    }

    private function uploads_dir() {
        if (!is_dir(DOCROOT.'uploads/' . date('Ym'))) {
           mkdir(DOCROOT.'uploads/' . date('Ym'));
           chmod(DOCROOT.'uploads/' . date('Ym'),0777);
        }
        return DOCROOT.'uploads/' . date('Ym') . DIRECTORY_SEPARATOR;
    }

    public function file_save($file) {
        
       
        // upload file
        $uploaded = Upload::save($file, $file['name'], $this->uploads_dir());

        // if uploaded set file name to save to database
        if ($uploaded) {
            
             $this->set('user_id', Auth::instance()->get_user()->id);
            // set file name
            $this->set('file', $file['name']);

            $this->set('src', ('uploads'. '/' . date('Ym')).'/'.$file['name']);
            // set file type
            $this->set('type', strtolower(pathinfo($file['name'], PATHINFO_EXTENSION)));

            // set file size
            $this->set('size', $file['size']);
            
            // set time size
            $this->set('date', time());
            
         
       
        }

        // return result
        return $uploaded;
    }

}
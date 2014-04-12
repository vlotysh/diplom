<?php

/**
 * The directory in which your application specific resources are located.
 * The application directory must contain the bootstrap.php file.
 * Папка в, которой находятся ваши приложения
 * Эта директория должна содержать файл bootstrap.php
 * @see  http://kohanaframework.org/guide/about.install#application
 */
$application = 'application';
//$application = '../../../k3/ko_ap';

/**
 * The directory in which your modules are located.
 * Папка, в которой находятся ваши модули
 * @see  http://kohanaframework.org/guide/about.install#modules
 */
$modules = 'modules';
//$modules = '../../../k3/modules';

/**
 * The directory in which the Kohana resources are located. The system
 * directory must contain the classes/kohana.php file.
 * Папка ядра фреймворка, должна содержать файл classes/kohana.php
 * @see  http://kohanaframework.org/guide/about.install#system
 */
$system = 'system';
 //$system = '../../../k3/system';
/**
 * The default extension of resource files. If you change this, all resources
 * must be renamed to use the new extension.
 * Расширение по-умолчанию для файлов исходных кодов. Если его
 * именить, придеся изменять расширения всех файлов.
 * @see  http://kohanaframework.org/guide/about.install#ext
 */
define('EXT', '.php');

/**
 * Set the PHP error reporting level. If you set this in php.ini, you remove this.
 * @see  http://php.net/error_reporting
 * Устанавливает уровень выдачи отчетов об ошибках
 * When developing your application, it is highly recommended to enable notices
 * and strict warnings. Enable them by using: E_ALL | E_STRICT
 * В процессе разработки рекомендуется: E_ALL | E_STRICT
 * In a production environment, it is safe to ignore notices and strict warnings.
 * Disable them by using: E_ALL ^ E_NOTICE
 * Для рабочего приложения: E_ALL ^ E_NOTICE
 * When using a legacy application with PHP >= 5.3, it is recommended to disable
 * deprecated notices. Disable with: E_ALL & ~E_DEPRECATED
 */
error_reporting(E_ALL | E_STRICT);

/**
 * End of standard configuration! Changing any of the code below should only be
 * attempted by those with a working knowledge of Kohana internals.
 * Здесь заканчивается стандартная конфигурация! Далее идет код, изменяя который,
 * вы должны разбираться в устройстве и работе фреймворка!
 * @see  http://kohanaframework.org/guide/using.configuration
 */

// Set the full path to the docroot Установка полного пути к DOCROOT
define('DOCROOT', realpath(dirname(__FILE__)).DIRECTORY_SEPARATOR);

// Make the application relative to the docroot, for symlink'd index.php
if ( ! is_dir($application) AND is_dir(DOCROOT.$application))
	$application = DOCROOT.$application;

// Make the modules relative to the docroot, for symlink'd index.php
if ( ! is_dir($modules) AND is_dir(DOCROOT.$modules))
	$modules = DOCROOT.$modules;

// Make the system relative to the docroot, for symlink'd index.php
if ( ! is_dir($system) AND is_dir(DOCROOT.$system))
	$system = DOCROOT.$system;

// Define the absolute paths for configured directories
define('APPPATH', realpath($application).DIRECTORY_SEPARATOR);
define('MODPATH', realpath($modules).DIRECTORY_SEPARATOR);
define('SYSPATH', realpath($system).DIRECTORY_SEPARATOR);

// Clean up the configuration vars
//Очистка конфигурационных переменных
unset($application, $modules, $system);

if (file_exists('install'.EXT))
{
	// Load the installation check
        // Проверка наличия файла инсталляции
	return include 'install'.EXT;
}

/**
 * Define the start time of the application, used for profiling.
 * Определение время запуска приложения
 */
if ( ! defined('KOHANA_START_TIME'))
{
	define('KOHANA_START_TIME', microtime(TRUE));
}

/**
 * Define the memory usage at the start of the application, used for profiling.
 * Определение использования памяти приложения при запуске
 */
if ( ! defined('KOHANA_START_MEMORY'))
{
	define('KOHANA_START_MEMORY', memory_get_usage());
}

// Bootstrap the application
// Загрузчик приложения
require APPPATH.'bootstrap'.EXT;

/**
 * Execute the main request. A source of the URI can be passed, eg: $_SERVER['PATH_INFO'].
 * If no source is specified, the URI will be automatically detected.
 * Выполнение главного запроса
 */
echo Request::factory()
	->execute()
	->send_headers()
	->body();

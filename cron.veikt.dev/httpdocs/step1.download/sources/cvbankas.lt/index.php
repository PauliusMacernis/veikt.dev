<?php

define('WELCOME_PAGE_URL', 'http://www.cvbankas.lt/darbo-skelbimai');
define('PAGE_X_URL', 'http://www.cvbankas.lt/darbo-skelbimai?page={$X}'); // e.g. http://www.cvbankas.lt/darbo-skelbimai?page=1
define('PAGE_TO_START_FROM', 1); // e.g. start fetching from page number ... e.g.: if 1 then http://www.cvbankas.lt/darbo-skelbimai?page=1
define('ENCODING', 'UTF-8'); // No changes unless changing in the whole system!!!

require_once 'Config.php';
require_once 'Job.php';
require_once 'DataManipulation.php';

//echo '<!doctype html><html lang=lt><head><meta charset=utf-8></head><body>';


$Config = new Config();
$DataManipulation = new DataManipulation();

//$DataManipulation->debugProcess('Open application.');
$EntirePage = $DataManipulation->getURLDomContent(WELCOME_PAGE_URL);

$min_page_number = $DataManipulation->getMinPageNumber($EntirePage);
$max_page_number = $DataManipulation->getMaxPageNumber($EntirePage);

$jobs = array();
for($i = $min_page_number; $i <= $max_page_number; $i++) {
    //$DataManipulation->debugProcess('Start getting content of ' . str_replace('{$X}', $i, PAGE_X_URL));
    
    sleep($Config->delay);
    $EntirePage = $DataManipulation->getURLDomContent(str_replace('{$X}', $i, PAGE_X_URL));
    $DataManipulation->getJobsFromPage($EntirePage, $jobs);

    //$DataManipulation->debugProcess('End getting content of ' . str_replace('{$X}', $i, PAGE_X_URL));
}

//$DataManipulation->debugProcess('Close application.');


//echo '<br /><br />Results:<br />';
$counter = 0; // aka. id
foreach($jobs as $Job) {
    $counter++;

    $dirToOutput = '.' . DIRECTORY_SEPARATOR . 'posts' . DIRECTORY_SEPARATOR . $counter;
    if(!is_dir($dirToOutput)) {
        mkdir($dirToOutput, 0777, true);
    }

    $fp = fopen($dirToOutput . DIRECTORY_SEPARATOR . 'url', 'w');
    fwrite($fp, $Job->url);
    fclose($fp);

    $fp = fopen($dirToOutput . DIRECTORY_SEPARATOR . 'html', 'w');
    fwrite($fp, $Job->url_html);
    fclose($fp);

    $fp = fopen($dirToOutput . DIRECTORY_SEPARATOR . 'statistics', 'w');
    fwrite($fp, $Job->url_statistics);
    fclose($fp);

    //echo '<hr />';
    //echo '<hr />';
    //echo $Job->url_statistics . '<br />';
    //echo $Job->url_html . '<br />';
}

//$DataManipulation->debugProcess('Found: ' . count($jobs) . ' result(s).');
//echo '</body>';

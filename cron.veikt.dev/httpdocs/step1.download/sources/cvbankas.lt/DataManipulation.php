<?php
/**
 * Created by PhpStorm.
 * User: Paulius
 * Date: 2015-08-08
 * Time: 21:08
 */

class DataManipulation {

//////////

    public function get_inner_html( $node ) {
        $innerHTML= '';
        $children = $node->childNodes;
        foreach ($children as $child) {
            $innerHTML .= $child->ownerDocument->saveXML( $child );
        }

        return $innerHTML;
    }

    public function getURLDomContent($url){

        $doc = new DOMDocument;
        $doc->preserveWhiteSpace = FALSE;

        // Create a stream
        $options = array(
            'http' => array(
                'method' => "GET",
                'header' => "Accept-language: en\r\n" .
                    "Cookie: foo=bar\r\n",
                'user_agent' => "Mozilla/5.0 (Windows NT 6.3; WOW64; rv:35.0) Gecko/20100101 Firefox/35.0",
                'follow_location' => 0
            )
        );
        $context = stream_context_create($options);

        @$doc->loadHTML(mb_convert_encoding(file_get_contents(trim($url), false, $context), 'HTML-ENTITIES', 'UTF-8'));

        //@$doc->loadHTMLFile($url);
        return $doc;//->saveHTML();
    }

    public function getMinPageNumber(DOMDocument $EntirePage) {
        return PAGE_TO_START_FROM; // always start at page number 1
    }

    public function getMaxPageNumber(DOMDocument $EntirePage) {
        $Config = new Config();

        $start_page = $this->getMinPageNumber($EntirePage);

        // pages (from - to)
        $finder = new DomXPath($EntirePage);
        $classname="pages_ul";

        $PageNumbersContent = $finder->query("//ul[contains(@class, '$classname')]");
        $PageNumbersUl = $PageNumbersContent->item(0);

        $PageNumberLis = $PageNumbersUl->getElementsByTagName('li');

        $page_numbers = array();
        foreach($PageNumberLis as $li) {

            if(is_numeric(str_replace($Config->__get('black_list_chars_page_numbers'), '', $li->nodeValue))) { // drop possible extra symbols off & check if content is a number
                $page_numbers[] = $li->nodeValue;
            }
        }

        $end_page = max($page_numbers);
        $end_page =  ($end_page <= $start_page) ? $start_page : $end_page; // order fix, if something goes wrong..

        return $end_page;

    }

    public function getJobsFromPage(DOMDocument $EntirePage, array &$jobs) {

        reset($jobs);

        //$EntirePageArticles = $EntirePageDataContainer->getElementsByTagName('article');

        $EntirePageDataContainer = $EntirePage->getElementById('job_ad_list');
        $EntirePageArticles = $EntirePageDataContainer->getElementsByTagName('article');

        //$collected_jobs = array(); // all links
        foreach($EntirePageArticles as $Article) {
            $Links = $Article->getElementsByTagName('a');

            $Job = new Job($Links->item(0)->getAttribute('href'), clone $this);
            //$Job->url = $Links->item(0)->getAttribute('href');

            $jobs[] = $Job;
        }

        reset($jobs);

    }

    public function debugProcess($text = '-') {

        echo '<br />' . date('Y-m-d H:i:s') . ': ' . $text;

    }

}
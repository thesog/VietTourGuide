<?php
/*
    Plugin Name: TinyMCE Entities Patch
    Plugin URI: http://englishmike.net/tinymceentities-plugin/
    Description: Prevent spaces and HTML entities (e.g. &gt; or &#39;) from disappearing when editing posts with TinyMCE. Useful when writing HTML and source code examples, for example.   
    Version: 1.0
    Author: Mike Walker
    Author URI: http://englishmike.net
*/

/*  Copyright 2008  Michael J. Walker  (email : mike@englishmike.net)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

add_filter('the_editor_content', 'preserve_html_chars');  
add_filter('tiny_mce_before_init', 'preserve_nbsp_chars');

/**
 * Called when loading a post to be edited.  Converts all &amp; entities to &amp;amp; so that 
 * they will be preserved correctly in TinyMCE Visual mode. 
 *
 * @param string $text
 * @return string
 */
function preserve_html_chars($text) {
    if (wp_default_editor() == "tinymce") {
        $text = str_replace('&amp;','&amp;amp;',$text);
    }
    return $text;
}

/**
 * Add &nbsp; to the list of entities TinyMCE should leave alone when loading into the visual editor. 
 *
 * @param array $initArray array of TinyMCE initialization parameters
 * @return updated array
 */
function preserve_nbsp_chars($initArray) {
    $initArray['entities'] = '160,nbsp,'.$initArray['entities'];
    return $initArray;
}
?>
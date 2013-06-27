=== Plugin Name ===
Contributors: stringfold 
Donate link: http://englishmike.net/other-plugins/tinymceentities-plugin/
Tags: posts, html entities, tinymce, bug, html, nbsp, quotes
Requires at least: 2.5
Tested up to: 2.5.1
Stable tag: 1.0

Prevent spaces and HTML entities (e.g. &amp;gt; or &amp;#39;) from disappearing when editing posts with TinyMCE.

== Description ==

>> **Important Note: The recent release of WordPress 2.6 has fixed the disappearing entities bug this plugin was designed to fix, so once you upgrade to WordPress 2.6 please discontinue using this plugin.  I may release a new plugin that prevents spaces from being stripped from the beginning of lines sometime in the near future.**   

After a few weeks of writing posts on WordPress, I was getting very irritated when all the HTML entities I added to my examples kept being converted into characters -- e.g. HTML entities like &amp;gt; &amp;lt; &amp;quot; would convert to &gt; &lt; &quot; -- when I saved the post I was working on.  

To make matters worse, all the spaces I was using to align my coding examples would disappear when switching between "HTML" mode and "Visual" mode, even if I used the &amp;nbsp; entity.

So, I finally bit the bullet and wrote this little plugin to fix these problems.  It does just two things:

1. Allows you to enter HTML entities like &amp;gt; &amp;lt; &amp;amp; etc. while in "Visual" mode and they will stay put, even after you save your post.
1. Allows you to type extra spaces while in "Visual" mode (or &amp;nbsp; in "HTML" mode) and they will stay put too, allowing you to correctly indent code samples, etc. 

If you are writing blog posts with source code or HTML examples, you may find this little plugin helps you avoid a ton of aggravation.

Works with TinyMCE and the TinyMCE Advanced plugin.   

Please note, this plugin is a patch for issues with WordPress's uses of TinyMCE, and not the editor itself.

If you try this plugin and like what you see, or you have questions or problems, feel free to email me at mike@englishmike.net or visit the [TinyMCE Entities Patch Plugin Home Page](http://englishmike.net/tinymceentities-plugin/) with your feedback.

*(Not tested on any version of WordPress older than 2.5.1.  It may work on earlier versions, but I just don't know for sure.  Try it and see.  If it doesn't work simply deactivate the plugin.  If it does work, please let me know!!)*

== Installation ==

Installation Instructions:

1. Download the plugin zip file. 
1. Upload the plugin contents into your WordPress installation's plugin directory.
1. The plugin's .php file and readme.txt should be installed in the 'wp-content/plugins/tinymce-entities-patch/' directory. 
1. From the **Plugin Management** page, activate the **TinyMCE Entities Patch** plugin.
   
Getting Started:   
   
== Frequently Asked Questions ==

= Where's the administration panel for this plugin? =

There isn't one. Your only options are to activate or deactivate the plugin from the **Plugin Management** panel.

= Does the plugin prevent extra blank lines from being removed from my posts? =

No, this is a fix for disappearing space characters and HTML entites (tags beginning with **&** and ending with **;**) only.  

== Screenshots ==

There are no screenshots for this plugin.   
   
== Release Notes version 1.0 ==

**Changes in version 1.0**

* This is the initial version of the plugin. 
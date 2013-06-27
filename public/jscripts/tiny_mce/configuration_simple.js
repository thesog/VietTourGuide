// JavaScript Document
tinyMCE.init({
	// General options
	mode : "specific_textareas",
	editor_selector : "mceeditor",
	theme : "advanced",
	elements : "ajaxfilemanager", /* Từng IDs của texterea nào muốn biến thành Editor */
	plugins : "autolink,lists,spellchecker,pagebreak,style,layer,advhr,emotions,iespell,insertdatetime,advimage,advlink,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,preview,table",
	
	// Skin options
	skin : "default",
	skin_variant : "silver",
	
	// Theme options
	// Theme advanced options
	theme_advanced_source_editor_width : 500,
	theme_advanced_source_editor_height : 600,
	theme_advanced_buttons1 : "newdocument,|,bold,italic,underline,strikethrough,forecolor,backcolor,|,justifyleft,justifycenter,justifyright,justifyfull",
	theme_advanced_buttons2 : "formatselect,fontselect,fontsizeselect,link,unlink,anchor,|,sub,sup,charmap,emotions,preview",
	theme_advanced_buttons3 : "",
	theme_advanced_toolbar_location : "top",
	theme_advanced_toolbar_align : "left",
	theme_advanced_statusbar_location : "bottom",
	theme_advanced_resizing : true,
	theme_advanced_resize_horizontal : false,
		
	extended_valid_elements : "hr[class|width|size|noshade]",
	file_browser_callback : "ajaxfilemanager",
	paste_use_dialog : false,
	
	constrain_menus : true,
	custom_undo_redo_levels : 10,
	accessibility_warnings : true, /* Cảnh báo khi thiếu nội dung nào đó */
	//auto_focus : "ajaxfilemanager"
	directionality : "ltr", /* Canh chữ mặc định. Canh trái hoặc phải: rtl | ltr */
	remove_script_host: true,
	relative_urls : true, /* Relative path */

	// Output configuratioin							
	element_format : "xhtml", /* html | xhtml */
	entity_encoding : "raw",	/* named | numeric | raw */
	force_p_newlines : true,	
	force_br_newlines : false,
	force_hex_style_colors : true,
	forced_root_block : 'p',
	fix_list_elements : true,
	preformatted : true, /* Bật tab và spaces */
	apply_source_formatting : true,
	indentation : '20pt',
	document_base_url : root,
	//height : "380",
	//width : "340",
	
});


function ajaxfilemanager(field_name, url, type, win) {
	var ajaxfilemanagerurl = "../../../../jscripts/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php";
	var view = 'detail';
	switch (type) {
		case "image":
		view = 'thumbnail';
			break;
		case "media":
			break;
		case "flash": 
			break;
		case "file":
			break;
		default:
			return false;
	}
	tinyMCE.activeEditor.windowManager.open({
		url: "../../../../jscripts/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php?view=" + view,
		width: 782,
		height: 440,
		inline : "yes",
		close_previous : "no"
	},{
		window : win,
		input : field_name
	});
	
/* 	return false;			
	var fileBrowserWindow = new Array();
	fileBrowserWindow["file"] = ajaxfilemanagerurl;
	fileBrowserWindow["title"] = "Ajax File Manager";
	fileBrowserWindow["width"] = "782";
	fileBrowserWindow["height"] = "440";
	fileBrowserWindow["close_previous"] = "no";
	tinyMCE.openWindow(fileBrowserWindow, {
	  window : win,
	  input : field_name,
	  resizable : "yes",
	  inline : "yes",
	  editor_id : tinyMCE.getWindowArg("editor_id")
	});
	
	return false;*/
}
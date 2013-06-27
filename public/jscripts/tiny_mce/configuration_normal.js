	// JavaScript Document
tinyMCE.init({
	// General options
	mode : "specific_textareas",
	editor_selector : "mceeditor",
	theme : "advanced",
	elements : "ajaxfilemanager", /* Từng IDs của texterea nào muốn biến thành Editor */
	plugins : "autolink,lists,spellchecker,pagebreak,style,layer,advhr,emotions,iespell,insertdatetime,advimage,advlink,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,preview,table,wordcount,preelementfix,codemagic",
	
	// Skin options
	skin : "default",
	skin_variant : "silver",
	
	// Theme options
	theme_advanced_buttons3 : "newdocument,|,bold,italic,underline,strikethrough,forecolor,backcolor,|,justifyleft,justifycenter,justifyright,justifyfull,|,link,unlink,anchor,image,media,|,advhr,hr,|,charmap,emotions,cleanup,fullscreen,code,preview,codemagic",
	theme_advanced_buttons2 : "removeformat,|,styleprops,pastetext,pasteword,|,bullist,numlist,|,outdent,indent,blockquote,|,nonbreaking,spellchecker,formatselect,fontselect,fontsizeselect,sub,sup,",
	theme_advanced_buttons1 : "visualaid,|,tablecontrols,|,cite,abbr,acronym,del,ins,attribs,|,template,pagebreak,|,print,|,ltr,rtl,help",

	// Theme advanced options
	theme_advanced_source_editor_width : 500,
	theme_advanced_source_editor_height : 600,
	theme_advanced_source_editor_wrap : true,
	theme_advanced_toolbar_location : "top", 		/* top | bottom | external */
	theme_advanced_toolbar_align : "left",			/* left | center | right */
	theme_advanced_statusbar_location : "bottom",	/* left | bottom | none */
	theme_advanced_resizing : true,
	theme_advanced_resize_horizontal : false,
	theme_advanced_resizing_use_cookie : true,
	theme_advanced_path : true,
	theme_advanced_more_colors : true,	
	theme_advanced_default_foreground_color : "#101010",
	theme_advanced_default_background_color : "#f0f0f0",
	theme_advanced_font_sizes : "10px,12px,14px,16px,24px,28px,30px,34px,40px",
	theme_advanced_fonts : 	"Andale Mono=andale mono,times;"+
                			"Arial=arial,helvetica,sans-serif;"+
							"Arial Black=arial black,avant garde;"+
							"Book Antiqua=book antiqua,palatino;"+
							"Comic Sans MS=comic sans ms,sans-serif;"+
							"Courier New=courier new,courier;"+
							"Georgia=georgia,palatino;"+
							"Helvetica=helvetica;"+
							"Impact=impact,chicago;"+
							"Symbol=symbol;"+
							"Tahoma=tahoma,arial,helvetica,sans-serif;"+
							"Terminal=terminal,monaco;"+
							"Times New Roman=times new roman,times;"+
							"Trebuchet MS=trebuchet ms,geneva;"+
							"Verdana=verdana,geneva;"+
							"Webdings=webdings;"+
							"Wingdings=wingdings,zapf dingbats",
							
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
	//width : "640",
	
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
	
	
});


function ajaxfilemanager(field_name, url, type, win) {
	var ajaxfilemanagerurl = root + "jscripts/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php";
	
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
		url: root + "jscripts/tiny_mce/plugins/ajaxfilemanager/ajaxfilemanager.php?view=" + view,
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


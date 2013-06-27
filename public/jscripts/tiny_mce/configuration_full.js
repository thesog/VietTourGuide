// JavaScript Document
tinyMCE.init({
	// General options
	mode : "exact",
	theme : "advanced",
	elements : "ajaxfilemanager", /* Từng IDs của texterea nào muốn biến thành Editor */
	plugins : "autolink,lists,spellchecker,pagebreak,style,layer,advhr,emotions,iespell,insertdatetime,advimage,advlink,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,preview,table",
	
	// Skin options
	skin : "default",
	skin_variant : "silver",
	
	// Theme options
	theme_advanced_buttons3 : "newdocument,|,bold,italic,underline,strikethrough,forecolor,backcolor,|,justifyleft,justifycenter,justifyright,justifyfull,|,link,unlink,anchor,image,media,|,sub,sup,advhr,hr,|,charmap,emotions,cleanup,fullscreen,code,preview",
	theme_advanced_buttons2 : "removeformat,|,styleprops,pastetext,pasteword,|,undo,redo,bullist,numlist,|,outdent,indent,blockquote,|,search,nonbreaking,spellchecker,formatselect,fontselect,fontsizeselect",
	theme_advanced_buttons1 : "visualaid,|,tablecontrols,|,insertlayer,moveforward,movebackward,absolute,|,cite,abbr,acronym,del,ins,attribs,|,template,pagebreak,|,print,|,ltr,rtl,help",
	theme_advanced_toolbar_location : "top",
	theme_advanced_toolbar_align : "left",
	theme_advanced_statusbar_location : "bottom",
	theme_advanced_resizing : true,
		
	table_styles : "Header 1=header1;Header 2=header2;Header 3=header3",
	table_cell_styles : "Header 1=header1;Header 2=header2;Header 3=header3;Table Cell=tableCel1",
	table_row_styles : "Header 1=header1;Header 2=header2;Header 3=header3;Table Row=tableRow1",
	table_cell_limit : 100,
	table_row_limit : 5,
	table_col_limit : 5,
	theme_advanced_toolbar_location : "top",
	theme_advanced_toolbar_align : "left",
	extended_valid_elements : "hr[class|width|size|noshade]",
	file_browser_callback : "ajaxfilemanager",
	paste_use_dialog : false,
	theme_advanced_resizing : true,
	theme_advanced_resize_horizontal : true,
	apply_source_formatting : true,
	force_br_newlines : false,
	force_p_newlines : true,	
	constrain_menus : true,
	custom_undo_redo_levels : 10,
	accessibility_warnings : true, /* Cảnh báo khi thiếu nội dung nào đó */
	//auto_focus : "ajaxfilemanager"
	directionality : "ltr", /* Canh chữ mặc định. Canh trái hoặc phải: rtl | ltr */
	remove_script_host: true,
	relative_urls : true, /* Relative path */
	height : "380",
	width : "640"
	
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
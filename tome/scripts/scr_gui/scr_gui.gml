///@desc
///@param
function scr_gui(){



}


function gui_x_to_room(_coord){
	var cw = camera_get_view_width(view_camera);
	var px = _coord / display_get_gui_width()
	var cx = camera_get_view_x(view_camera);

	var xx = cx+(px * cw);

	return xx
}

function gui_y_to_room(_coord){
	var ch = camera_get_view_height(view_camera);
	var ph = _coord / display_get_gui_height()
	var ch = camera_get_view_y(view_camera);

	var yy = ch+(ph * ch);

	return yy
}

///@desc needs testing
function room_x_to_gui(_coord){
	var cw = camera_get_view_width(view_camera);
	var cx = camera_get_view_x(view_camera);
	var px = cw - cx;
	var scale = px / display_get_gui_width()

	var xx = (px * scale);

	return xx
}
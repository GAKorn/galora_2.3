/// @description When enters a room

view_enabled = true;
view_visible[0] = true;

if hasPlayer {
	var _camW = viewWidth/zoom;
	var _camH = viewHeight/zoom;
	
	var _x = clamp(global.player.x-_camW/2, 0, room_width-_camW);
	var _y = clamp(global.player.y-_camH/2, 0, room_height-_camH);
	
	var _curX = camera_get_view_x(global.cam);
	var _curY = camera_get_view_y(global.cam);
	
	var _spd = .1;
	
	var _finalX = lerp(_curX, _x, _spd);
	var _finalY = lerp(_curY, _y, _spd);
	
	camera_set_view_pos(global.cam, _finalX, _finalY);
	camera_set_view_size(global.cam, _camW, _camH);
}
 /// @description Insert description here
// You can write your code in this editor
//display_set_gui_size(global.gameWidth, global.gameHeight);
display_set_gui_size(viewWidth, viewHeight);
if (global.isCity) tgt_zoom = 2;
else if (global.isPan) tgt_zoom = 0.5;
else tgt_zoom = 1;

zoom = approach(zoom, tgt_zoom, zoomSpd);

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
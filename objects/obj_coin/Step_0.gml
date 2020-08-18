/// @description 
entity_calc_movement();

//bounce ooon ground
if on_ground() and !bounce{
	//give vert movement
	vSpd = vSpd_initial*random_range(.7,.8);
	bounce = true;
	can_pick = true;	
}

//bounce on walls
var side;
if (sign(vSpd_initial)) side = bbox_right else side = bbox_left;
var t1 = tilemap_get_at_pixel(global.map, side + sign(hSpd_initial), bbox_bottom);
if (t1 == Solid){
	//wall for reverse direction
	hSpd = (hSpd_initial*.75)*-1;
}

//destroy if falls out of the room
if (die or (y > room_height)) instance_destroy();

//set the target for magnetic
if (distance_to_object(global.player) <= 128) target = true;

//collision
if (global.magneticRelic and can_pick and target) {
		var curX = x;
		var curY = y;
		var _tX = global.player.x;
		var _tY = global.player.y;
		
		var _distSPD = abs(distance_to_object(global.player)*.05);
		var _spdFactor = wave(0, _distSPD, 5, 1)
		
		var _spd = 1 + _spdFactor;
		var x_spd = 1;
		var y_spd = 1;
		//horizontal
		if (curX > _tX) x_spd = -_spd;
		else x_spd = _spd;
		//vertical
		if (curY > _tY) y_spd = -_spd;
		else y_spd = _spd;
				
		x += x_spd;
		y += y_spd;
} else tile_collision();


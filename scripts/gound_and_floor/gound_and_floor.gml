// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function in_floor(tile_map, _x, _y){
	var pos = tilemap_get_at_pixel(tile_map, _x, _y);
	
	if (pos > 0 and pos != 2) {
		if (pos == 1) return (_y mod tilesize);
		var thefloor = global.heights[(_x mod tilesize) + (pos * tilesize)];
		return ((_y and tilesize) - thefloor);
	} else return (-(tilesize - (_y mod tilesize)));
}

function on_ground(){
	var side = bbox_bottom;
	var t1 = tilemap_get_at_pixel(global.map, bbox_left, side +1);
	var t2 = tilemap_get_at_pixel(global.map, bbox_right, side +1);
	
	if (t1 == Solid or t2 == Solid or platform_collision()
	or (in_floor(global.map, x, bbox_bottom+1) >= 0)
	or (in_floor(global.map, bbox_left, bbox_bottom+1) >= 0)
	or (in_floor(global.map, bbox_right, bbox_bottom+1) >= 0))
		return true else return false;
}
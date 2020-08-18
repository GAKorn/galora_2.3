// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function platform_collision(){
	var side;
	
	//determine wich side to test
	if vSpd >= 0 side = bbox_bottom else side = bbox_top;
	
	//
	var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + vSpd + 1);
	var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + vSpd +1);
	var t3 = tilemap_get_at_pixel(global.map, bbox_left, bbox_bottom);
	var t4 = tilemap_get_at_pixel(global.map, bbox_right, bbox_bottom);
	
	//if not void type
	//if there is something in t1 and is falling, alwayys collide. If not, it has to be solid to collide
	if (vSpd >=0 and ((t1 == Platform and t3 != Platform) or (t2 == Platform and t4 != Platform)) and !global.kDrop) return true else return false; 
}

function tile_collision(){
	//is my middle center touching the floor at the start of this frame?
	grounded = (in_floor(global.map, x, bbox_bottom+1) >= 0);
	
	//jump
	if (grounded or (in_floor(global.map, bbox_left, bbox_bottom+1) >= 0) or (in_floor(global.map, bbox_right, bbox_bottom+1) >= 0)) {
		if global.kJump {
			grounded = false;
		}
	}
	
	//Deals with fraccionated pixles against full value tileset
	if (hSpd == 0) dec_hSpd = 0;
	if (vSpd == 0) dec_vSpd = 0;
	
	//applyy carried over decimals
	hSpd += dec_hSpd;
	vSpd += dec_vSpd;
	
	//floor decimals, save and subtract decimals
	dec_hSpd = hSpd - (floor(abs(hSpd))*sign(hSpd));
	hSpd -= dec_hSpd;
	dec_vSpd = vSpd - (floor(abs(vSpd))*sign(vSpd));
	vSpd -= dec_vSpd;
	
		#region Horizontal Collision
	
	var side; //checking the side to test for collision (moving right is right side, moving left is left side)
	if hSpd > 0 side = bbox_right else side = bbox_left;
	
	//checking top and bottom of each side
	var t1 = tilemap_get_at_pixel(global.map, side + hSpd, bbox_top);
	var t2 = tilemap_get_at_pixel(global.map, side + hSpd, bbox_bottom);
	if (tilemap_get_at_pixel(global.map, x, bbox_bottom) > 2) t2 = 0;
	
	if (t1 == Solid) or (t2 == Solid){
		//collision found
		//show_debug_message("H-Coll");
		if (hSpd > 0) x = x - (x mod tilesize) + (tilesize -1) - (bbox_right-x);
		else x = x - (x mod tilesize) - (bbox_left -x);
		hSpd = 0;
	}
	
	//if it didn't colide, it will move
	x += hSpd;	
		#endregion
		
		#region Vertical Collision
	
	if (tilemap_get_at_pixel(global.map, x, bbox_bottom + vSpd) <= 2){
		var side; //again, determine what side to check for collision
		if vSpd > 0 side = bbox_bottom else side = bbox_top;
		
		//check left and right of the side
		var t1 = tilemap_get_at_pixel(global.map, bbox_left, side + vSpd);
		var t2 = tilemap_get_at_pixel(global.map, bbox_right, side + vSpd);
		//var t3 = tilemap_get_at_pixel(global.map, bbox_left, bbox_bottom);
		//var t4 = tilemap_get_at_pixel(global.map, bbox_right, bbox_bottom);
		
		if (t1 == Solid) or (t2 == Solid) or platform_collision(){ //collision found
			//show_debug_message("V-Coll");
			//if (vSpd >0) y = y - (y mod tilesize) + (tilesize-1) - (side - y);
			//else y = y - (y mod tilesize) - (side - y);
			vSpd = 0;
		}
	}
	
	var floordist = in_floor(global.map, x, bbox_bottom + vSpd);
	
	if (floordist >= 0){
		y += vSpd;
		y -= (floordist +1);
		vSpd = 0;
		floordist = -1;
	}
	
	//movement
	y += vSpd;
	
	if (grounded) {
		y += abs(floordist) -1;
		//if at base of current tile
		if ((bbox_bottom mod tilesize) == tilesize -1){
			//if the slope continues
			if (tilemap_get_at_pixel(global.map, x, bbox_bottom +1) >2){
				y += abs(tilemap_get_at_pixel(global.map, x, bbox_bottom +1));
			}
		}
	}	
		#endregion
	
	
}
	
function wall_collision(){
	//defining sides
	var sideL = bbox_left;
	var sideR = bbox_right;
	
	//getting the tilemap to id the collision
	var t1 = tilemap_get_at_pixel(global.map, sideL-1, bbox_top); //left top
	var t2 = tilemap_get_at_pixel(global.map, sideL-1, bbox_bottom); //left bot
	var t3 = tilemap_get_at_pixel(global.map, sideR+1, bbox_top); //right top
	var t4 = tilemap_get_at_pixel(global.map, sideR+1, bbox_bottom); //right bot
	
	//left wall
	if ((t1 == Solid or t2 == Solid) and global.kWall){
		wallLeft = true;
		if global.kLeft vSpd = 0;
		else {
			if global.kDown vSpd = 4;
			else vSpd = .5;
			//getting out of the wall without jumping
			if global.kRight{
				//state goes here
				was_on_wall = true;
				alarm[wall_alarm] = room_speed*.3;
			}
		}
		if global.kJump {
			jumpAmount = jumpsTotal;
			jumped();
			if !on_ground() hSpd = 20;
		}
	} else wallLeft = false;
	
	//right wall
	if ((t3 == Solid or t4 == Solid) and global.kWall){
		wallRight = true;
		if global.kRight vSpd = 0;
		else {
			if global.kDown vSpd = 4;
			else vSpd = .5;
			//getting out of the wall w/out jump
			if global.kLeft {
				//state goes here
				was_on_wall = true;
				alarm[wall_alarm] = room_speed*.3;
			}
		}
		if global.kJump {
			jumpAmount = jumpsTotal;
			jumped();
			if !on_ground() hSpd = - 20;
		}
	} else wallRight = false;
	
}
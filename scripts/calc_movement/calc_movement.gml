// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calc_movement(){
	//generated base horizontal speed
	//acc = acc*global.axis;
	hSpd += (global.kRight - global.kLeft)*global.axis;
	
	//applying gravityy
	if (vSpd < max_vSpd) vSpd += global.grv;
	
	//drag (friction)
	hSpd = lerp(hSpd, 0, fric);
	
	//stop
	if (abs(hSpd) <= .1) hSpd =0;
	
	//face correct way
	if (hSpd != 0) facing = sign(hSpd);
	
	//limit speed
	hSpd = min(abs(hSpd), max_hSpd)*facing;
	
}

function jumped(){
	var canJump = jumpAmount>0 and global.kJump and !global.kDrop;
	if on_ground() jumpAmount = jumpsTotal;
	
	if (canJump){
		var _jumpForce = jumpStrength + (abs(hSpd)/3.5);
		if (_jumpForce < jumpStrength) vSpd -= jumpStrength; 
		else vSpd -= _jumpForce;
		jumpAmount--;
	}	
}

function entity_calc_movement(){
	//calc movement and physics for entities
	vSpd += global.grv;
	
	//friction
	hSpd = lerp(hSpd, 0, drag);
	
	//stop
	if (abs(hSpd) <= .1) hSpd = 0;
	
}
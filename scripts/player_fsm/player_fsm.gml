// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerIDLE(){
	//defining sprite
	var _spr = spr_playerIDLE
	sprite_index = _spr;
	
	STA += 0.1;
	//i check collision in the begin step event of the player, so not here
	
	if (global.kAtk and !global.isCity) state = pStates.atk;
	else if (dashAble = true and global.canDash and global.kDash) state = pStates.dash;
	else if (global.kJump or global.kJump_Held) state = pStates.air;
	else if (global.kLeft or global.kRight) state = pStates.walk;
}

function playerWALK(){
	
	var _spr = spr_playerWALK;
	sprite_index = _spr;
	
	STA += 0.05;
	
	if (global.kAtk and !global.isCity) state = pStates.atk;
	else if (dashAble = true and global.canDash and global.kDash) state = pStates.dash;
	else if (global.kJump or global.kJump_Held) state = pStates.air;
	else if (abs(hSpd) > 2) state = pStates.jog;
	else if (abs(hSpd) <= 0) state = pStates.idle;
}

function playerJOG(){
	
	var _spr = spr_playerJOG;
	sprite_index = _spr;
	
	if (global.kAtk and !global.isCity) state = pStates.atk;
	else if (dashAble = true and global.canDash and global.kDash) state = pStates.dash;
	else if (global.kJump or global.kJump_Held) state = pStates.air;
	else if (abs(hSpd) > 5) state = pStates.run;
	else if (abs(hSpd) <= 2) state = pStates.walk;
	else if (abs(hSpd) <= 0) state = pStates.idle;

}

function playerRUN(){
	
	var _spr = spr_playerRUN;
	sprite_index = _spr;
	
	STA -= 0.1;
	
	if (global.kAtk and !global.isCity) state = pStates.atk;
	else if (dashAble = true and global.canDash and global.kDash) state = pStates.dash;
	else if (global.kJump or global.kJump_Held) state = pStates.air;
	else if (abs(hSpd) <= 5 or STA < 1) state = pStates.jog;
	else if (abs(hSpd) <= 2 or STA < 1) state = pStates.walk;
	else if (abs(hSpd) <= 0 or STA < 1) state = pStates.idle;
}

function playerDASH(){
	var _spr = spr_playerDASH;
	sprite_index = _spr;
	
	dashAble = false;
	hSpd = 0
	vSpd = 0;
	hSpd += facing*10;
	
	if (animation_end()) {
		alarm[4] = room_speed*0.4;
		if (!on_ground) state = pStates.air;
		else if (global.kLeft or global.kRight) state = pStates.walk;
		else state = pStates.idle;
	}
}

function playerJUMP(){
	
	var _spr = spr_playerJUMP;
	sprite_index = _spr;
	if (animation_end(_spr)) image_speed = 0;
	else image_speed = 1;
	
	if (global.kAtk and !global.isCity) state = pStates.airAtk;
	else if (dashAble = true and global.canDash and global.kDash) state = pStates.dash;
	else if (vSpd == 0) state = pStates.air;
	else if (vSpd > 0) state = pStates.fall;
	else if ((wallLeft or wallRight) and global.kWall) state = pStates.wall;

}

function playerAIR(){
	
	var _spr = spr_playerAIR;
	sprite_index = _spr;
	if (animation_end(_spr)) image_speed = 0;
	else image_speed = 1;
	
	if (global.kAtk and !global.isCity) state = pStates.airAtk;
	else if (dashAble = true and global.canDash and global.kDash) state = pStates.dash;
	else if (vSpd < 0) state = pStates.jump;
	else if (vSpd > 0) state = pStates.fall;

}

function playerFALL(){
	
	var _spr = spr_playerFALL;
	sprite_index = _spr;
	if (animation_end(_spr)) image_speed = 0;
	else image_speed = 1;
	
	if (global.kAtk and !global.isCity) state = pStates.airAtk;
	else if (dashAble = true and global.canDash and global.kDash) state = pStates.dash;
	else if (vSpd == 0) state = pStates.air;
	else if ((wallLeft or wallRight) and global.kWall) state = pStates.wall;
	else if (on_ground()) state = pStates.land;

}

function playerLAND(){
	
	if (global.kLeft or global.kRight) state = pStates.walk;
	else state = pStates.idle;

}

function playerWALL(){
	sprite_index = spr_playerWALL;
	
	if (!wallLeft and !wallRight and !on_ground()) state = pStates.air;
	else if (on_ground()) state = pStates.idle;

}

function playerINTERACT(){

}

function playerDIALOG(){

}

function playerATK(){	
//breaking movement
hSpd = 0;
vSpd = 0;
	
//start of the attack
if (sprite_index != spr_playerATK) {
	//setting the right sprite
	sprite_index = spr_playerATK;
	image_index = 0;
	//clearing the hit ds list
	ds_list_clear(hitByAttack);		
}
	
//use attack hitbox & check for hits
mask_index = spr_player_atk_HITBOX;
var hitByAttackNOW = ds_list_create();
var hits = instance_place_list(x,y,obj_enemyPAR, hitByAttackNOW, false);
if (hits > 0) {
	for (var i = 0; i < hits; i++){
		//if this instance has not yet been hit by this attack
		var hitID = hitByAttackNOW[| i]; //the | finds somethingg in the list, its equal to ds_list_find_value
		if (ds_list_find_index(hitByAttack, hitID) == -1){
			ds_list_add(hitByAttack, hitID);
			with (hitID){
				//enemy_hit(2);
				instance_destroy();
			}
		}
	}
}
ds_list_destroy(hitByAttackNOW);
mask_index = spr_playerColl;
	
if (animation_end()) {
	if (global.kLeft or global.kRight) state = pStates.walk;
	else state = pStates.idle;
}
	
}

function playerAirATK(){
	//breaking movement
	hSpd = 0;
	vSpd = 0;
	
	//start of the attack
	if (sprite_index != spr_playerAirATK) {
		//setting the right sprite
		sprite_index = spr_playerAirATK;
		image_index = 0;
		//clearing the hit ds list
		ds_list_clear(hitByAttack);		
	}
	
	//use attack hitbox & check for hits
	mask_index = spr_player_atk_HITBOX;
	var hitByAttackNOW = ds_list_create();
	var hits = instance_place_list(x,y,obj_enemyPAR, hitByAttackNOW, false);
	if (hits > 0) {
		for (var i = 0; i < hits; i++){
			//if this instance has not yet been hit by this attack
			var hitID = hitByAttackNOW[| i]; //the | finds somethingg in the list, its equal to ds_list_find_value
			if (ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				if (global.jumpReset) jumpAmount += 1;
				with (hitID){
					//enemy_hit(2);
					instance_destroy();
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNOW);
	mask_index = spr_playerColl;
	
	if (animation_end()) {
		state = pStates.air;
	}
	

}

function playerDEATH(){

}
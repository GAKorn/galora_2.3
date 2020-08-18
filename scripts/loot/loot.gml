// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//add experience to thhe player
function add_experience(xp_amount){
	global.xpHUD = true;
	var _xpCount = xp_amount;
	//global.player_getXP = true;
	for (var i = 0; i<xp_amount; i++){
		_xpCount--;
		global.playerXP++;
		if (global.playerXP >= global.playerXP_Needed){
			level_up(_xpCount);
			break;
		}
	}
	with (obj_Control) alarm[10] = room_speed;
	
}

function add_money(money_amount){
	global.moneyHUD = true;
	for (var i = 0; i<money_amount; i++){
		global.playerMoney++;
	}
	with (obj_Control) alarm[11] = room_speed;
	
}

function level_up(_xpCount){
	global.playerLevel++;
	global.playerXP = 0;
	global.playerATK++;
	global.playerDEF++;
	if (_xpCount > 0) add_experience(_xpCount);
}

function spawn_loot(experience, money){
	repeat(experience){
		instance_create_layer(x, y, "inst_loot", obj_experience);
	}

	repeat(money){
		instance_create_layer(x, y, "inst_loot", obj_coin);
	}
	
}
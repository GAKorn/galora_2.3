/// @description Insert description here
// You can write your code in this editor
get_input();

	#region Pause
if (global.kPause){
	if (!pause){
		pause = true;
		show_debug_message("Paused");
		event_perform_object(obj_player, ev_other, ev_user0);
		instance_deactivate_all(true);
		instance_create_layer(global.gameWidth/2, global.gameHeight/2,
								"inst_Control", obj_pauseMenu);
	} else {
		pause = false;
		show_debug_message("Unpaused");
		with (obj_pauseMenu) {
			instance_destroy();
		}
		instance_activate_all();
		event_perform_object(obj_player, ev_other, ev_user1);
	}
}

	#endregion


#region Debuuging and Testin
//restarting room
if (keyboard_check_pressed(ord("R"))) room_restart();

global.doubleJump = true;					//checks if player has the double jump upgrade
global.wallUpgrade = true;					//checks if the player can wall jump
global.jumpReset = true;					//checks if the player can reset jump in midair
global.magneticRelic = true;				//checks for the magnetic relic equipped
global.canDash = true;						//checks if player can dash

//gerando o loot para teste
if (mouse_check_button_pressed(mb_left)){
	repeat(9){
		instance_create_layer(mouse_x, mouse_y, "inst_loot", obj_experience);
	}
}

if (mouse_check_button_pressed(mb_right)){
	repeat(9){
		instance_create_layer(mouse_x, mouse_y, "inst_loot", obj_coin);
	}
}

	#region Zoom
//zoom control (for later)
if (keyboard_check_pressed(ord("1"))){
	global.isCity = true;
	global.isPan = false;
}

if (keyboard_check_pressed(ord("2"))){
	global.isCity = false;
	global.isPan = false;
}

if (keyboard_check_pressed(ord("3"))){
	global.isCity = false;
	global.isPan = true;
}
	#endregion


#endregion


	#region Player XP Factors
//marking when the player XP factors change
if (global.playerNextLevel >= 20) global.playerXP_Factor = 1000;
else if ((global.playerNextLevel > 14) and (global.playerNextLevel < 20)) global.playerXP_Factor = 500;
else if ((global.playerNextLevel > 9) and (global.playerNextLevel < 15)) global.playerXP_Factor = 250;
else if ((global.playerNextLevel > 4) and (global.playerNextLevel < 10)) global.playerXP_Factor = 150;
else global.playerXP_Factor = 100;

//calculing the experience
global.playerNextLevel = global.playerLevel+1;
global.playerXP_Needed = global.playerNextLevel*global.playerXP_Factor;

//debugging messages
//show_debug_message("Next Level: "+string(global.playerNextLevel)+"| XP: "+string(global.playerXP)+"/"+string(global.playerXP_Needed));
//if (keyboard_check_pressed(ord("L"))) add_experience(45);
	#endregion
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_input(){
	
	if (global.hasGamepad){
		var _pad = 0; //the gamepad value
		var _deadzone = 0.1;
		global.kPause = gamepad_button_check_pressed(_pad, gp_start);
		global.kLeft = (gamepad_axis_value(_pad, gp_axislh) < -_deadzone);
		global.kRight = (gamepad_axis_value(_pad, gp_axislh) > _deadzone);
		global.kUp = (gamepad_axis_value(_pad, gp_axislv) < -_deadzone);
		global.kDown = (gamepad_axis_value(_pad, gp_axislv) > _deadzone);
		global.kJump = gamepad_button_check_pressed(_pad, gp_face1);
		global.kJump_Held = gamepad_button_check(_pad, gp_face1);
		global.kDrop = (global.kJump or global.kJump_Held) and global.kDown;
		global.kDash = gamepad_button_check_pressed(_pad, gp_face2);
		global.kRun = gamepad_button_check(_pad, gp_shoulderlb);
		global.kWall = gamepad_button_check(_pad, gp_shoulderrb);
		global.kInteract = gamepad_button_check_pressed(_pad, gp_face4);
		global.kAtk = gamepad_button_check_pressed(_pad, gp_face3);;
		global.axis = abs(gamepad_axis_value(_pad, gp_axislh));
		global.kPrev = gamepad_button_check_pressed(_pad, gp_shoulderl);
		global.kNext = gamepad_button_check_pressed(_pad, gp_shoulderr);
	
	} else {
		global.kPause = keyboard_check_pressed(vk_escape);
		global.kLeft = keyboard_check(vk_left);
		global.kRight = keyboard_check(vk_right);
		global.kUp = keyboard_check(vk_up);
		global.kDown = keyboard_check(vk_down);
		global.kJump = keyboard_check_pressed(ord("S"));
		global.kJump_Held = keyboard_check(ord("S"));
		global.kDrop = (global.kJump or global.kJump_Held) and global.kDown;
		global.kDash = keyboard_check_pressed(ord("C"));
		global.kRun = keyboard_check(vk_shift);
		global.kWall = keyboard_check(ord("A"));
		global.kInteract = keyboard_check_pressed(ord("E"));
		global.kAtk = keyboard_check_pressed(ord("D"));
		global.axis = 1;
		global.kPrev = keyboard_check_pressed(ord("Q"));
		global.kNext = keyboard_check_pressed(ord("R"));
	}
	
}
/// @description Insert description here
// You can write your code in this editor
show_debug_message("Event = "+async_load[? "event_type"]); //debug code to see what event has been
show_debug_message("Pad = "+string(async_load[? "pad_index"])); //triggered and the pad associate to it

	#region Getting the controller
switch(async_load[? "event_type"]) { //parse thhe async_load map to see which event hhas been triggered
	case "gamepad discovered" :		//a game pad has been discovered
		var pad = async_load[? "pad_index"];	//get the pad index value from the asyync load map
		gamepad_set_axis_deadzone(pad, 0.15);	//set the deadzone for the axis
		gamepad_set_button_threshold(pad, 0.1);	//set the treshold for the triggers
		global.hasGamepad = true;
		break;
		
	case "gamepad lost":			//gamepad has been removed or otherwise disabled
		var pad = async_load[? "pad_index"];
		global.hasGamepad = false;
		break;
}
	#endregion
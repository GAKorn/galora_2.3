///@description a collection of macros - or stuff like it - used in the game
function macros() {

	#region GlobalVars used as macros
	
global.player = obj_player;
global.gameWidth = 640;
global.gameHeight = 360;
global.windowScale = 1;
global.hasGamepad = false;

	#endregion

	#region Macros

#macro tilesize 32
#macro Void 0
#macro Solid 1
#macro Platform 2
#macro wall_alarm 3
#macro hasPlayer instance_exists(global.player)


	#endregion


}

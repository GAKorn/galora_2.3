/// @description Insert description here
// You can write your code in this editor
macros();
get_input();

//pause vars
pause = false;
pause_spr = noone;

//global init
global.grv = .25;
global.isCity = false;
global.isPan = false;
global.thisRoom = noone;

	#region Init Player info
//i keep player info as global so it mantains value across rooms and levels
//some attributes upgraded by finding great upgrades
global.player_maxHP = 20;									//player maximum Health Points - measures the player health levels
global.player_maxSTA = floor(10);									//player maximum Stamina - measures the player stamina (for running and wall climbing and maybe other exploration featrues)
global.player_maxMP = 6;									//player maximum Mana Points - measures the player mana - for special skills
global.playerSwordLevel = 1;								//player sword level (will be called PROFICIENCY with the main weapon, which is powered up during the game)

//
global.player_currHP = global.player_maxHP;					//player current Health Poitns - updated at every room based on player instace variable
global.player_currSta = global.player_maxSTA;				//player current Stamina - as above
global.player_currMP = global.player_maxMP;					//player current Mana Points - as above

//player related exploration upgrades (the metroidvania system)
global.doubleJump = false;					//checks if player has the double jump upgrade
global.wallUpgrade = false;					//checks if the player can wall jump
global.jumpReset = false;					//checks if the player can reset jump in midair
global.magneticRelic = false;				//checks for the magnetic relic equipped
//other upgrades might come here

//some attributes upgraded by level
global.playerMoney = 0;										//the player money
global.playerLevel = 1;										//the player's current level
global.playerNextLevel = global.playerLevel+1;				//the next player level (for experience counting)
global.playerATK = 1;										//the player's attack value, wich goes up each level (this is modified by the proficiency of the player with the weapon)
global.playerDEF = 1;										//the player defense value, which is modified by relics and armor equipped by the playyer
global.playerXP = 0;										//player experience
global.playerXP_Factor = 100;								//the XP factor for upgrading the player. It changes when player hits certain marks (lvls 5, 10, 15, 20);
global.playerXP_Needed = global.playerNextLevel*global.playerXP_Factor;		//the xp needed for the next level. It changes when level up
global.xpHUD = false;
global.moneyHUD = false;



	#endregion

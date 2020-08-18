/// @description Init
 
	#region Init Variables for Movement and Combat
//for sprite control
facing = 1;

//horizontal speeds
hSpd = 0;
max_hSpd = 4;
dec_hSpd = 0;
fric = .12;

//vertical speeds
vSpd = 0;
max_vSpd = 10;
dec_vSpd = 0;

//wall checks
was_on_wall = false;
wallLeft = false;
wallRight = false;

//jump related
jumpStrength = 5;
jumpsTotal = 1;
jumpAmount = jumpsTotal;

//combat part
hitByAttack = ds_list_create();
weaponDMG = 4;
armorDEF = 2;
combatMod1 = 0
combatMod2 = 0;
combatMod3 = 0;
defMod1 = 0;
defMod2 = 0;
defMod3 = 0;
defModSUP = 0;



	#endregion

	#region Init Player Attributes
HP = global.player_currHP;
STA = global.player_currSta;
MP = global.player_currMP;
	#endregion
	
	#region Init Player STATES - Finite State Machine
enum pStates{
	idle,
	walk,
	jog,
	run,
	air,
	jump,
	fall,
	atk,
	airAtk,
	wall,
	interact,
	dialog,
	death,
	land,
}

state = pStates.idle;
	
	#endregion
/// @description Always
//scripts for controls
get_input();
calc_movement();
jumped();

	#region Checking Walk, Jog, Run
if (global.isCity) max_hSpd = 2;
else if (global.kRun and STA > 0) max_hSpd = 7;
else max_hSpd = 5;
	#endregion
	
	#region Checks for Some Movement Limitations
if (global.doubleJump) jumpsTotal = 2
else jumpsTotal = 1;

if STA <= 0 STA = 0;
if STA >= global.player_maxSTA STA = global.player_maxSTA;
	
	#endregion
	
	#region Combat Values
DMG = playerDMG(weaponDMG, global.playerATK, global.playerSwordLevel, combatMod1, combatMod2, combatMod3); //for lvl1 it's (4+1+0+0+0)*1 = 5*1 = 5 DMG;
dmgRED = playerRedDMG(armorDEF, global.playerDEF, defMod1, defMod2, defMod3, defModSUP);
	
	
	#endregion
	
	#region The State Machine
switch state{
	case pStates.idle: playerIDLE(); break;
	case pStates.walk: playerWALK(); break;
	case pStates.jog: playerJOG(); break;
	case pStates.run: playerRUN(); break;
	case pStates.air: playerAIR(); break;
	case pStates.jump: playerJUMP(); break;
	case pStates.fall: playerFALL(); break;
	case pStates.atk: playerATK(); break;
	case pStates.airAtk: playerAirATK(); break;
	case pStates.wall: playerWALL(); break;
	case pStates.dialog: playerDIALOG(); break;
	case pStates.interact: playerINTERACT(); break;
	case pStates.death: playerDEATH(); break;	
	case pStates.land: playerLAND(); break;
}

//show_debug_message("Atk: "+string(DMG)+"/ Def: "+string(dmgRED));

	#endregion
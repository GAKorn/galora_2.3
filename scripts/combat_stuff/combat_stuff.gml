// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_hit(damage){
	HP -= damage;
	flash = true;
}

function playerDMG(weaponDMG, _playerATK, proficiency){
	var _mod1, _mod2, _mod3;
	if (argument_count > 3){
		_mod1 = argument[3];
		_mod2 = argument[4];
		_mod3 = argument[5];
	} else {
		_mod1 = 0;
		_mod2 = 0;
		_mod3 = 0;
	}
	
	return (weaponDMG + _playerATK + _mod1 + _mod2 + _mod3)*proficiency;
		
}

function playerRedDMG(armorDEF, _playerDEF){
	var _mod1, _mod2, _mod3;
	var _multiple;
	if (argument_count > 2){
		_mod1 = argument[2];
		_mod2 = argument[3];
		_mod3 = argument[4];
		_multiple = argument[5];
	} else {
		_mod1 = 0;
		_mod2 = 0;
		_mod3 = 0;
		_multiple = 0;
	}
	
	if (_multiple < 1) _multiple = 1;
	
	return (armorDEF + _playerDEF + _mod1 + _mod2 + _mod3)*_multiple;
	
	
}
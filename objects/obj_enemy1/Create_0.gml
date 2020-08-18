/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

eHP = 10;
eATK = 2;
eDEF = 2;
eLVL = 1;

if (chance(.3)) xp = 30;
else xp = 15;

eXP_factor = ceil(xp+eATK+eDEF*eLVL);
eMoney_factor = floor(eXP_factor*0.6);

enum e1States {
	idle,
	walk,
	attack,
	hurt,
	death,	
	
}

state = e1States.idle;
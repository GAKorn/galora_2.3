/// @description Copy into child to alter
eHP = 1;
eATK = 1;
eDEF = 1;
eLVL = 1;

if (chance(.3)) xp = 30;
else xp = 15;

eXP_factor = ceil(xp+eATK+eDEF*eLVL);
eMoney_factor = floor(eXP_factor*0.6);
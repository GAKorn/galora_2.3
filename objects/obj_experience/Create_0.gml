/// @description Init obj
vSpd_initial = random_range(-6,-3);
vSpd = vSpd_initial;
hSpd_initial = random_range(2,5)*choose(-1,1);
hSpd = hSpd_initial;
dec_hSpd = 0;
dec_vSpd = 0;
drag = .05;
die = false;
jump = 0;

target = false;

//hhas bounce happened yet?
bounce = false;

//can player pick this yet
can_pick = false;
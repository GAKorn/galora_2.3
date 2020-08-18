/// @description Always
current_frame += global.kNext - global.kPrev;

if (current_frame > 3) current_frame = 0;
if (current_frame < 0) current_frame = 3;
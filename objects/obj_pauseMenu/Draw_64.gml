/// @description HUD
var guiW = display_get_gui_width();
var guiH = display_get_gui_height();
var black = c_black;


draw_set_color(black);
draw_set_alpha(.65);
draw_rectangle(0, 0, guiW, guiH, 0);
draw_set_alpha(1);
draw_sprite(spr_pauseMenu, current_frame, guiW/2, guiH/2);
/// @description Init stuff
macros();

global.cam = view_camera[0];
zoom = 2;
tgt_zoom = zoom;
zoomSpd = .05;


viewWidth = global.gameWidth*global.windowScale;
viewHeight = global.gameHeight*global.windowScale;

window_set_size(viewWidth, viewHeight);
alarm[0] = 1;

surface_resize(application_surface, viewWidth, viewHeight);
display_set_gui_size(viewWidth, viewHeight);

//window_set_fullscreen(true);
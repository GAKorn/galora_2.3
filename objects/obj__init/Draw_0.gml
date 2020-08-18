/// @description Creates heigths table and start the game
draw_tilemap(tile_map_id, 0, 0);
for (var i = heights_to_get - 1; i >=0; i--) {
	var check = 0;
	while (check <= tilesize) {
		global.heights[i] = check; //here we define the array
		if (check == tilesize) break; //if got to the end and didn't find a blue, go to the next at 0
		if (surface_getpixel(application_surface, i, check) != c_black) break; //if finds a blue, breaks
		check++; //if not, go to the next step of the loop
	}
}

//go to the next room
room_goto_next();
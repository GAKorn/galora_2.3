/// @description Game Setup
//reading game macros
macros();

//reading the sprite
heights_to_get = sprite_get_width(spr_tileColl); //"collumns"
tiles = heights_to_get/tilesize;

//create tiles
var layerid = layer_create(0, "tls_collision"); //creates the layer
tile_map_id = layer_tilemap_create(layerid, 0, 0, spr_tileColl, tiles, 1);

for (var i = 0; i <= tiles; i++){
	tilemap_set(tile_map_id, i, i, 0); //draw each tile side by side
}
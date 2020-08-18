///@function get_collision_points
///@description gets the collision points for the sprite, to compare with the tiles
///@param value1
///@param value1_subtract
///@param value2
///@param value2_subtract
function get_coll_point(argument0, argument1, argument2, argument3) {

	var v1 = argument0 - argument1;
	var v2 = argument2 - argument3;

	var point = [1, 2];

	return point;

	/* This should work like this:
	You call it like this: get_coll_points(bbox_right, 1, bbox_bottom, sprite_height/2);

	then it works as this
	var value 1 = bbox_right-1; //ge the value 1
	var value 2 = bbox_bottom-sprite_height/2; //get the value 2

	var point = [value1, value2]; //pass it as points in an array
	return point; //return this points
	*/


}

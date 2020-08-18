
	#region Chance
/// @description Chance(percent)
/// @param percent
function chance(_percent) {

	// Returns true or false depending on RNG
	// ex: 
	//		Chance(0.7);	-> Returns true 70% of the time

	return _percent > random(1);
}
	#endregion

	#region Approach
///@function approach(a, b, amount)
///@param a
///@param b
///@param amount
function approach(a, b, amount) {
	// Moves "a" towards "b" by "amount" and returns the result
	// Nice bcause it will not overshoot "b", and works in both directions
	// Examples:
	//      speed = Approach(speed, max_speed, acceleration);
	//      hp = Approach(hp, 0, damage_amount);
	//      hp = Approach(hp, max_hp, heal_amount);
	//      x = Approach(x, target_x, move_speed);
	//      y = Approach(y, target_y, move_speed);

	if (a < b)
	{
	    a += amount;
	    if (a > b)
	        return b;
	}
	else
	{
	    a -= amount;
	    if (a < b)
	        return b;
	}
	return a;

}
	#endregion

	#region Wave
///@function wave(from, to, duration, offset)
///@param from
///@param to
///@param duration
///@param offset
function wave(from, to, duration, offset) {

	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//      x = Wave(-10,10,0.25,0)         -> move left and right quickly

	// Or here is a fun one! Make an object be all squishy!! ^u^
	//      image_xscale = Wave(0.5, 2.0, 1.0, 0.0)
	//      image_yscale = Wave(2.0, 0.5, 1.0, 0.0)

	var a4 = (to - from) * 0.5;
	return from + a4 + sin((((current_time * 0.001) + duration * offset) / duration) * (pi*2)) * a4;

}

	#endregion
	
	#region Wrap
/// @description wrap(value, min, max)
/// @function wrap
/// @param value
/// @param min
/// @param max
function wrap(value, _min, _max) {
	// Returns the value wrapped, values over or under will be wrapped around

	if (value mod 1 == 0)
	{
		while (value > _max || value < _min)
		{
			if (value > _max)
				value += _min - _max - 1;
			else if (value < _min)
				value += _max - _min + 1;
		}
		return(value);
	}
	else
	{
		var vOld = value + 1;
		while (value != vOld)
		{
			vOld = value;
			if (value < _min)
				value = _max - (_min - value);
			else if (value)
				value = _min + (value - _max);
		}
		return(value);
	}

}	
	#endregion
	
	#region Animation End
	
function animation_end(){
	/// @description animation_end(sprite_index,image_index, rate)
	/// @param {real} <sprite_index> The index of the sprite being animated
	/// @param {real} <image_index> The current frame value
	/// @param {real} <rate> -See Below-
	///     The rate of change in frames per step if not
	///     using built in image_index/image_speed.  
	///     Don't use if you don't think you need this.  You probably don't.
 
	//returns true if the animation will loop this step.
 
	//Script courtesy of PixellatedPope & Minty Python from the GameMaker subreddit discord 
	//https://www.reddit.com/r/gamemaker/wiki/discord
	
	var _sprite = sprite_index;
	var _image = image_index;
	
	if (argument_count > 0) _sprite = argument[0];
	if (argument_count > 1) _image = argument[1];
	
	var _type = sprite_get_speed_type(sprite_index);
	var _spd = sprite_get_speed(sprite_index)*image_speed;
	if (_type == spritespeed_framespersecond) _spd = _spd/room_speed;
	if (argument_count > 2) _spd = argument[2];
	return _image+_spd >= sprite_get_number(_sprite);
	
}
	
	#endregion
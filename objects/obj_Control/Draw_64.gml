/// @description HUD
//settiing font
	draw_set_font(fnt_remnant);
	draw_set_color(c_white);

//left upper corner
if hasPlayer{
	draw_text(5, 3, "HP: "+string(global.player.HP)+"/"+string(global.player_maxHP));
	draw_text(5, 18, "Stamina: "+string(global.player.STA)+"/"+string(global.player_maxSTA));
	draw_text(5, 33, "Mana: "+string(global.player.MP)+"/"+string(global.player_maxMP));
	if global.moneyHUD draw_text(5, 325, "Money: "+string(global.playerMoney));
	if global.xpHUD draw_text(5, 340, "XP: "+string(global.playerXP)+"/"+string(global.playerXP_Needed));	
}
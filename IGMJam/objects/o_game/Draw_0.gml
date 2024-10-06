/// @desc UI
if (room == r_gameplay)
{
	draw_set_font(global.fontS)
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// Score
	draw_text(72, 199, "target: " + string(targetScore));
	draw_text(161, 199, "score: " + string(playerScore));
	
	// Timer
	draw_set_color(c_white);
	var _timerPercent = gameTimer / maxGameTimer;
	draw_rectangle(73, 213, max(73, 73 + 173 * _timerPercent), 225, false);
}

if (room == r_gameover)
{
	scribble_anim_wave(2, 50, 0.05);
	
	draw_set_font(fnt_boreBlasters16);
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text(GAMEWIDTH/2, 20, "GAME OVER");
	
	draw_set_font(global.font);
	draw_set_color(c_white);
	draw_text(GAMEWIDTH/2, 48, "Score: " + string(playerScore));
	
	draw_set_font(global.fontS);
	draw_text_scribble(GAMEWIDTH/2, 60, "[wave]press enter to continue");
	
}
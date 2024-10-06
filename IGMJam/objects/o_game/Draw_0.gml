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
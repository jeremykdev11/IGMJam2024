/// @desc Draw Menus
#region Main Menu
if (room == r_menu)
{
	//Draw Main Menu
	
	// Menu Art
	var _art = 104;
	draw_sprite(s_etchFull, 0, _art, _art + 6*sin(get_timer()/500000))
	
	// Menu Buttons
	scribble_anim_wave(1, 50, 0.2);
	draw_set_font(fnt_boreBlasters16);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	for (var i = 0; i < menuLength; i++)
	{
		draw_set_color(c_black);
		if (options[menu, i] != 0 && options[menu, i] != undefined)
		{
			var _y = GAMEHEIGHT*0.75 + (menuSpace * i);
			if (i == pos)
			{
				draw_set_color(c_white);
				draw_sprite(s_menuItem, 1, -16 + selectCurPos, _y);
				draw_text_scribble(8 + selectCurPos, _y, options[menu, i]);
			}
			else
			{
				draw_sprite(s_menuItem, 0, -16, _y);
				draw_text_scribble(8, _y, options[menu, i]);
			}
		}
	}
	//Other Text
}
#endregion
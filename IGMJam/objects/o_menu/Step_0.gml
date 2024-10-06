/// @desc

menuUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
menuDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
menuSelect = keyboard_check_pressed(vk_enter);

if (GamePaused()) exit;

// Get Menu Position
if (menuUp) pos--;
if (menuDown) pos++;
if (pos > menuHighest) pos = menuLowest;
if (pos < menuLowest) pos = menuHighest;

selectCurPos = lerp(selectCurPos, selectTargetPos, 0.5);

//Menu Move Sounds
	
if (menuUp || menuDown)
{
	selectCurPos = 0;
	audio_sound_pitch(snd_hover, random_range(0.93, 1.07));
	audio_play_sound(snd_hover, 5, false);
}
	
#region Interact with Main Menu
if (menuSelect)
{
	switch(menu)
	{
		case 0: // Main Menu
			switch(pos)
			{
				case 0: // Play
					audio_sound_pitch(snd_select, random_range(0.9, 1.1));
					audio_play_sound(snd_select, 5, false)
					instance_create_depth(0, 0, -999, o_transitionOut, { targetRoom : r_gameplay} );
				break;
				
				case 1: // QUIT
					game_end();
				break;
			}
	}
	GetMenuSize();
}
#endregion
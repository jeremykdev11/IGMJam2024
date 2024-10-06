/// @desc Run Game

if (GamePaused()) exit;

if (room == r_gameplay)
{
	if (playerScore >= targetScore)
	{
		NextWave();
	}
	
	// Game over
	if (gameTimer <= 0)
	{
		GameOver();
	}
	
	gameTimer--;
}

if (room == r_gameover)
{
	if (keyboard_check_pressed(vk_enter))
	{
		instance_create_depth(0, 0, -999, o_transitionOut, { targetRoom : r_menu} );
	}
}
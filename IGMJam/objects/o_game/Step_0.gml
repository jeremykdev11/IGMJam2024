/// @desc Run Game
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
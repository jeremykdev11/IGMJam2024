/// @desc Game Functions

function NextWave()
{
	gameTimer = maxGameTimer;
	targetScore += 100*wave;
	if (instance_exists(o_bunnySpawner))
	{
		with (o_bunnySpawner) SpawnNewWave(2);
	}
	wave++;
}

function GameOver()
{
	instance_create_depth(0, 0, -999, o_transitionOut, { targetRoom : r_gameover} );
}
/// @desc Config

spawnPerWave	= 3;
timePerWave		= 900;
waveTimer		= 0;

function SpawnNewWave()
{
	waveTimer = timePerWave;
	for (var i = 0; i < spawnPerWave; i++)
	{
		NewBunny();
	}
}

function NewBunny()
{
	var _startX; var _startY;
	
	var _side = irandom_range(0, 3);
	switch (_side)
	{
		case 0:	// Right
			_startX = GAMERIGHTBOUND + 8;
			_startY = random_range(GAMETOPBOUND, GAMEBOTTOMBOUND);
		break;
			
		case 1:	// Top
			_startX = random_range(GAMELEFTBOUND, GAMERIGHTBOUND);
			_startY = GAMETOPBOUND - 8;
		break;
			
		case 2: // Left
			_startX = GAMELEFTBOUND - 8;
			_startY = random_range(GAMETOPBOUND, GAMEBOTTOMBOUND);
		break;
			
		case 3:	// Bottom
			_startX = random_range(GAMELEFTBOUND, GAMERIGHTBOUND);
			_startY = GAMEBOTTOMBOUND + 8;
		break;
	}
	instance_create_layer(_startX, _startY, "Instances", o_dustBunny);
}
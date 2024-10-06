/// @desc Bunny spawning

if (waveTimer <= 0)
{
	SpawnNewWave(spawnPerWave);
	timePerWave = max(90, timePerWave - 30);
}
waveTimer--;

if (bunnyTimer <= 0)
{
	bunnyTimer = bunnyCountTime;
	spawnPerWave = min(spawnPerWave+1, 10);
}
bunnyTimer--;
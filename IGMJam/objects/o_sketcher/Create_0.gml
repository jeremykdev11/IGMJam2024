/// @desc Etch-a-Sketch controller

#region Config

// Movement
hSpeed			=	0;
vSpeed			=	0;
moveSpeed		=	1;

// Sketching
sketchDir		=	-1;
prevSketchDir	=	-1;

vertexList		= ds_list_create();

intersectSafeguard = 0;

#endregion

#region State Machine

function CreateVertex()
{
	var _coordinates = 
	{
		x: x,
		y: y
	};
	ds_list_add(vertexList, _coordinates);
		
	// Update safeguard
	intersectSafeguard = 2;
}

StateFree = function()
{
	// Movement
	var _inputDirection = point_direction(0, 0, rightHeld - leftHeld, downHeld - upHeld);
	var _inputMagnitude = (rightHeld - leftHeld != 0) || (downHeld - upHeld != 0);
	
	hSpeed = lengthdir_x(_inputMagnitude * moveSpeed, _inputDirection);
	vSpeed = lengthdir_y(_inputMagnitude * moveSpeed, _inputDirection);
	
	// Update sketchDir
	if (_inputMagnitude != 0) 
	{
		sketchDir = _inputDirection;
		// Sketch particles
		part_type_direction(global.pParticle, _inputDirection + 140, _inputDirection + 220, 0, 0);
		part_type_life(global.pParticle, 10, 20);
		part_type_speed(global.pParticle, 0.3, 0.5, -0.01, 0);
		part_particles_create(global.pSystem, x, y, global.pParticle, 1);
	}
	// If player changes direction, create a vertex
	if (prevSketchDir != sketchDir)
	{
		CreateVertex();
	}
	
	// Move sketcher
	x += hSpeed;
	y += vSpeed;
	
	if (x < GAMELEFTBOUND || x > GAMERIGHTBOUND)
	{
		x = clamp(x, GAMELEFTBOUND, GAMERIGHTBOUND);
		CreateVertex();
	}
	if (y < GAMETOPBOUND || y > GAMEBOTTOMBOUND)
	{
		y = clamp(y, GAMETOPBOUND, GAMEBOTTOMBOUND);
		CreateVertex();
	}
		
	// Check for line intersection
	if (intersectSafeguard == 0)
	{
		var _curPoint = { x: x, y : y }
		var _intersectionIndex = FindIntersection(vertexList, _curPoint);
		if (_intersectionIndex != -1)
		{
			// Play sound
			audio_sound_pitch(snd_explode, random_range(0.9, 1.1));
			audio_play_sound(snd_explode, 5, false);
			
			// Add intersection point to vertex line
			CreateVertex();
			
			// - Create shape using intersection point
			var _shape = CreateShape(vertexList, _intersectionIndex);
			
			// Capture dust bunnies in shape
			var _bunnies = GetCapturedBunnies(_shape)
			
			// Calculate bonus for number of bunnies caught
			var _catchBonus = 1;
			if (ds_list_size(_bunnies) > 1)
			{
				_catchBonus += min(1, ds_list_size(_bunnies)*0.1);
			}
			// Calculate bonus for capturing with extra time
			var _timeBonus = 1;
			
			_timeBonus += o_game.gameTimer / o_game.maxGameTimer;
			_timeBonus = round(_timeBonus*10)/10;
			
			// Add to score with bonuses
			o_game.playerScore += 100 * ds_list_size(_bunnies) * _catchBonus * _timeBonus;
			
			for (var i = 0; i < ds_list_size(_bunnies); i++)
			{
				with(_bunnies[| i])
				{
					// Particle
					part_type_direction(global.pParticle, 0, 359, 0, 0);
					part_type_life(global.pParticle, 30, 60);
					part_type_speed(global.pParticle, 0.5, 1, -0.02, 0);
					part_particles_create(global.pSystem, x, y, global.pParticle, 5);
					
					// Word
					instance_create_layer(x, y, "Word_Particles", o_wordParticle,
					{
						drawFont : "s_font",
						wordString : "+100"
					});
					var _bonusOffset = 0;
					if (_catchBonus > 1) 
					{
						instance_create_layer(x, y + 8, "Word_Particles", o_wordParticle,
						{
							drawFont : "s_fontS",
							wordString : "*" + string_format(_catchBonus, 1, 1) + " caught"
						});
						_bonusOffset = 6;
					}
					if (_timeBonus > 1)
					{
						instance_create_layer(x, y + 8 + _bonusOffset, "Word_Particles", o_wordParticle,
						{
							drawFont : "s_fontS",
							wordString : "*" + string_format(_timeBonus, 1, 1) + " time"
						});
					}
					
					instance_destroy();
				}
			}
			ds_list_destroy(_bunnies);
			
			// Screenshake
			o_screenshake.magnitude = 20;
			
			// Reset vertex list and clean up shape
			ds_list_clear(vertexList)
			ds_list_destroy(_shape);
			
			// Re-add vertex for drawing
			CreateVertex();
		}
	}
	
	// END OF FUNCTION UPDATES
	// Update prevSketchDir
	prevSketchDir = sketchDir;
	if (intersectSafeguard > 0) intersectSafeguard--;
}
state = StateFree;

#endregion
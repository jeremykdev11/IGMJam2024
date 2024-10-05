/// @desc Config

// Movement
hSpeed			=	0;
vSpeed			=	0;
moveSpeed		=	0.2;

// Random
function RandomDirection()
{
	var _x = irandom_range(GAMELEFTBOUND, GAMERIGHTBOUND);
	var _y = irandom_range(GAMETOPBOUND, GAMEBOTTOMBOUND);
	var _angle = point_direction(x, y, _x, _y);
	_angle = round(_angle/45)*45;
	
	return _angle;
}
function RandomTimeInterval() { return random_range(180, 300); }

moveDirection	=	RandomDirection;
stateTimer		=	RandomTimeInterval();

// State Machines
StateMoving = function()
{
	if (stateTimer <= 0)
	{
		stateTimer = RandomTimeInterval();
		sprite_index = s_dustBunnyStill;
		state = StateStill;
		return;
	}
	
	hSpeed = lengthdir_x(moveSpeed, moveDirection);
	ySpeed = lengthdir_y(moveSpeed, moveDirection);
	
	x += hSpeed;
	y += ySpeed;
	
	stateTimer--;
}
StateStill = function()
{
	if (stateTimer <= 0)
	{
		stateTimer = RandomTimeInterval();
		moveDirection = RandomDirection();
		sprite_index = s_dustBunnyMoving;
		state = StateMoving;
		return;
	}
	
	stateTimer--;
}
state = StateMoving;
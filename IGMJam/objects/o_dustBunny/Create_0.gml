/// @desc Config

// Movement
hSpeed			=	0;
vSpeed			=	0;
moveSpeed		=	0.2;

// Random
function RandomDirection() { return random(7)*45; }
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
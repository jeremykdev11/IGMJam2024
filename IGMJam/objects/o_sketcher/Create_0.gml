/// @desc Etch-a-Sketch controller

#region Config

// Movement
hSpeed			=	0;
vSpeed			=	0;
moveSpeed		=	1;

// Sketching
sketchDir		=	-1;
prevSketchDir	=	-1;

vertexList = ds_list_create();
shapeList = ds_list_create();

#endregion

#region State Machine

StateFree = function()
{
	// Movement
	var _inputDirection = point_direction(0, 0, rightHeld - leftHeld, downHeld - upHeld);
	var _inputMagnitude = (rightHeld - leftHeld != 0) || (downHeld - upHeld != 0);
	
	hSpeed = lengthdir_x(_inputMagnitude * moveSpeed, _inputDirection);
	vSpeed = lengthdir_y(_inputMagnitude * moveSpeed, _inputDirection);
	
	// Update sketchDir
	if (_inputMagnitude != 0) sketchDir = _inputDirection;
	// If player changes direction, create a vertex
	if (prevSketchDir != sketchDir)
	{
		var _coordinates = 
		{
			x: x,
			y: y
		};
		ds_list_add(vertexList, _coordinates);
	}
	
	// Move sketcher
	x += hSpeed;
	y += vSpeed;
	
	// Check for line intersection
	var _intersectionIndex = FindIntersection(vertexList);
	if (_intersectionIndex != -1)
	{
		// Create new shape and add to shape list
		show_debug_message(get_timer());
	}
	
	// Update prevSketchDir
	// Make sure this is at the END of the function
	prevSketchDir = sketchDir;
}
state = StateFree;

#endregion
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
		
		// Update safeguard
		intersectSafeguard = 1;
	}
	
	// Move sketcher
	x += hSpeed;
	y += vSpeed;
		
	// Check for line intersection
	if (intersectSafeguard == 0)
	{
		var _intersectionIndex = FindIntersection(vertexList);
		if (_intersectionIndex != -1)
		{
			intersectSafeguard = 1;
			
			// Create shape:
			// - Add intersection point to vertex list
			var _coordinates = 
			{
				x: x,
				y: y
			};
			ds_list_add(vertexList, _coordinates);
			
			// - Create shape using intersection point
			var _shape = CreateShape(vertexList, _intersectionIndex);
			
			show_debug_message(point_in_polygon(160, 144, _shape));
			
			ds_list_clear(vertexList)
			ds_list_destroy(_shape);
		}
	}
	
	// END OF FUNCTION UPDATES
	// Update prevSketchDir
	prevSketchDir = sketchDir;
	if (intersectSafeguard > 0) intersectSafeguard--;
}
state = StateFree;

#endregion
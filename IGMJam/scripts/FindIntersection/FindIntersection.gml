// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FindIntersection(_vertexList){
	for (var _i = 1; _i < ds_list_size(_vertexList); _i++)
	{
		var _x1 = _vertexList[| _i - 1].x;
		var _y1 = _vertexList[| _i - 1].y;
		var _x2 = _vertexList[| _i].x;
		var _y2 = _vertexList[| _i].y;
		
		// Return the index of the next point AFTER the intersection
		if (collision_line(_x1, _y1, _x2, _y2, o_sketcher, false, false) != noone) return _i;
	}
	// If no intersection, return -1
	return -1;
}
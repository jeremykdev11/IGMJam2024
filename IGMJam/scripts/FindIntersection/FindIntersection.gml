// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FindIntersection(_vertexList, _sketchPoint){
	for (var _i = 1; _i < ds_list_size(_vertexList); _i++)
	{
		var _x1 = _vertexList[| _i - 1].x;
		var _y1 = _vertexList[| _i - 1].y;
		var _x2 = _vertexList[| _i].x;
		var _y2 = _vertexList[| _i].y;
		
		var _x3 = _vertexList[| ds_list_size(_vertexList) - 1].x;
		var _y3 = _vertexList[| ds_list_size(_vertexList) - 1].y;
		var _x4 = _sketchPoint.x;
		var _y4 = _sketchPoint.y;
		
		// Return the index of the next point AFTER the intersection
		var _intersectPoint = lines_intersect(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, true);
		if (_intersectPoint > 0 && _intersectPoint < 1) return _i;
		// Backup code lol
		if (collision_line(_x1, _y1, _x2, _y2, o_sketcher, false, false) != noone) return _i;
	}
	// If no intersection, return -1
	return -1;
}
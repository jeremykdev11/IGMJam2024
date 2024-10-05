for (var _i = 0; _i < ds_list_size(vertexList); _i++)
{
	draw_set_color(c_blue);
	draw_circle(vertexList[| _i].x, vertexList[| _i].y, 1, false);
}

for (var _i = 1; _i < ds_list_size(vertexList); _i++)
{
	var _x1 = vertexList[| _i - 1].x;
	var _y1 = vertexList[| _i - 1].y;
	var _x2 = vertexList[| _i].x;
	var _y2 = vertexList[| _i].y;
	
	// Return the index of the next point AFTER the intersection
	draw_line(_x1, _y1, _x2, _y2);
}

draw_self();
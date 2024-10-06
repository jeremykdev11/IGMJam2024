// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GetCapturedBunnies(_shape)
{
	var _list = ds_list_create();
	
	// No bunnies
	if (!instance_exists(o_dustBunny)) return _list;
	
	with (o_dustBunny)
	{
		if (point_in_polygon(x, y, _shape)) ds_list_add(_list, id);
	}
	
	return _list;
}
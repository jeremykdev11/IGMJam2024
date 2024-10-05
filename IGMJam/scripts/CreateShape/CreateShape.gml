// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateShape(_vertexList, _startIndex){
	
	var _vertexCount = ds_list_size(_vertexList) - _startIndex;
	var _newShape = ds_list_create();
	
	for (var _i = 0; _i < _vertexCount; _i++)
	{
		ds_list_add(_newShape, _vertexList[| _i + _startIndex].x); 
		ds_list_add(_newShape, _vertexList[| _i + _startIndex].y);
	}
	return _newShape;
}
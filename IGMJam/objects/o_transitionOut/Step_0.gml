if (image_index >= image_number - 1)
{
	room_goto(targetRoom);
	instance_create_depth(0, 0, -999, o_transitionIn);
	instance_destroy();
}
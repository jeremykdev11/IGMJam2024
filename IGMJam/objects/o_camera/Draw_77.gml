///@desc Manually Draw App. Surface

gpu_set_blendenable(false);

var _scale = window_get_width()/camW;
draw_surface_ext
(
	application_surface,
	0,
	0,
	_scale,
	_scale,
	0,
	c_white,
	1.0
);

gpu_set_blendenable(true);
shader_reset();
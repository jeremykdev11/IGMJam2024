///@desc Manually Draw App. Surface

gpu_set_blendenable(false);

shader_set(SHD_CRT);
shader_set_uniform_f_array(UCRTParams, CRT.Params);

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
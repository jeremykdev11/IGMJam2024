///@desc Initialize Camera
camW	 =	GAMEWIDTH;
camH	 =	GAMEHEIGHT;

surface_resize(application_surface, camW, camH)

UCRTParams = shader_get_uniform(SHD_CRT, "params");
CRT = new CRTParameters();

application_surface_draw_enable(false);

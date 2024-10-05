function CRTParameters() constructor
{
	enum ECRT
	{
		ResX,
		ResY,
		ResScale,
		HardScan,
		HardPixel,
		WarpX,
		WarpY,  
		MaskDark,
		MaskLight,
		SRGB,
		Last
	}
	
	// Some default values that look decent            Scale  Scan  Pixel  WarpX  WarpY  Dark  Light  SRGB
	Params = [window_get_width(), window_get_height(), 1.0,   -8.0, -20.0,  64.0,  80.0,  0.5,  1.5,   1];
	ShaderOn = true;
	
	function Set(_resX, _resY, _resScale, _scan, _pixel, _warpX, _warpY, _dark, _light, _srgb)
	{
		Params = 
		[
			_resX,
			_resY,
			clamp(_resScale, 2, 6),
			clamp(_scan, -8, -16),
			clamp(_pixel,-2, -4),
			clamp(_warpX, 0, 32),
			clamp(_warpY, 0, 24),
			clamp(_dark,  0.2, 2),
			clamp(_light, 0.2, 2),
			_srgb
		];
	}
	
	function SetResolution(_resX, _resY)
	{
		Params[ECRT.ResX] = _resX;
		Params[ECRT.ResY] = _resY;
	}
}

function GameStateCreate() constructor
{
	Name    = "CRT Shader";
	Version = "0.0.0.1";
	
	CRT = new CRTParameters();
}

function InvLerp(_min, _max, _val)
{
	return (_val - _min) / (_max - _min);	
}

function Log() 
{
	var _msg = "LOG: ", _arg;
	for (var _i = 0; _i < argument_count; _i++)
	{
		_arg = argument[_i];
		if is_string(_arg) { _msg += _arg+" "; continue; }
	    _msg += string(_arg)+" ";
	}  
	show_debug_message(_msg);
}

#region MACROS
	#macro INPUT_HOR (keyboard_check(ord("D")) - keyboard_check(ord("A")))
	#macro INPUT_VER (keyboard_check(ord("S")) - keyboard_check(ord("W")))
	#macro MOUSE_WHEEL (mouse_wheel_down() - mouse_wheel_up())

	#macro VIEW view_camera[0]
	#macro VIEW_WIDTH 160
	#macro ZOOM_MIN 0.4
	#macro ZOOM_MAX 4
	#macro ZOOM_SPEED 0.1

	#macro TX var _textH = string_height("H") var _textX = 
	#macro TY var _textY = 
	#macro TEXT draw_text(_textX, _textY, 
	#macro ENDLINE ); _textY += _textH
	#macro NEWLINE _textY += _textH
#endregion
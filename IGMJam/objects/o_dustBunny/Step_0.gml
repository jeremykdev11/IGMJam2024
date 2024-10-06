/// @desc Movement behavior

if (GamePaused()) exit;

state();

depth = -y;

if (hSpeed != 0)
{
	image_xscale = sign(hSpeed);
}
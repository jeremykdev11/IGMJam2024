/// @desc Update shake
magnitude = lerp(magnitude, 0, 0.2);
shakeFXparams[$ "g_Magnitude"] = magnitude;
fx_set_parameters(shakeFX, shakeFXparams);
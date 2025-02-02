/// @desc Game Config

// Random
randomize();

var _gain = audio_group_get_gain(audiogroup_default);
audio_group_set_gain(audiogroup_default, _gain * 0.4, 0);


//Particle Setup
global.pSystem = part_system_create_layer("Management", true);
global.pParticle = part_type_create();

//pParticle
part_type_sprite(global.pParticle, s_particle, false, false, false);
part_type_size(global.pParticle, 1, 1, 0, 0);
part_type_direction(global.pParticle, 0, 359, 0, 0);
part_type_life(global.pParticle, 30, 60);
part_type_speed(global.pParticle, 0.5, 1, -0.02, 0);
part_type_alpha2(global.pParticle, 1, 0);

// Font
draw_set_font(fnt_boreBlasters16);
global.font = font_add_sprite(s_font, 32, true, -1);
global.fontS = font_add_sprite(s_fontS, 32, true, -1);

// GAME LOADED
room_goto(r_menu);
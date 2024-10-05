/// @desc Game Config

// Random
randomize();

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

// GAME LOADED
room_goto(r_gameplay);
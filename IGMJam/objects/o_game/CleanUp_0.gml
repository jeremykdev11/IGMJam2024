/// @desc Clean Up Particles + Fonts

part_type_destroy(global.pParticle);
part_emitter_destroy_all(global.pSystem);
part_system_destroy(global.pSystem);
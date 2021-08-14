// Object that spawned this projectile
parentObject = noone;

objIndex = undefined;
playerWho = -1; // zero for P1, 1 for forP2, -1 for enemy/other
// Destination X
destX = x;
oldY = y;

// Call destroy after 120 steps
alarm[0] = 120;

baseSpd = 0;
z = 0;
dmg = 1;

// Placeholder particle system
ps = part_system_create_layer("Instances", false);
pDeath = part_type_create();
part_type_shape(ps, pDeath);
part_type_size(ps, 0.5, 0.5, 0, 0);
part_type_color3(ps, c_fuchsia, c_white, c_orange);
part_type_alpha3(ps, 1, 1, 1);
part_type_speed(ps, 2, 5, -0.10, 0);
part_type_direction(ps, 90, 90, 0, 0);
part_type_orientation(ps, -90, -90, 0, 0, 0);
part_type_blend(ps, true);
part_type_life(ps, 30, 60);
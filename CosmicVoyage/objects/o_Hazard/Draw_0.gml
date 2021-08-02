// Draw hazard object to screen
// (Currently for train)

// Initialize object texture
var tex = sprite_get_texture(spr_Train, 0);

// Create matrix for object
matrix_set(matrix_world, matrix_build(x, y, z, 90, step, 0, 25, 25, -25));
vertex_submit(buff, pr_trianglelist, tex);
matrix_set(matrix_world, matrix_build_identity());
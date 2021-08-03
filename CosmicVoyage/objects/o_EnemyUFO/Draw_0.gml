/// @description Insert description here
// Good huntin' to ya ^^
y --;
tex = sprite_get_texture(spr_Train,0)
matrix_set(matrix_world,matrix_build(x,y,0,-90,0,0,25,10,25))
draw_set_lighting(true)
draw_light_define_ambient(c_red)
vertex_submit(ufoBuff,pr_trianglelist,tex);
matrix_set(matrix_world,matrix_build_identity());
draw_set_lighting(false)



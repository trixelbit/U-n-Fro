/// @description Insert description here
// Good huntin' to ya ^^
y -= spd;
tex = sprite_get_texture(t_asteroid1,0)
matrix_set(matrix_world,matrix_build(x,y,0,-90,0,0,50,50,50))
draw_set_lighting(true)
draw_light_define_ambient(c_white)
vertex_submit(ufoBuff,pr_trianglelist,tex);
matrix_set(matrix_world,matrix_build_identity());
draw_set_lighting(false)



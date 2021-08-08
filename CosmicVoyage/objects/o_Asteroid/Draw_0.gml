/// @description Insert description here
// Good huntin' to ya ^^
y --;
xSpin += spinSpeed;
ySpin += spinSpeed;
xSpin = wrap(xSpin,0,359);
ySpin = wrap(ySpin,0,359);

tex = sprite_get_texture(t_asteroid1,0)
matrix_set(matrix_world,matrix_build(x,y,sin(current_time/700)*20,-90+xSpin,ySpin,0,50,50,50))
vertex_submit(ufoBuff,pr_trianglelist,tex);
matrix_set(matrix_world,matrix_build_identity());


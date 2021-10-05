/// @description Insert description here
// Good huntin' to ya ^^
gpu_set_zwriteenable(false)
gpu_set_ztestenable(false)
matrix_set(matrix_world,matrix_build(0,y,-z-32,-90,0,0,1,1,1))
draw_set_color(c_yellow)
//draw_text(x,0,"[" + string(x) + ", " + string(z) + "]");
matrix_set(matrix_world,matrix_build_identity())
gpu_set_zwriteenable(true)
gpu_set_ztestenable(true)
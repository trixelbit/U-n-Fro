/// @description Insert description here
// You can write your code in this editor
matrix_set(matrix_world,matrix_build(256,room_height-400,200,-90,0,90,200,200,200));
vertex_submit(m_plane,pr_trianglelist,sprite_get_texture(spr_skybox_space,0));
matrix_set(matrix_world,matrix_build_identity());
/// @description Insert description here
// Good huntin' to ya ^^
tSurf = surface_create(view_wport[0],view_hport[0])
surface_copy(tSurf,0,0,application_surface)
shader_set(sh_Palette);
shader_set_uniform_f(sCol1,color_get_red(global.keyCol1)/255,color_get_green(global.keyCol1)/255,color_get_blue(global.keyCol1)/255);
shader_set_uniform_f(sCol2,color_get_red(global.keyCol2)/255,color_get_green(global.keyCol2)/255,color_get_blue(global.keyCol2)/255);
shader_set_uniform_f(sCol3,color_get_red(global.keyCol3)/255,color_get_green(global.keyCol3)/255,color_get_blue(global.keyCol3)/255);
shader_set_uniform_f(sCol4,color_get_red(global.keyCol4)/255,color_get_green(global.keyCol4)/255,color_get_blue(global.keyCol4)/255);

shader_set_uniform_f(dCol1,color_get_red(global.dstCol1)/255,color_get_green(global.dstCol1)/255,color_get_blue(global.dstCol1)/255);
shader_set_uniform_f(dCol2,color_get_red(global.dstCol2)/255,color_get_green(global.dstCol2)/255,color_get_blue(global.dstCol2)/255);
shader_set_uniform_f(dCol3,color_get_red(global.dstCol3)/255,color_get_green(global.dstCol3)/255,color_get_blue(global.dstCol3)/255);
shader_set_uniform_f(dCol4,color_get_red(global.dstCol4)/255,color_get_green(global.dstCol4)/255,color_get_blue(global.dstCol4)/255);

draw_surface(tSurf,0,0)
surface_copy(application_surface,0,0,tSurf)
shader_reset();
surface_free(tSurf)


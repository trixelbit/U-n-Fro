/// @description Insert description here
// Good huntin' to ya ^^
application_surface_draw_enable(false)
// set shader, set uniforms, draw the copied app surface, copy the drawn surface to the og app surface, reset shader
shader_set(sh_Palette);
palette_SetUniforms();
texture_set_stage(shader_get_sampler_index(sh_Palette,"u_AppTex"),surface_get_texture(global.guiSurface))
draw_surface(global.guiSurface,0,0)
shader_reset();

surface_free(global.guiSurface);
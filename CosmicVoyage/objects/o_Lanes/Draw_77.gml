/// @description Palette Pass for application surface
// Good huntin' to ya ^^

application_surface_draw_enable(false)
// set shader, set uniforms, draw the copied app surface, copy the drawn surface to the og app surface, reset shader
shader_set(sh_Palette);
palette_SetUniforms();
palette_TextureOverride(true)
draw_surface(application_surface,0,0)
shader_reset();


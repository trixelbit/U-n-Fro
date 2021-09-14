/// @description Palette Pass for application surface
// Good huntin' to ya ^^

// uses the application surface to perform the recoloring with
tSurf = surface_create(view_wport[0],view_hport[0])
surface_copy(tSurf,0,0,application_surface)
// set shader, set uniforms, draw the copied app surface, copy the drawn surface to the og app surface, reset shader
shader_set(sh_Palette);
palette_SetUniforms();
draw_surface(tSurf,0,0)
surface_copy(application_surface,0,0,tSurf)
shader_reset();

surface_free(tSurf)


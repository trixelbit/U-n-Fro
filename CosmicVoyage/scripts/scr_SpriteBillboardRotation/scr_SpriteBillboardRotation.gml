function DrawSpriteBillboardRotation(sprite, subimage, xx, yy, zz, flip, angle)
{
	shader_set(sh_Billboard);
	var rot = 0;
	if(flip)
	{
		rot = -1;
	}
	else
	{
		rot = 1;
	}
	matrix_set(matrix_world, matrix_build(xx, yy, zz, 0, 0, 0, 1, 1, 1));
	draw_sprite_ext(sprite, subimage, 0, 0, rot, 1, angle, c_white, 1);
	matrix_set(matrix_world, matrix_build_identity());
	shader_reset();
}
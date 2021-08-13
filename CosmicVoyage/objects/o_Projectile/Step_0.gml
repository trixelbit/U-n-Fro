// Collision
if objIndex == undefined
{
	objIndex = parentObject.object_index;	
};

// Movement && Collision
if(parentObject == o_Player.id)
{
	// to-do add in high speed collision checking
	targetID = collision_circle(x,y,10,o_Entity,false,true)
	if targetID != noone && targetID.object_index != objIndex
	{
		if targetID.z == z
		{
			targetID._lives--;
			matrix_set(matrix_world,matrix_build(0,0,0,90,90,90,1,1,1));
			part_particles_create(ps, x, y, pDeath, 5);
			matrix_set(matrix_world,matrix_build_identity());
			instance_destroy(id);
		}
	}		
	y -= baseSpd + (baseSpd * 0.25) + 25;
}
else
{
	targetID = collision_circle(x,y,10,o_Entity,false,true)
	if targetID != noone && targetID.object_index != objIndex
	{
		if targetID.object_index == o_Player
		{
			if targetID.targetZ == z
			{
				targetID._lives--;
				instance_destroy(id);
			}
		}
	}		
	y += 25;
}

// Interpolate to X
x = lerp(x, destX, 0.1);
oldY = y;
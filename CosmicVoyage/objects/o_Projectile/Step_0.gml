// Collision
if (objIndex == undefined)
{
	objIndex = parentObject.object_index;	
};

// Movement && Collision
if(parentObject.object_index == o_Player)
{
	// to-do add in high speed collision checking
	targetID = collision_circle(x,y,10,o_Entity,false,true)
	if targetID != noone && targetID.object_index != objIndex
	{
		if targetID.z == z
		{
			with(targetID)
			{
				var vfx = instance_create_layer(x, y - 10, "Instances", o_vfx_enemyhit);
				vfx.parentId = id;
				audio_play_sound(sfx_enemyhit,1,0);
			}
			
			if targetID._lives == 1
				{
				if playerWho == 0
					{
					o_Player.killsP1 ++ ;
					};
				else if playerWho == 1
					{
					o_Player.killsP2 ++;	
					};
				}
			targetID._lives -= dmg;
			//matrix_set(matrix_world,matrix_build(0,0,0,90,90,90,1,1,1));
			//part_particles_create(ps, x, y, pDeath, 5);
			//matrix_set(matrix_world,matrix_build_identity());
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
				targetID._lives -= dmg;
				instance_destroy(id);
			}
		}
	}		
	y += 25;
}

// Interpolate to X
//x = lerp(x, destX, 0.1);
oldY = y;
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
			instance_destroy(id)
				};
		}		
	show_debug_message("bSpd: " + string(baseSpd))
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
						instance_destroy(id)
			};
				
			}

	}		
	y += 25;
}

// Interpolate to X
x = lerp(x, destX, 0.1);
oldY = y;
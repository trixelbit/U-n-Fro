// Collision
targetID = collision_circle(x,y,10,o_Entity,false,true)
if targetID != noone && targetID.object_index != parentObject.object_index
	{
		targetID._lives --;
		instance_destroy(id)
	};

// Movement
if(parentObject == o_Player.id)
{
	y -= 25;
}
else
{
	y += 25;
}
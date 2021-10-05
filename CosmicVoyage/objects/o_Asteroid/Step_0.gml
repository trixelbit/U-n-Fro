
		var col = collision_sphere(x,y,z,32,o_Entity,true)
		if col != noone && col != undefined
			{
				if col == o_Player.id || col.object_index == o_EnemyUFO
					{
						col._lives --;	
					}
			}


for(i = 0; i < 5; i ++)
	{
		var col = collision_sphere(x,y,z,32,o_Entity,true)
		if col != noone && col != undefined
			{
				if col == o_Player.id || col == o_EnemyUFO.id
					{
						col._lives --;	
					}
			}
	}

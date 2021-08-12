
if collision_rectangle(256-128,y+2,256+128,y+8,o_Player,false,true)
	{
		pLane = o_Player.currentLane;
		pRow  = o_Player.currentRow;
		
			switch(currentAsteroid)
				{
					case asteroidTypes.single: 
					if pRow == currentRow-1 && pLane == currentLane
						{
							o_Player._lives --;
						};
					break;
					case asteroidTypes.row:
					if pRow == currentRow 
						{
							o_Player._lives --;
						}
					break;
					case asteroidTypes.column:
					if pLane == currentLane-1
						{
							o_Player._lives --;	
						};
					break;
					case asteroidTypes.cwasant:
					if pLane != 0 && pRow == 0
						{
							o_Player._lives --;
						};
					else if pLane == 0 && pRow == 0
						{
							o_Player._lives --;	
						};
					break;
				};
	};
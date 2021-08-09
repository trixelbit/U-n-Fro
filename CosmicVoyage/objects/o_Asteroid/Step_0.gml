var col = collision_circle(x,y,10,o_Entity,false,true);

if(col != noone && col.object_index != object_index)
{
	show_debug_message(string(col));
	if  col.object_index == o_Player
		{
	if col.targetZ == z
		{
	col._lives--;
		};
		};
}
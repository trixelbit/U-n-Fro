
if o_GameManager.currentState != GameState.Menu
	{

if(distance_to_point(targetX, y) > 10)
{
	sprite_index = spr_player_left;
	if(targetX > x)
	{
		DrawSpriteBillboard(sprite_index, image_index, x, y, sin(current_time/700)*5, true);
	}
	else if(targetX < x)
	{
		DrawSpriteBillboard(sprite_index, image_index, x, y, sin(current_time/700)*5, false);
	}
}
else
{
	sprite_index = spr_player_idle;
	DrawSpriteBillboard(sprite_index, image_index, x, y, sin(current_time/700)*5, false);
}
	};
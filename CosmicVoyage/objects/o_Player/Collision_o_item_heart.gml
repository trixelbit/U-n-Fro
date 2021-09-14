/// @description Insert description here
// You can write your code in this editor
if(_lives < maxLives)
{
	_lives++;
	audio_play_sound(sfx_heartget,1,false);
	with(other)
	{
		instance_destroy();
	}
}
/// @description Insert description here
// You can write your code in this editor
if(_lives < maxLives)
{
	_lives++;
	with(other)
	{
		instance_destroy();
	}
}
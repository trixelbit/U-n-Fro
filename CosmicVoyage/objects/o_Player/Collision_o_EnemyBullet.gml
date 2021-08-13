/// @description Insert description here
// You can write your code in this editor
_lives--;
audio_play_sound(sfx_playerhit,1,false);
var vfx = instance_create_layer(x, y - 10, "Instances", o_vfx_enemyhit);
with(other)
{
	instance_destroy();
}
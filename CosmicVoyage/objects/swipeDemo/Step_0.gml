/// @description Insert description here
// You can write your code in this editor



switch(global.touchState)
{
	case inputState.swipeUp:
	up();
	break;
	
	case inputState.swipeDown:
	down();
	break;
	
	case inputState.swipeLeft:
	left();
	break;
	
	case inputState.swipeRight:
	right();
	break;
	
	case inputState.tap:
	image_xscale = 3;
	image_yscale = image_xscale;
	break;
	
	case inputState.noTouch:
	hspeed = lerp( hspeed, 0, .2);
	vspeed = lerp( vspeed, 0, .2);
	
	image_xscale = lerp(image_xscale, 1, .15);
	image_yscale = image_xscale;
	break;	
}

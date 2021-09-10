/// @description Insert description here
// You can write your code in this editor
enum inputState
{
	swipeLeft,
	swipeRight,
	swipeUp,
	swipeDown,
	tap,
	noTouch
};


touch_threshold = 10;
counter = 0;
global.touchState = inputState.noTouch;
global.gesture_time_frame = 16;
global.tap_time_frame = 10;



inputs = array_create(5);
for(var i = 0; i < 5; i++)
{
	inputs[i] = new touch_input();
}


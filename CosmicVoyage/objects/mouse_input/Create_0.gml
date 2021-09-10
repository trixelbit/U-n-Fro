/// @description Updates state of input object array and detect touch gestures

enum inputState
{
	swipeLeft,
	swipeRight,
	swipeUp,
	swipeDown,
	tap,
	noTouch // the default when no input is recieved
};

#region Initialize global variables
global.touchState = inputState.noTouch;
global.gesture_time_frame = 16; // the time frame for a gesture to be recognized
global.tap_time_frame = 10; // the time frame for a 'tap' to be recongnized
global.touch_threshold = 10; // the distance a touch must move before being recognized as a 'swipe'
#endregion

#region Populate input array
inputs = array_create(5);
for(var i = 0; i < 5; i++)
{
	inputs[i] = new touch_input();
}
#endregion

global.touchState = inputState.noTouch;

#region Update input objects
// iterate through all input objects in array
for(var i = 0; i < 1; i++ )
	{
		//set input to active on pressed 
		if(device_mouse_check_button_pressed(i, mb_left))
			{
				inputs[i].active = true;
			}
		
		// update input if mouse is down
		if (device_mouse_check_button(i, mb_left))
			{
				inputs[i].update(i);
			}
	}
#endregion

#region Check for Gestures
if(inputs[0].active)
	{
		// swipe up
		if(inputs[0].y_speed < -global.touch_threshold )
			{
				// swipe up action
				global.touchState = inputState.swipeUp;
			}
		// swipe down
		else if (inputs[0].y_speed > global.touch_threshold )
			{
				//swipe down action
				global.touchState = inputState.swipeDown;
			}
		// swipe right
		else if (inputs[0].x_speed > global.touch_threshold)
			{
				//swipe right action
				global.touchState = inputState.swipeRight;
			}
		// swipe left
		else if (inputs[0].x_speed < -global.touch_threshold)
			{
				//swipe left action
				global.touchState = inputState.swipeLeft;
			}
	}
#endregion
	
#region Check for Taps and reset 'input' object	
if(device_mouse_check_button_released(0, mb_left))
	{
		//check that x & y speeds are less than threshold
		if(abs(inputs[0].y_speed) < global.touch_threshold and abs(inputs[0].x_speed) < global.touch_threshold)
		{
			if(inputs[0].counter <= global.tap_time_frame)
			{
				global.touchState = inputState.tap;
			}
		}
		inputs[0].reset();
	}
#endregion




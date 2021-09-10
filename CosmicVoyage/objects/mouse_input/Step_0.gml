global.touchState = inputState.noTouch;

for(var i = 0; i < 1; i++ )
{
	if(device_mouse_check_button_pressed(i, mb_left))
	{
		inputs[i].active = true;
	}
		
	if (device_mouse_check_button(i, mb_left))
	{
		inputs[i].update(i);
	}
}


if(inputs[0].active)
	{
		// swipe up
		if(inputs[0].y_speed < -touch_threshold )
			{
				// swipe up action
				global.touchState = inputState.swipeUp;
		
			
			}
		// swipe down
		else if (inputs[0].y_speed > touch_threshold )
			{
				//swipe down action
				global.touchState = inputState.swipeDown;
		
				
			}
		// swipe right
		else if (inputs[0].x_speed > touch_threshold)
			{
				//swipe right action
				global.touchState = inputState.swipeRight;
		
				
			}
		// swipe left
		else if (inputs[0].x_speed < -touch_threshold)
			{
				//swipe left action
				global.touchState = inputState.swipeLeft;
				
			}
	}
	
	
if(device_mouse_check_button_released(0, mb_left))
	{
		//check that x & y speeds are less than threshold
		if(abs(inputs[0].y_speed) < touch_threshold and abs(inputs[0].x_speed) < touch_threshold)
		{
			if(inputs[0].counter <= global.tap_time_frame)
			{
				global.touchState = inputState.tap;
			}
		}
		inputs[0].reset();
	}
	
	/*
*/
	




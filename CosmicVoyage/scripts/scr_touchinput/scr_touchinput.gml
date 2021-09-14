

function touch_input() constructor
{
	_x = 0;
	_y = 0;
	x_start = 0;
	y_start = 0;
	delta_x = 0;
	delta_y = 0;
	counter = 1;
	x_speed = 0;
	y_speed = 0;
	active = false;
	
	update = function(device_number)
	{
		if(active)
		{
			if(counter < global.gesture_time_frame)
			{
				// first cycle, does not calculate deltas or speed
				if(counter == 1)
				{	
					global.touchState = inputState.noTouch;
					x_start = device_mouse_x(device_number);
					y_start = device_mouse_y(device_number);
				}
				_x = device_mouse_x(device_number);
				_y = device_mouse_y(device_number);
				delta_x = _x - x_start;
				delta_y = _y - y_start;
				x_speed = delta_x/counter;
				y_speed = delta_y/counter;
				
			
				counter++;
			}
			else
			{
				reset();	
			}
		}
	}

	reset = function()
	{
		
		_x = 0;
		_y = 0;
		x_start = 0;
		y_start = 0;
		delta_x = 0;
		delta_y = 0;
		counter = 1;
		x_speed = 0;
		y_speed = 0;
		active = false;
	}
	
}


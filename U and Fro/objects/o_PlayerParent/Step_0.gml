// Input Checks
hInput	=	keyboard_check(right) - keyboard_check(left);
vInput	=	keyboard_check(down) - keyboard_check(up);

// Move Character
x		+=	hInput * spd;
y		+=	vInput * spd;

if(keyboard_check_pressed(vk_tab))
{
	bDebug = !bDebug;
}
// Input Checks
hInput	=	KeyRight() - KeyLeft();
vInput	=	KeyDown() - KeyUp();

// Move Character
x		+=	hInput * spd;
y		+=	vInput * spd;

if(keyboard_check_pressed(vk_tab))
{
	bDebug = !bDebug;
}
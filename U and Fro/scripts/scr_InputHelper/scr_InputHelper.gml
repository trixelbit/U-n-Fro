// Input Helper Script
// A script for getting helping with getting inputs

// Get Up Key Input
function KeyUp()
{
	if((keyboard_check(ord("W"))) or (keyboard_check(ord("I"))) or (keyboard_check(vk_up)) or (keyboard_check(ord(vk_numpad8))))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

// Get Down Key Input
function KeyDown()
{
	if((keyboard_check(ord("S"))) or (keyboard_check(ord("K"))) or (keyboard_check(vk_down)) or (keyboard_check(ord(vk_numpad2))))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

// Get Left Key Input
function KeyLeft()
{
	if((keyboard_check(ord("A"))) or (keyboard_check(ord("J"))) or (keyboard_check(vk_left)) or (keyboard_check(ord(vk_numpad4))))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

// Get Right Key Input
function KeyRight()
{
	if((keyboard_check(ord("D"))) or (keyboard_check(ord("L"))) or (keyboard_check(vk_right)) or (keyboard_check(ord(vk_numpad6))))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}
// Check If Debug
if(bDebug)
{
	draw_text(25, 25, "Input X:		"	+	string(hInput));
	draw_text(25, 50, "Input Y:		"	+	string(vInput));
	draw_text(25, 75, "Player X:	"	+	string(x));
	draw_text(25, 100, "Player Y:	"	+	string(y));
	
	draw_text(25, 150, "Key Up:		"	+	KeyToString(up));
	draw_text(25, 175, "Key Down:	"	+	KeyToString(down));
	draw_text(25, 200, "Key Left:	"	+	KeyToString(left));
	draw_text(25, 225, "Key Right:	"	+	KeyToString(right));
}
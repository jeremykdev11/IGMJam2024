/// @desc Define Menus

// Menu Lists
// Main Menu:
options[0, 0] = "PLAY";
options[0, 1] = "QUIT";

pos = 0;
menu = 0;
menuSpace = 20;
menuLength = array_length(options[menu]);
menuLowest = 0;
menuHighest = 1;

selectTargetPos = 16;
selectCurPos = 0;

function GetMenuSize()
{
	// Lowest menu pos
	for (var i = 0; i < menuLength; i++)
	{
		if (options[menu, i] != 0 && options[menu, i] != undefined) {menuLowest = i; break;}
	}
	// Highest menu pos
	for (var i = menuLength-1; i >= 0; i--)
	{
		if (options[menu, i] != 0 && options[menu, i] != undefined) {menuHighest = i; break;}
	}
}
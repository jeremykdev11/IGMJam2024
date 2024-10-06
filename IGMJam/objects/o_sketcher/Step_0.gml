// User Input
leftHeld		=	keyboard_check(ord("A"));
rightHeld		=	keyboard_check(ord("D"));

upHeld			=	keyboard_check(vk_up);
downHeld		=	keyboard_check(vk_down);

if (GamePaused()) exit;

// Run state machine
state();
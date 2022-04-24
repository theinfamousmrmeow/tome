/// @description 
event_inherited();

enum E_BUTTON_STATES {
	NONE,
	RELEASED,
	PRESSED,
	DOWN,
	LONGPRESS
}

enum E_INPUTS {
	A,
	B,
	X,
	Y,
	L,
	R,
	START,
	SELECT,
	DPAD_LEFT,
	DPAD_RIGHT,
	DPAD_UP,
	DPAD_DOWN,
	LEFTSTICK,
	RIGHTSTICK,
	COUNT
}

enum E_INPUT_TYPES {
	KEYBOARD,
	TOUCH,
	GAMEPAD,
	COUNT
}

//Array for all the acceptable inputs for this controller
//Might be Keyboard + Gamepad 1,
//Might just be Gamepad 2.
//Depends on the game.
inputTypes = array_create(0);

inputType = E_INPUT_TYPES.KEYBOARD;

leftStick = -1;
rightStick = -1;

A = -1;
B = -1;
X = -1;
Y = -1;

joystickDeadzone = 0.1;
///@desc
///@param
function init_gamepads(){
	global.gamepads=array_create(0,0);
	var __i = instance_create_depth(x,y,0,obj_input_gamepad);
	array_push(global.gamepads,__i);
}

function gamepad_input(_gamepad=-1,_keyid){
	//-1 means to check for any and all gamepads
	
	
	
}
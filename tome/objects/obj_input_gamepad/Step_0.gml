/// @description 
event_inherited();

//Clear all inputs




//Search the inputTypes array for any inputs given
//(Single player games might allow any and all inputs to affect all listeners to the gamepad)

switch (inputType){
	
	
	case E_INPUT_TYPES.KEYBOARD:
		#region KEYBOARD
		var __xinput = -1;
		var __yinput = -1;
		__xinput = kb(vk_right) - kb(vk_left);
		__yinput = kb(vk_down) - kb(vk_up);
		
		leftStick = -1;
		if (__xinput!=0 || __yinput!=0){
			leftStick = point_direction(0,0,__xinput,__yinput);
		}
		X = kb(vk_s);
		Y = kb(vk_a);
		A = kb(vk_x);
		B = kb(vk_z);
		
		
		
		#endregion
	break;
	

	
	default:
	
}
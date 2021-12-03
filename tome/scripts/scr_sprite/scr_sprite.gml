function Sprite(_sprite_index=-1,_image_speed=0,_image_index=-1) constructor{
	
	spr_index = _sprite_index;
	img_index = _image_index;
	img_speed = _image_speed;
	img_number = sprite_get_number(_sprite_index);
	frame_speed = sprite_get_speed(_sprite_index);
	game_speed = game_get_speed(gamespeed_fps);
	rate = frame_speed / game_speed;
	
	
	tick = function(){
		img_index += img_speed * rate;
		img_index = img_index mod img_number;
	
	}
	
	change = function(_newSprite,_resetImg=0){
		
		spr_index = _newSprite;
		if (_resetImg){img_index=0;}
		img_number = sprite_get_number(spr_index);
		frame_speed = sprite_get_speed(spr_index);
		game_speed = game_get_speed(gamespeed_fps);
		rate = frame_speed / game_speed;
		//img_index = img_index mod img_number;
	}
	
	endAnimation = function(){
		if (img_index>=img_number-1){img_speed=0; img_index=0;  return true;}
		return false;
	}
	
}
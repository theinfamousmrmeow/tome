/// @description Insert description here
// You can write your code in this editor
x=lerp(x,target_x,0.1);
y=lerp(y,target_y,0.1);
cam = view_get_camera(view);

width = camera_get_view_width(cam);
height = camera_get_view_height(cam);

//x=target_x;
//y=target_y;
//		target_x=x;
//		target_y=y;




if (freeMove){
	target=id;
	var spd=(1+kb(vk_shift))*5;

}


if (target>0){
	if (instance_exists(target)){
		var len= 0;
		var dir = target.direction;
		if ( target.object_index==obj_player){
			len=clamp(target.speed*32,0,128);
			dir = target.moveDirection;
			}

		target_x=target.x+lengthdir_x(len,dir);
		target_y=target.y+lengthdir_y(len,dir);
		z=target.z;
	}
	else {target=-1;}
}

camera_set_view_pos(cam,x+(random(jitter*2)-jitter)-width/2,y-height/2+(random(jitter*2)-jitter));

//UPDATE AUDIO LISTENER
audio_listener_position(x, y, z);


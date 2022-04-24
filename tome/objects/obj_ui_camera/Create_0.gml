/// @description Insert description here
// You can write your code in this editor

target=-1;
target2=-1;
lastChunk=-1;
target_x=x;
target_y=y;
z=0;
cam = view_get_camera(view_current);

jitter=0;

width = camera_get_view_width(cam);
height = camera_get_view_height(cam);

//For screen stop
fpsNormal = game_get_speed(gamespeed_fps);
stopFrames=0;
alarm[0]=10;
freeMove=1
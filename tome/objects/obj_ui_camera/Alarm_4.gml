///@description Handle Camera-Pause events
//Alarm
stopFrames--;
if (stopFrames>0){
    game_set_speed(10,gamespeed_fps)
    alarm[4]=1;
}

if (stopFrames<=0){
    stopFrames=0;
    game_set_speed(fpsNormal,gamespeed_fps);
}
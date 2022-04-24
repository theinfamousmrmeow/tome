/// @description Handle BGM intros
if (global.bgm>0 && global.sting=-1){
	if (loopTime>0){
		var _pos = audio_sound_get_track_position(global.bgm)
		if (playedIntro){
			//Skip intro
			if (_pos<loopTime){
			audio_sound_set_track_position(global.bgm,loopTime);
			}
		}
		else {
			//Check box once played
			if (_pos>=loopTime){playedIntro=true;}
		}
	}
}
if (global.sting!=-1 && !audio_exists(global.sting)){
	global.sting=-1;
	if (global.bgm!=-1) {
		audio_resume_sound(global.bgm);
		audio_sound_gain(global.bgm,0,0);
		audio_sound_gain(global.bgm,bgmGetVolumeSetting(),2000);
	}
}
enum E_SOUNDPRI{
		AMBIENCE,//Mood sounds, dripping water, footsteps, etc
		SFX,//Things that come from AI/player interactions or actions
		PLAYER,//Anything a player does by giving inputs
		BGM,
		COUNT //Total number of priorities
}

#macro AUDIO_CHANNELS 16
#macro BGM_CUTOFF_TIME 1000

///@desc
///@param
function initSound(){
	//audio_listener_position(room_width/2, room_height/2, 0);
	//global.audio_emitter = audio_emitter_create();
	audio_channel_num(AUDIO_CHANNELS);
	//audio_get_listener_count();
	//audio_falloff_set_model(audio_falloff_linear_distance);
	//audio_emitter_falloff(s_emit, obj_game.falloff_ref, obj_game.falloff_max, obj_game.falloff_factor);
	global.sting=-1;
	initBGM();
	instance_create_singleton(audio_handler);

}


#region BGM

function initBGM() {
	global.bgm=-1;
}

///@desc Starts a looping BGM
function bgmStart(_bgm){
	bgmStop();
	global.bgm=audio_play_sound(_bgm,E_SOUNDPRI.BGM,1);
	audio_sound_gain(global.bgm,0,0);
	audio_sound_gain(global.bgm,1,BGM_CUTOFF_TIME);
	audio_handler.loopTime = -1;
}

function bgmGetVolumeSetting(){
	return getSetting("sound","bgmVolume",1);	
}

//@desc Sets volume of sounds played with bgm_ functions
function bgmSetVolume(_volume){
	if (global.bgm>0){
		audio_sound_gain(global.bgm,_volume,25);
	}
}

///@desc
///@param soundID
///@param introDurationMS
function bgmStartWithIntro(){
	bgmStop();
	global.bgm=audio_play_sound(argument0,E_SOUNDPRI.BGM,1);
	audio_sound_gain(global.bgm,0,0);
	audio_sound_gain(global.bgm,1,BGM_CUTOFF_TIME);
	audio_handler.loopTime = (argument1/1000);
	audio_handler.playedIntro=false;
}

///@desc stops current bgm over a duration
function bgmStop(_time=BGM_CUTOFF_TIME){
	if (global.bgm!=-1){
		//TODO:  I'm pretty sure this actually orphans the sound rather than stopping it at 0 Gain.
		audio_sound_gain(global.bgm,0,_time);
		global.bgm=-1;
		}
}

function bgmStopAll() {
	bgmStop();
	//audio_stop_all()
	global.bgm=-1;
}

#endregion

#region STING
	///@desc Plays a sting
	function stingPlay(_soundIndex){
		global.sting = audio_play_sound(_soundIndex,0,0);
		if (audio_exists(global.bgm)) then audio_pause_sound(global.bgm)
	}
#endregion

#region SFX
///@desc Plays a normal 2d sound
function sfxPlay(_soundIndex){
	audio_play_sound(_soundIndex,0,0);
}

///@desc Puts pitch variance on a sound.  Smaller is wider.
function sfxPlayWithVariance(_soundIndex, _priority, _variance=4){
	var s = audio_play_sound(_soundIndex,_priority,0);
	audio_sound_pitch(s,(((random(1))/(_variance))+(1-(1/(2*(_variance))))));
	return s;	
}

///@description Play sound effect with pitch variance, Sound, then priority.
///@arg soundID
///@arg priority
///@arg varianceWidth smaller is wider
///@arg x
///@arg y
function sfxPlayPrioVariAtPosition(argument0, argument1, argument2, argument3, argument4) {

	var cam = view_get_camera(0);
	var xx = camera_get_view_x(cam);
	var yy = camera_get_view_y(cam);
	xx = xx + camera_get_view_width(cam)/2;
	yy = yy + camera_get_view_height(cam)/2;
	var dist = point_distance(xx,yy,argument3,argument4)
	audio_listener_position(xx, yy, 0);

	if (dist<250){
		
		var gain = min(((-1/125)*(point_distance(xx,yy,argument3,argument4)))+2,1);
		var s = audio_play_sound(argument0,argument1,0);
	
		audio_sound_pitch(s,(((random(1))/(argument2))+(1-(1/(2*(argument2))))));
		audio_sound_gain(s,gain*global.volSFX,0);
		return s;	
	}

}


#endregion

#region BUFFER


///@param rate
///@param hertz
function sfxBuffer(){
	var rate = argument[0];//44100;
	var hertz = argument[1];//irandom_range(220, 880);
	var samples = 44100;

	var bufferId = buffer_create(rate, buffer_fast, 1);
	buffer_seek(bufferId, buffer_seek_start, 0);

	var num_to_write = rate / hertz;
	var length = buffer_get_size(bufferId);
	var val_to_write = 1;

	for (var i = 0; i < (samples / num_to_write) + 1; i++)
	{
	    for (var j = 0; j < num_to_write; j++)
	    {
	        buffer_write(bufferId, buffer_u8, val_to_write * 255);
	    }
	    val_to_write = (1 - val_to_write);
	}

	soundId = audio_create_buffer_sound(bufferId, buffer_u8, rate, 0, length, audio_stereo);	
}

#endregion
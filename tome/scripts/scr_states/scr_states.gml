enum E_STATES{
	SPAWN,DESPAWN,
	ATTACK,ATTACK_PREPARE,
	EVADE,
	ENTER_SCREEN,
	EQUIP,
	ATTACK_RECOVER,
	CAST,
	IDLE,WALK,
	HURT,
	INTERACT,

	COUNT
}

function state_init(_defaultState = 0){
	state = _defaultState;
	stateBeginning = false;
	lastState = state;
}

function state_begin(_state){
	if (state != _state){
		stateBeginning=true;	
	}
	lastState = _state;
	state = _state;
}

function state_is(){
	for(var __i=0;__i<argument_count;__i++){
		if (state==argument[__i]){return true;};	
	}
	return false;
}

function state_get(){
	return state;	
}
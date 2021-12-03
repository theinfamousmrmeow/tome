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
	stateTimer = -1;
	lastState = state;
	nextState = -1;
}

function state_tick(){
	if (stateTimer>0){
		stateTimer--;
		if (stateTimer==0){
			stateTimer=-1;
			//Go to transition state;
			if (nextState!=-1){
				state_begin(nextState);
			}
		}
	}
}

function state_begin(_state){
	if (state != _state){
		stateBeginning=true;	
	}
	lastState = _state;
	state = _state;
	nextState=-1;
}

function state_next(_nextState,_timer){
	nextState = _nextState;
	stateTimer = _timer;
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
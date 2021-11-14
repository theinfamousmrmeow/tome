///@desc
///@param
function scr_gamestate(){

}

enum E_GAME_STATES {
	NONE,
	ROUND_START,
	ROUND_END,
	PLAYING,
	PAUSED,
	COUNT
}

function init_gamestate(){
	global.gameState = 	E_GAME_STATES.NONE;
}

function gamestate_set(_state){
	global.gameState = _state;	
}

function gamestate_get(){
	return global.gameState
}

function gamestate_equals(_state){
	return (global.gameState==_state)
}
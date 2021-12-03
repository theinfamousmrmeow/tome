function move_init(){
	moveSpeed = 1;
	moveAccel = 0.25;
	moveDirection = -1;
}

function move_clamp(){
	speed = clamp(speed,-moveSpeed,moveSpeed);
}
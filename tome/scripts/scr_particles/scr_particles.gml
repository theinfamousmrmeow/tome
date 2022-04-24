
function particles_init(){
	instance_create_singleton(obj_particleControl);	
}

///@desc Moves the particle system to the desired depth and spawns particles
function particles_create_depth(_x,_y,_z,_type,_number,_radius){

	_z = _z;

	
	//Get the particle system for this z layer;
	var __ps = -1;
	var __particleSystems = obj_particleControl.particleSystems;
	var __ps = ds_list_find_value(__particleSystems,_z);//  __particleSystems[| _z];
	if (!(__ps && part_system_exists(__ps))){
		__ps = part_system_create();
		part_system_depth(__ps,-_z)
		ds_list_set(__particleSystems,_z,__ps);
	}
	//Spawn particles in our system.
	repeat(_number){
		part_particles_create(__ps,_x+random(_radius*2)-_radius,_y+random(_radius*2)-_radius,_type,1);
	}
}
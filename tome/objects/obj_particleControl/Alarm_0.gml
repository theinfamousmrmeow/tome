/// @description Insert description here
// You can write your code in this editor

var __size = ds_list_size(particleSystems);

for (var __i=0;__i<__size;__i++){
	//
	var __ps = ds_list_find_value(particleSystems,__i);//particleSystems[| __i];
	if (__ps && part_system_exists(__ps))
	{
		var __count = part_particles_count(__ps);
		if (__count==0){
			part_system_destroy(__ps)
			ds_list_delete(particleSystems,__i);
			//if (DEBUG){show_debug_message("Culled Particle Sys at z:"+string(__i));}
			}
	}
}

alarm[0]=15;
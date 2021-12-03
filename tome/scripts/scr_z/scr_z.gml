#macro Z_TERMINAL_VELOCITY -4

function z_init(__z=0,__z_size=8){
	z = __z;
	z_size = __z_size;
	zspeed = 0;
	z_grav = 0.1;
	zfloor=0;
	zprevious=z
	depth = -z;
}
///@param who
function z_collide(){
	
	var o_z = other.z;
	var o_size = other.z_size;
	
	if (z<=o_z){
		//Other is above me
		return (z+z_size >= o_z-o_size);	
	}
	else {
		//Other is below me
		return (z-z_size <= o_z+o_size);
	}
}

function z_depth(){
	if (z!=zprevious || y!=yprevious){depth=-(y+max(0,z));}
	zprevious=z;
}

function z_distance(){
	return abs(argument0.z - argument1.z);
}

function z_speed(){

	if (z>zfloor || zspeed!=0){
	    z+=zspeed;
		if (z>0) then friction=0;
	    zspeed-=z_grav;
	    if (zspeed<Z_TERMINAL_VELOCITY){zspeed=Z_TERMINAL_VELOCITY;}
	    if(z<zfloor){z=zfloor; zspeed=0;}
	}
	else {
		//friction=0;
	}
	if (z<zfloor){z+=1; zspeed=1;}

}


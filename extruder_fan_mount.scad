fan = 40;
offset=0.1;
screw_offset = 4.175;
wall = screw_offset*2;
screw_r = 3*0.5;

module hole(width, length) {
	translate([
			screw_offset+width*(fan-wall),
			screw_offset+length*(fan-wall),
			-offset]){
				cylinder(r=screw_r, h=wall+2*offset, $fs=.5);
	}
}

difference(){
	cube([fan, fan, wall]);
	translate([wall, wall, -offset]){
		cube([fan-2*wall, fan-2*wall, wall+2*offset]);
	}
	hole(0,0);
	hole(1,0);
	hole(0,1);
	hole(1,1);
}

translate([-wall,0,0]){
	difference(){
		cube([wall,wall, 4*wall]);
		translate([0,0,4*wall]){
			rotate(90, [0,1,0]){
				hole(0,0);
			}
		}
	}
}



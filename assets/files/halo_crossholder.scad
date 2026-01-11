$fn = ($preview)?25:150;

/*	Hold two rods at right angles rigidly on an antenna mast e.g. as a support for a halo antenna
 *	by KL4LJ 2025-08-03
 */



vert_height = 25;			//height of vertical section that fits around mast
vert_diameters = [8.8, 9];	//to fit snugly on a slightly conical mast (in my case the SOTABeams Tactical Mini)
wall_thickness = 1.5;			//minimum wall thickness around hole
horiz_length = 50;			//length of sections that rods slide into


tol = 1.03;					//tolerances for holes

rod_diameter = 7.5;			//in my case: fiberglass stakes with reflective tape at the top to mark the edges of driveways, etc in snow

horiz_thickness = rod_diameter + 2*wall_thickness;
vert_thickness = /*the thicker end of the conical hole*/ vert_diameters[1] + 2*wall_thickness;

union() {
	translate([0, 0, vert_height/2]) difference() {
		cube([vert_thickness, vert_thickness, vert_height], center=true);
		cylinder(h=vert_height, d1 = vert_diameters[0], d2 = vert_diameters[1], center=true);
	}

	//            v— maximally overlap walls for strength                v— match bottom of vertical to reduce overhangs
	translate([0, vert_thickness/2 + horiz_thickness/2 - wall_thickness, horiz_thickness/2]) rotate([0, 90, 0]) difference() {
		cube([horiz_thickness, horiz_thickness, horiz_length], center = true);
		cylinder(h=horiz_length, d=rod_diameter*tol, center=true);
	}
	
	translate([vert_thickness/2 + horiz_thickness/2 - wall_thickness, 0, 1.5*horiz_thickness - wall_thickness]) rotate([-90, 0, 0]) difference() {
		cube([horiz_thickness, horiz_thickness, horiz_length], center = true);
		cylinder(h=horiz_length, d=rod_diameter*tol, center=true);
	}
}
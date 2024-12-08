//Yardstick/ruler loop antenna center
$fn = ($preview)?25:150;


body_side = 40;
plate_thickness = 2; 

slot_width = 4.3;
slot_depth = 28;


fillet = 2;

difference() {
	minkowski() {
		difference() {
			rotate(45, [0,0,1]) {
				cube([body_side, body_side, slot_depth + 2*plate_thickness], center = true);
			}
			for(angle = [0, 90, 180, 270]) {
				rotate(angle, [0,0,1]) translate([slot_width * 1.5, slot_width * 1.5, -slot_depth-plate_thickness/2]) cube(2*body_side);
			}
		}
		cylinder(0.001, r=fillet);
	}
	
	cube([slot_width, body_side*2, slot_depth], center = true);
	cube([body_side*2, slot_width, slot_depth], center = true);
}
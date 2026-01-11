$fn = ($preview)?25:150;

//spacer
difference() {
	cube([10, 5, 20], center=true);
	translate([0, 0, -10]) rotate([90, 0, 0]) cylinder(h = 5, r = 1, center=true);
	translate([0, 0, -10]) rotate([0, 90, 0]) cylinder(h = 10, r = 1, center=true);
	translate([0, 0, 10]) rotate([90, 0, 0]) cylinder(h = 5, r = 1, center=true);
	translate([0, 0, 10]) rotate([0, 90, 0]) cylinder(h = 10, r = 1, center=true);
}
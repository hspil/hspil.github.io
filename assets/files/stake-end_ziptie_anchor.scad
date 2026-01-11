/* fiberglass stake end ziptie anchor */
$fn = ($preview)?25:150;

stake_diameter = 7.5;

wire_groove_diameter = 3.5;

wall_thickness = 2;
tube_depth = 25;
tube_diameter = stake_diameter + 2*wall_thickness;

//[width, thickness]
ziptie_dimensions = [2.5, 1.5];

top_thickness = 5;

hole_tol = 1.01;

difference() {
	//body
	union() {
		//block
		translate([0, 0, (tube_depth + top_thickness)/2]) cube([tube_diameter, tube_diameter, top_thickness], center=true);
		//tube
		cylinder(h = tube_depth, d = tube_diameter, center=true);
	}
	//stake hole
	cylinder(h = tube_depth, d = stake_diameter*hole_tol, center=true);
	//wire groove
	translate([0, 0, top_thickness + tube_depth/2]) rotate([90, 0, 0]) cylinder(h = tube_diameter, d = wire_groove_diameter, center=true);
	//ziptie channel
	translate([0, 0, (tube_depth + top_thickness)/2]) cube(concat([tube_diameter], ziptie_dimensions), center=true);
	//ziptie fillets
	translate([tube_diameter/2-ziptie_dimensions[1], 0, top_thickness+(tube_depth/2)-ziptie_dimensions[1]]) difference() {
		translate([0, -ziptie_dimensions[0]/2, 0]) cube([(top_thickness-ziptie_dimensions[1])/2, ziptie_dimensions[0], (top_thickness-ziptie_dimensions[1])/2]);
		rotate([90, 0, 0]) cylinder(h = ziptie_dimensions[0], r = ziptie_dimensions[1], center=true);
	}
	mirror([1, 0, 0]) translate([tube_diameter/2-ziptie_dimensions[1], 0, top_thickness+(tube_depth/2)-ziptie_dimensions[1]]) difference() {
		translate([0, -ziptie_dimensions[0]/2, 0]) cube([(top_thickness-ziptie_dimensions[1])/2, ziptie_dimensions[0], (top_thickness-ziptie_dimensions[1])/2]);
		rotate([90, 0, 0]) cylinder(h = ziptie_dimensions[0], r = ziptie_dimensions[1], center=true);
	};
}


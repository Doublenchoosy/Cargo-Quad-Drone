$fn = 48;

// ---- Parameters (edit these to match your exact parts) ----
plate_t     = 4;      // plate thickness (mm) - PETG recommended
hub         = 70;     // central hub square size (mm)
stack_span  = 30.5;   // SpeedyBee F405 V4 stack hole spacing (mm)
mount_d     = 3.4;    // M3 clearance hole
root_len    = 46;     // length of each arm root stub, from hub edge (mm)
tube_d      = 12.6;   // 12mm carbon tube OD + printing fit clearance
stub_w      = tube_d + 8;  // width of each root stub
tie_d       = 2.4;    // zip-tie hole diameter
wall_case   = 3;       // corner rounding radius

module hub_plate() {
    hull() {
        for (x = [-1,1]) for (y = [-1,1])
            translate([x*(hub/2-wall_case), y*(hub/2-wall_case), 0])
                cylinder(r=wall_case, h=plate_t);
    }
}

module arm_stub(angle) {
    rotate([0,0,angle])
        translate([hub/2*0.7, -stub_w/2, 0])
            cube([root_len, stub_w, plate_t]);
}

module stack_holes() {
    for (x = [-1,1]) for (y = [-1,1])
        translate([x*stack_span/2, y*stack_span/2, -1])
            cylinder(d=mount_d, h=plate_t+2);
}

// shallow cradle groove, not a full-depth cut, so the plate stays structurally intact
groove_depth = 2;
module tube_channel(angle) {
    rotate([0,0,angle])
        translate([hub/2*0.7 + root_len/2, 0, plate_t - groove_depth + tube_d/2])
            rotate([0,90,0])
                cylinder(d=tube_d, h=root_len*0.9, center=true);
}

module tie_holes(angle) {
    rotate([0,0,angle]) {
        for (xp = [hub/2*0.7 + root_len*0.25, hub/2*0.7 + root_len*0.75])
            for (yp = [-1,1])
                translate([xp, yp*(tube_d/2+3), -1])
                    cylinder(d=tie_d, h=plate_t+2);
    }
}

difference() {
    union() {
        hub_plate();
        for (a = [45,135,225,315]) arm_stub(a);
    }
    stack_holes();
    for (a = [45,135,225,315]) {
        tube_channel(a);
        tie_holes(a);
    }
}

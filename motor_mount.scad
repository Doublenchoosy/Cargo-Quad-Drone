$fn = 48;

// ---- Parameters ----
plate_t      = 4;
tube_d       = 12.6;
mount_span   = 19;    // iFlight NIDICI 2812 motor bolt pattern (19x19mm)
motor_hole_d = 3.4;   // M3 clearance
wire_hole_d  = 8;      // center hole for motor wires
plate_len    = 46;     // length of the mount plate (tube clamp + motor face)
plate_w      = 30;     // wide enough for the 19mm motor bolt pattern with edge margin
groove_depth = 2;

module base_plate() {
    hull() {
        for (x = [-1,1]) for (y = [-1,1])
            translate([x*(plate_len/2-3), y*(plate_w/2-3), 0])
                cylinder(r=3, h=plate_t);
    }
}

module tube_channel() {
    translate([-plate_len/2 + plate_w/2, 0, plate_t - groove_depth + tube_d/2])
        rotate([0,90,0])
            cylinder(d=tube_d, h=plate_w+2, center=true);
}

module tie_holes() {
    for (yp = [-1,1])
        translate([-plate_len/2 + plate_w/2, yp*(tube_d/2+3), -1])
            cylinder(d=2.4, h=plate_t+2);
}

module motor_holes() {
    mx = plate_len/2 - mount_span/2 - 4;
    for (x = [-1,1]) for (y = [-1,1])
        translate([mx + x*mount_span/2, y*mount_span/2, -1])
            cylinder(d=motor_hole_d, h=plate_t+2);
    translate([mx, 0, -1])
        cylinder(d=wire_hole_d, h=plate_t+2);
}

difference() {
    base_plate();
    tube_channel();
    tie_holes();
    motor_holes();
}

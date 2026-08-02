$fn = 48;

// ---- Parameters ----
plate_t     = 3;
deck_len    = 100;
deck_w      = 70;
pi_span_x   = 58;    // Raspberry Pi mounting hole spacing (long axis)
pi_span_y   = 49;    // Raspberry Pi mounting hole spacing (short axis)
pi_hole_d   = 2.9;   // M2.5 clearance
stack_span  = 30.5;  // matches center_plate.scad, same standoffs run top to bottom
stack_hole_d = 3.4;
corner_r    = 4;

module deck() {
    hull() {
        for (x = [-1,1]) for (y = [-1,1])
            translate([x*(deck_len/2-corner_r), y*(deck_w/2-corner_r), 0])
                cylinder(r=corner_r, h=plate_t);
    }
}

module pi_holes() {
    for (x = [-1,1]) for (y = [-1,1])
        translate([x*pi_span_x/2, y*pi_span_y/2, -1])
            cylinder(d=pi_hole_d, h=plate_t+2);
}

module standoff_holes() {
    for (x = [-1,1]) for (y = [-1,1])
        translate([x*stack_span/2, y*stack_span/2, -1])
            cylinder(d=stack_hole_d, h=plate_t+2);
}

difference() {
    deck();
    pi_holes();
    standoff_holes();
}

LEG_HEIGHT = 30;
LEG_SPACING = 10;
LEG_WIDTH = 20;
LEG_THICK = 5;

UPPER_WIDTH = 50;
UPPER_HEIGHT = 25;
// slot to fit the shower cap
UPPER_HOLE_WIDTH = 25;

module leg() {
    cube([LEG_WIDTH,LEG_THICK,LEG_HEIGHT]);
}

module cap() {
    cube([(UPPER_WIDTH-UPPER_HOLE_WIDTH)/2,50,5]);
}

leg();
translate([0,LEG_SPACING+LEG_THICK,0]) leg();
translate([-(UPPER_WIDTH-LEG_WIDTH)/2,0,LEG_HEIGHT-1]) {
    difference() {
        cube([UPPER_WIDTH,LEG_THICK*2+LEG_SPACING,UPPER_HEIGHT]);
        translate([(UPPER_WIDTH-UPPER_HOLE_WIDTH)/2,-50,5])
            cube([UPPER_HOLE_WIDTH,100,100]);
    }
    translate([0,0,UPPER_HEIGHT-1]) {
        cap();
        translate([(UPPER_WIDTH+UPPER_HOLE_WIDTH)/2,0,0])
            cap();
    }
}

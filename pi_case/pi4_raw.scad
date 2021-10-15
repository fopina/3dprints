// measurements based on https://www.raspberrypi.org/documentation/hardware/raspberrypi/mechanical/rpi_MECH_4b_4p0.pdf

$fn=50;

// BOARD
BX = 85;
BT = 56;
BW = 2; // WALL
// PIN OUTTER and INNER
POD = 6;
PID = 2.7;
// corner to PIN center distance
PC = 3.5;
// pin distance
PX = 59; // one extra mm than official drawing...
PY = 50;


module board() {
    cube([BX, BT, 2]);
}

module pin() {
    union() {
        cylinder(BW+5,POD/2,POD/2);
        translate([0,0,BW+4.5])
            cylinder(5,PID/2-0.1,PID/2-0.2);
    }
}

module revpin() {
    difference() {
        cylinder(BW+17,POD/2,POD/2);
        translate([0,0,BW+11])
            cylinder(9,PID/2,PID/2);
    }
}

module holes() {
    for(i=[5:10:45])
        translate([POD+i,POD+1,-1])
            cube([PC,PY-POD,4]);
}

module bottom() {
    difference() {
        union() {
            board();
            for(x=[PC,PC+PX])
                for(y=[PC,PC+PY])
                    translate([x,y,0])
                        pin();
        }
        holes();
    }
}

module top() {
    difference() {
        union() {
            board();
            for(x=[PC,PC+PX])
                for(y=[PC,PC+PY])
                    translate([x,y,0])
                        revpin();
        }
        holes();
    }
}

module wall(side=1, h=10) {
    union() {
        cube([BX,2,2]);
        translate([0,side,0])
            cube([BX,1,h]);
    }
}

difference() {
    union() {
        bottom();
        translate([0,BT,0])
            wall();
    }
}

translate([0,-BT-10,0]) {
    difference() {
        union() {
            top();
            translate([0,-2,0])
                wall(side=0, h=15);
        }
        //translate([-10,10,-10]) cube([200,200,200]);
    }
}
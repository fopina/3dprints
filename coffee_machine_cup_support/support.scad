radius = 55;
radius2 = 173.2;
fn = 100;
height = 25;

module sector(radius, angles, fn = 24) {
    r = radius / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module arc(radius, angles, width = 1, fn = 24) {
    difference() {
        sector(radius + width, angles, fn);
        sector(radius, angles, fn);
    }
}

module part() {
    x = -5;
    y = 185;
    difference() {
        union() {
            linear_extrude(height)
                arc(radius-2, [x,y], 10, fn);
            translate([0,0,height])
                linear_extrude(2)
                    arc(radius, [x+10,y-10], 4, fn);
            translate([0,0,-2])
                ring(x,y);
            // circular segment:
            // 10mm height for 2*radius cord length
            translate([0,radius2-10+2-5,0])
                linear_extrude(height)
                    arc(radius2, [-70,-110], 3, fn);
        }

        translate([0,0,height-2])
            ring(x,y);
    }
}

module ring(x,y) {
    linear_extrude(2) difference() {
        arc(radius-2, [x,y], 10, fn);
        arc(radius-2, [x,y], 8, fn);
    }
}

module bridge2() {
    translate([-radius,0,0])
        cube([2*radius,3,height]);
}

difference() {
    union() {
        part();
        bridge2();
        translate([-2,-14,0])
            cube([4,radius-2+14,height]);
    }
    translate([00,-100,-100])
        cube([200,200,200]);
}
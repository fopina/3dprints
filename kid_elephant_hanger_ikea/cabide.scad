// take from https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Primitive_Solids
module prism(l, w, h){
    polyhedron(    
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

/*
measures: 75, 19, 16, 39, 85
thick: 14
*/

module doit() {
    difference() {
        scale([1,0.85,1])
            linear_extrude(13)
                import("12368517.svg");

        translate([-35,-10,-1])
            cube([100,135,30]);

        // if h=40, s=28,28
        // maybe s=30
        // 65 to align + 15 (compared to other piece) = 80
        translate([80,45,30])
            rotate([0,90,45])
                prism(40, 34, 34);        
    }
}

module fit_test() {
    difference() {
        doit();
        // slice everything to test the fitting
        translate([91,-10,-1])
            cube([200,135,30]);
    }
}

module half1() {
    difference() {
        doit();
        // slice everything to test the fitting
        translate([120,-10,-1])
            cube([200,135,30]);
    }
}

module half2() {
    difference() {
        doit();
        // slice everything to test the fitting
        translate([-1,-10,-1])
            cube([121,135,30]);
    }
}

//fit_test();
doit();
//half1();
//half2();
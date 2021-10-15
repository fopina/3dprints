cup_size = 15;
grid_size = 2;

module half_sphere(height) {
    difference() {
        scale([1,1,2]) {
            sphere($fn = 100, d = 2 * height);
        };
        translate([-height,-height,-2 * height]) {
            cube(
                size = [2*height,2*height,2*height],
                center = false
            );
        }
    }
}

module cut_cup(height) {
    difference() {
        half_sphere(height * 1.5);
        translate([0,0,2 * height * 1.5])
            cube(
                size = [2*height,2*height,height],
                center = true
            );
    }
}

module cup(height) {
    difference() {
        cut_cup(cup_size);
        translate([0,0,-1])
            cut_cup(cup_size * 0.7);
    }
}

module grid(w, s) {
    for (i=[-20:s+w:20])
        translate([i,0,0])
            cube(
                size = [w,100,w],
                center = true
            );
}

difference() {
    cup(cup_size);
    grid(grid_size, grid_size);
    rotate([0,0,90])
        grid(grid_size, grid_size);
}
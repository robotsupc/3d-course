module p1() {
    h=5;
    difference() {
        cylinder(h=h, r=20);
        cylinder(h=h, r=10);
        
    }
}



module p2() {
    difference() {
        cylinder(h=80, r=20);
        translate([0,0,2])
        cylinder(h=80, r=18);
    }
}

module p3() {
    module solid() {
        cylinder(r1=40, r2=0, h=30, $fn=4);
        cylinder(r1=20, r2=10, h=80, $fn=30);
    }
    difference() {
        solid();
        cylinder(r1=15, r2=5, h=80, $fn=30);
    }
}


p3();




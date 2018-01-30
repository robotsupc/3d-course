module cajita(h=50, th=5, o=0.2) {
    base_cajita(h, th) children();
    
    translate([0,0,h*1.5])
    tapa_cajita(h, th, o) children();
}


module base_cajita(h, th) {
    // base
    linear_extrude(th) children();
    // parets
    linear_extrude(h) outline(th) children();
}


module tapa_cajita(h, th, o) {
    mirror([0,0,1]) {

        // parets
        difference() {
            union() {
                linear_extrude(th) children();
                linear_extrude(th*2) outline(th*(2+o)) children();
            }
            translate([0,0,th])
            linear_extrude(2*th) {
                outline(th*(1+o)) children();
                children();
            }
        }
    }
}

module outline(s) {
    difference() {
        offset(s/2) children();
        children();
    }
    difference() {
        children();
        offset(-s/2) children();
    }
}


module shape1(s) {
    difference() {
        union() {
            square(s);
            circle(s);
        }
        translate([1,1]*s/2) circle(s/3);
        translate(-[1,1]*s/2) circle(s/3);
        circle(s/3);
    }
    
}

module shape2(n=6, r=100) {
   
    difference() {
        circle($fn=n, r=r);
        
        for (i=[0:n-1]) {
            rotate(360/n*i) translate([r,0,0]) circle($fn=30, r=r/2.5);
        }
    }
}


module shape3(n=6, r=100, step=1, p=10) {
    for (i=[0:n-1]) {
        rotate(360/n*i) translate([r,0,0]) circle($fn=30, r=r/2.5);
    }
    
    for (i=[0:n-1]) {
        hull() {
            rotate(360/n*i) translate([r,0,0]) circle($fn=30, r=r/p);
            rotate(360/n*((i+step)%n)) translate([r,0,0]) circle($fn=30, r=r/p);
        }
    }
}




translate([  0,0,0]) cajita() shape1(100);
translate([230,0,0]) cajita() shape2();
translate([500,0,0]) cajita() shape3(5);






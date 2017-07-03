module petalo(r) {
    square([r,r]);
    
    translate([r,r])
    circle(r);
}


module perimetro(r) {
    f = 0.95;
    difference() {
        petalo(r);
        petalo(r*f);
    }
}




module flor(n, r, inv) {
    tr = inv ? -2*r : 0;
    
    for (i = [0:n-1]) {
        rotate([0,0,(360/n)*i])
        translate([tr, tr, 0])
        perimetro(r);
    }
}


module nflores(n) {
    x = 20;
    pmin = 5;
    // si n = 3
    for (i = [1:n]) {
        inv = i % 2 == 1;
        flor(n=i+pmin, r=i*x, inv=inv);
    }
}


nflores(10);














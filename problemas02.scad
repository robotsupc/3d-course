module funda(w, h, r) {
    
    module c(x, y, r) { translate([x,y,0]) sphere(r); }
    hull() {
        c(-w/2, -h/2, r); c(-w/2, h/2, r);
        c(w/2, h/2, r); c(w/2, -h/2, r);
    }
}

module funda_completa() {
    difference() {
        funda(80, 150, 5);
        scale(.95) {
            funda(80, 150,5);
            translate([0,0,5])
            cube([80,150,10], true);
        }
        translate([0,-75,0])
        cube([10, 150, 3], true);
        
        translate([-75,30,0])
        cube([150, 10, 3], true);
        translate([-75,45,0])
        cube([150, 10, 3], true);
        translate([75,45,0])
        cube([150, 10, 3], true);
        translate([30,-50,0])
        rotate([-90,0,0]) cylinder(h=200, r=2, center=true);
    }
}
    
    

    
module pieza() {
    module circulos(r) {
        x=10;
        y=10;
        translate([x, y]) circle(r=r);
        translate([x, -y]) circle(r=r);
        translate([-x, y]) circle(r=r);
        translate([-x, -y]) circle(r=r);        
    }
        

    module redondeado() {
        %hull()
        circulos(10);

        minkowski() {
            circle(r=10); 
            circle(r=30, $fn=4);
        }
    }


    hull() {
        linear_extrude(height  =  30)
        redondeado();


        translate([0,0,60]) sphere(r=15);
    }
}


module trozo(c1, c2, r=.3) {
    difference() {
        hull() {
            translate(c2) circle(r);
            translate(c1) circle(r);
        }
        translate(c2) circle(0.1);
        translate(c1) circle(0.1);

    }
}

$fn=20;

module brazo(n) {
    for (i = [0:n-1]) {
        if (i % 2 == 0) {
            trozo(
                [i/2,-i/2],
                [i/2+1, -i/2]);
        } else {
            trozo(
                [(i-1)/2+1, -(i-1)/2],
                [(i-1)/2+1,-(i-1)/2-1]);
        }
    }
    circle(0.1);
    x = n -1;
    if (x%2==0)
    translate([x/2+1, -x/2])
    circle(0.1);
    else
    translate([(x-1)/2+1, -(x-1)/2-1])
    circle(0.1);
}

module rugby() {
    $fn=40;
    intersection_for(i = [0:3])  {
        rotate(90*i)
        translate([2,0,0])
        sphere(r=3);
    }
}


module vase() {
    module base() {
        linear_extrude(height=150, twist=70, $fn=30, scale=2)
        circle(r=50, $fn=6);
    }


    difference() {
        base();
        translate([0,0,2]) scale([.8,.8,1]) base();
    }
}

// solido de revolucion


module alfil2d() {
    module line(r, dst, up) {
        translate([0,up])
        hull() {
            translate([dst,0]) circle(r);
            translate([-dst,0]) circle(r);
        }
    }
    
    // horizontal lines
    line(3, 18, 88);
    line(5, 23, 80);
    line(10, 20, 10);
    line(5, 30, 0);
    
    // body
    hull() {
        line(0.001, 15, 80);
        line(0.001, 20, 0);
    }
    
    // head
    head_dst = 8;
    head_r = 25;
    scale([1.2,1])
    translate([0,110])
    intersection() {
        translate([head_dst,0]) circle(head_r);
        translate([-head_dst,0]) circle(head_r);
    }
    
    // top
    translate([0,137])
    circle(r=5);
    

}


module alfil_carcasa() {
    rotate_extrude($fn=50)
    intersection() {
        translate([500,0])
        square(1000, center=true);
        alfil2d();
    }
}

module alfil() {
    difference() {
        alfil_carcasa();
        
        translate([0,0,110])
        rotate([-45,0,0])
        translate([0,-50,0])
        cube([100,100, 5], center=true);
        
    }
}




module diamante() {
    rotate_extrude($fn=8)
    polygon([
        [0,2],
        [4,2],
        [7,0],
        [0,-8],
    ]);
}


scale(8)
diamante();


translate([100,0,0])
funda_completa();

translate([-100,-10,0]) alfil();


translate([200,0,0])
scale(.8)
vase();
    
    
    
    
    

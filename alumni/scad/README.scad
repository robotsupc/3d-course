$fn = 50;
module klein(){
   
    module cuerpo(r) {
        hull() {
            sphere(r=r);
            translate([0,0,r])
            sphere(r=r/2);
        }
    }
    module donut() {
        module dcuerpo(r1,r2,r3,r4) {
            difference() {
                rotate_extrude()
                square([r1,r2]);
                rotate_extrude()
                square([r3,r4]);  
            }
        }
        
        difference() {
            dcuerpo(10,5,5,5);
            translate([0,0,0.5])
            dcuerpo(9,4,6,4);
        }
    }
    difference() {
        cuerpo(10);
        cuerpo(9.5);
        translate([0,0,-10])
        cube([5,5,5],center=true);
        translate([0,0.6,14])
        cube([4,4,5],center=true);
        translate([0,9,3.5])
        rotate([-55,0,0])
        cube([3,3,5],center=true);
    }
    difference() {
        translate([-2.5,6,10])
        rotate([0,90,0])
        donut();
        cuerpo(9.5);  
    }
    
    difference() {
        translate([0,2,-10])
        rotate([50,0,0])
        tubo(15,5);
        
        translate([0,0,-12.2])
        cube([6,6,6], center=true);
    }
}
module tubo(d1,h){
    module t(d1,h)
    linear_extrude(height=h) {
        hull() {
            square([h,h],center=true);

            translate([0,d1])
            square([h,h],center=true);
        }
    }
    rotate()
    difference() {
        t(d1,h);
        translate([0,-0.5,0.5])
        t(d1+1,,h-1);
    }
}

klein();


difference(){
    klein();
    translate([0,-650,-50])
    cube([100,100,100]);
}


module base() {
    cylinder(r1=3, r2=3, h=5 , $fn=50);
    translate([4,2])cylinder(r1=3, r2=3, h=5 , $fn=50);
    translate([7.5,4.9])cylinder(r1=2, r2=2, h=5 , $fn=50);
        
   
    difference () {
        hull() {
            translate([7,6])cylinder(r1=3, r2=3, h=5 , $fn=50);
            translate([9.5,5])cylinder(r1=1, r2=1, h=5 , $fn=50);
            translate([12,4])cylinder(r1=0.5, r2=0.5, h=5 , $fn=50);
        }
        translate([11.15,1.65])cylinder(r1=3, r2=3, h=5 , $fn=50);
        translate([8,3])cylinder(r1=1, r2=1, h=5 , $fn=50);
    }
    translate([3,6])cylinder(r1=4, r2=4, h=5 , $fn=50);  
    translate([3,-2]) {
        translate([-5,11])cylinder(r1=3, r2=3, h=5 , $fn=50);
        translate([0.5,12])cylinder(r1=3, r2=3, h=5 , $fn=50);
        translate([-6.5,7])cylinder(r1=5, r2=5, h=5 , $fn=50); 
    } 
}

module base_p() {
    cylinder(r1=2.5, r2=2.5, h=5 , $fn=50);
    translate([4,2])cylinder(r1=2.5, r2=2.5, h=5 , $fn=50);
    translate([7.5,4.9])cylinder(r1=1.5, r2=1.5, h=5 , $fn=50);
        
   
    difference () {
        hull() {
            translate([7.5,4.9])cylinder(r1=1.5, r2=1.5, h=5 , $fn=50);
            translate([7,6])cylinder(r1=2.5, r2=2.5, h=5 , $fn=50);
            translate([12,5.2])cylinder(r1=0.5, r2=0.5, h=5 , $fn=50);
        }
        translate([11.15,1.65])cylinder(r1=3.5, r2=3.5, h=5 , $fn=50);
        translate([8.40,3.20])cylinder(r1=0.5, r2=0.5, h=5 , $fn=50);
        rotate([0,0,41])translate([11.75,-5])cube([0.5,7,5]);
    }
    translate([3,6])cylinder(r1=3.5, r2=3.5, h=5 , $fn=50);
    translate([1.5,6])cylinder(r1=3.5, r2=3.5, h=5 , $fn=50);
    translate([1.5,4])cylinder(r1=3.5, r2=3.5, h=5 , $fn=50);
    translate([3,5])cylinder(r1=3.5, r2=3.5, h=5 , $fn=50);  
    translate([3,-2]) {
        translate([-5,11])cylinder(r1=2.5, r2=2.5, h=5 , $fn=50);
        translate([0.5,12])cylinder(r1=2.5, r2=2.5, h=5 , $fn=50);
        translate([-6.5,7])cylinder(r1=4.5, r2=4.5, h=5 , $fn=50);
    } 
}
module base_d() {
    cylinder(r1=3, r2=3, h=4.5 , $fn=50);
    translate([4,2])cylinder(r1=3, r2=3, h=4.5 , $fn=50);
    translate([7.5,4.9])cylinder(r1=2, r2=2, h=4.5 , $fn=50);
        
   
    difference () {
        hull() {
            translate([7,6])cylinder(r1=3, r2=3, h=4.5 , $fn=50);
            translate([9.5,5])cylinder(r1=1, r2=1, h=4.5 , $fn=50);
            translate([12,4])cylinder(r1=0.5, r2=0.5, h=4.5 , $fn=50);
        }
        translate([11.15,1.65])cylinder(r1=3, r2=3, h=4.5 , $fn=50);
        translate([8,3])cylinder(r1=1, r2=1, h=4.5 , $fn=50);
    }
    translate([3,6])cylinder(r1=4, r2=4, h=4.5 , $fn=50);  
    translate([3,-2]) {
        translate([-5,11])cylinder(r1=3, r2=3, h=4.5 , $fn=50);
        translate([0.5,12])cylinder(r1=3, r2=3, h=4.5 , $fn=50);
        translate([-6.5,7])cylinder(r1=5, r2=5, h=4.5 , $fn=50);
    } 
}
module costats () {
    difference() {
        difference() {
            base();
            base_p();
        }
        rotate([0,0,-45])translate([1.75,5])cube([0.5,4,5]);
    }
}
module figura() {
    costats();
    base_d();
    arillo_def();
    detalles_def();
}
figura();

module arillo () {
    difference() {
        translate([2,-2])cylinder(r1=1.5, r2=1.5, h=5 , $fn=50);
        translate([2,-2])cylinder(r1=1.1, r2=1.1, h=5 , $fn=50);
    }
}
module arillo_def() {
    difference() {
        arillo();
        cylinder(r1=3, r2=3, h=5 , $fn=50);
    }  
}
module detalles() {
     difference() {
        translate([4.45,9.7])cylinder(r1=2, r2=2, h=5 , $fn=50);
        translate([4.45,9.7])cylinder(r1=1.5, r2=1.5, h=5 , $fn=50);
     }
     difference() {
        translate([1,0])cylinder(r1=2, r2=2, h=5 , $fn=50);
        translate([1,0])cylinder(r1=1.5, r2=1.5, h=5 , $fn=50);
     }
     difference() {
        translate([-4.4,7.32])cylinder(r1=2.5, r2=2.5, h=5 , $fn=50);
        translate([-4.4,7.32])cylinder(r1=2, r2=2, h=5 , $fn=50);
     }  
        
}
module detalles_def() {
    difference() {
        detalles();
        rotate([0,0,30])translate([6,6])cube([5,5,5]);
        rotate([0,0,10])translate([6,8.3])cube([5,5,5]);
        rotate([0,0,30])translate([-4,0])cube([5,5,5]);
        rotate([0,0,65])translate([-4,-3])cube([5,5,5]);
        rotate([0,0,10])translate([-8,4.96])cube([5,5,5]);
    }
    
}

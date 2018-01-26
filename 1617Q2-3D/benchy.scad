module benchy() {
    
    module base() {
        // sphere radius
        sr=50;
        // sphere distance
        sd=sr*.5;
        
        render()
        scale([1.2,1.5,1])
        intersection() {
            translate([-sd,0,0])
            sphere(r=sr, $fn=50);
            
            translate([sd,0,0])
            sphere(r=sr, $fn=50);
            
            translate([0,0,500-35])
            cube(1000, true);
            
            rotate([162,0,0])
            translate([0,0,500+10])
            cube(1000, true);
            
            rotate([65,0,0])
            translate([0,0,500-30])
            cube(1000, true);
        }
    }
    
    render()
    difference() {
        base();
        
        translate([0,1,5])
        scale(.95)
        base();
    }
    
    render()
    intersection() {
        base();
        rotate([-12,0,0])
        translate([0,0,-100-20])
        cube(200,true);
    }
   


    // chamber
    module chamber() {
        translate([0,-10,0])
        difference() {
            
            cube([30,30,50], true);
            cube([27,27,47], true);
            
            // doors
            translate([0,0,10])
            rotate([0,90,0])
            hull() {
                cylinder(r=7,h=100,center=true);
               translate([40,-5,0])
                cube(10);
            }
            
            // round hole back
            translate([0,0,10])
            rotate(90)
            rotate([0,90,0])
            cylinder(r=7,h=100,center=true);
            
            
            // round hole back
            translate([0,-50,10])
            rotate(90)
            rotate([0,90,0])
            cube([14,14,100],center=true);
        }
        
        // roof
        module roof(r=3,h=5) {
             // roof
            module cyl(x,y,r) {
                translate([x,y,0])
                cylinder(r=r,h=h);
            }
     
            x = 15; y = 15;
            hull() {
                cyl(x,y,r);
                cyl(x,-y,r);
                cyl(-x,y,r);
                cyl(-x,-y,r);
            }
        }
        translate([0,-10,20])
        roof();
        
        // chimney
        module chimney() {
            $fn=40;
            translate([0,-2,25])
            cylinder(r=4, h=10);
            translate([0,-2,35])
            cylinder(r=5, h=3);
        }
        chimney();
    }
    
    chamber();
}
    
    
benchy();
    

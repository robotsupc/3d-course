

// 2D y transformaciones
s = 1;

module cosa() {
    translate([0,5]) {
        square([s,s]);
        square([s,s]*2);
    }


    scale([1,2])
    rotate(90)
    translate([10,0]) {
        circle(r=s, $fn=40);
    }



    polygon([
        [0,0],
        [3,0],
        [0,5]
    ]);
}


module objetos3d() {
    module cubocentrado() {
        translate([-1, 0.5, 1.5])
        rotate([90,90,0])
        scale([3,2,1])
        cube(); // 1x1
    }
    //cubocentrado();
    
    module bala() {
        union()  {
            cube([2,1,3], center=true);
            
            cylinder(r=5, h=5, $fn=50);
            
            sphere(r=5, $fn=30);
        }
    }
    
    //bala();
    
    
    // piramide
    cylinder(r1=20, r2=0, h=20, $fn=5);
    
    
}


//objetos3d();

module casa() {
    altura = 10;
    anchura = 10;
    profundidad = 20;
    
    module carcasa() {
        
        // base
        translate([0,0,altura/2])
        cube([anchura, profundidad, altura], center=true);
        
        //translate([-anchura, -profundidad,0]/2)
        //cube([anchura, profundidad, altura]);
        
        // tejado
        translate([0,0,altura])
        scale([1/sqrt(2), 1 ,1/sqrt(2)])
        rotate([0,45,0])
        cube([anchura, profundidad, altura], center=true);
    }
    
    module puerta() {
        translate([0,-profundidad/2+0.5, altura/4])
        cube([anchura/2,1,altura/2], center=true);
    }
    
    module ventana(multx) {
        translate([(-anchura/2+0.5)*multx,0, altura/2])
        cube([1,4,4], center=true);
    }
    
    difference() {
        carcasa();
        puerta();
        ventana(-1);
        ventana(1);
    }
    
}

casa();






















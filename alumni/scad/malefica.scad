
module base_pos(){
    module base_figura(){
        hull(){
            translate([2,-19])
            circle(r=2);
            translate([16,-19])
            circle(r=2);
        }
    }

    rotate_extrude()
    intersection() {
        translate([500,0])
        square(1000, center = true);
        base_figura();
    }
}

module ceretro()
{
    module ceretro_base(){
        hull(){
            translate([0,-10,-20])
            cylinder(r=2, h = 20, $fn=50);
        }
    }
     module ceretro_bola(){
        translate([0,-10,0])
        sphere(r=3,$fn=50);
        
    }   
    
    ceretro_base();
    ceretro_bola();
}

module cuerpo(){
    r = 2;
    minkowski(){
    cube([16-r,16-r,30-r],true);
    sphere(r, $fn=50);
    }
}

module hombros_pos(){
    module hombros_figura(){
        hull(){
            translate([-4,7])
            circle(r=2, $fn=50);
            translate([8,7])
            circle(r=2, $fn=50);
        }
    }
    translate([0,2.5,8])
    rotate_extrude()
    intersection() {
        translate([500,0])
        square(1000, center = true);
        hombros_figura();
    }
}

module cabeza(){
    translate([0,2,24])
    sphere(r=9, $fn=100);
}

//Cilindro , esfera, cono

module cuerno_pos(){
    module cuerno_figura(){
        translate([0,50,0])
        cylinder(h=10, r=2, $fn=50, center=false);
        translate([0,50,10])
        sphere(r=2,$fn=50);
        translate([0,45,10])
        rotate([90,0,0])
        cylinder(h=10, r1=2, r2=1,$fn=50, center=true); 
        translate([0,40,10])
        sphere(r=1,$fn=50);   
        translate([0,40,13])
        cylinder(h=6, r1=1, r2=0,$fn=50, center=true); 

    }

    translate([0,-27,64])
    rotate([-45,0,0])
    cuerno_figura();

    translate([0,31,64])
    rotate([0,0,180])
    rotate([-45,0,0])
    cuerno_figura();

}

//Base circular
base_pos();
//Ceretro completo (Base + Bola)
ceretro();
//Cuerpo
translate([0,2.5,-2])
cuerpo();
//Parte circular encima del cuerpo
hombros_pos();
//Cabeza esférica
cabeza();
//Cuernos
cuerno_pos();


























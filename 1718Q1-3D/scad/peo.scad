module dup2d(a,b){
    children();
    mirror([a,b])
    children();
}



module cut2d(x,y){
    difference(){
        children();
        translate([x*30000/2,y*30000/2])
        square(30000,center=true);
    } 
}
module dup3d(a,b,c){
    children();
    mirror([a,b,c])
    children();
}



module cut3d(x,y,z){
    difference(){
        children();
        translate([x*30000/2,y*30000/2,z*30000/2])
        cube(30000,center=true);
    } 
}
//peo
module base2d(){
        difference(){
          hull(){
             dup2d(1,0)
            translate([4,0])
            circle(1,$fn=20);
            translate([0,1])
            square(3,center=true);
        }
    } 
    translate([0,-1]){
        hull(){
            dup2d(1,0)
            translate([5,0])
            circle(.5,$fn=20);
        }
    }
    translate([0,2]){
        hull(){
            dup2d(1,0)
            translate([3,0])
            circle(.5,$fn=20);
        }
    }    
}


module cos2d(){
     difference(){
        polygon([[2,15],[3,0],[-3,0],[-2,15]]);
        translate([-5,0])
        hull(){    
            for(i=[0:0.2:3]){
                translate([i,i*i*i])
                circle(1,$fn=10);
            }
        }
    }
}

module peo2d(){
    scale([1.2,.7]){
        base2d();
        translate([0,2])
        cos2d();
        
        offset(0.5)
        translate([0,18])
        scale([1.6,1])
        rotate([0,0,90])
        circle(2,$fn=3);
    }
    translate([0,16.7])
    circle(3.5,$fn=20);       
}
module peo3d(){
    scale([.7,.7,.7]){
        rotate_extrude(){
            cut2d(1,0)
            translate([0,1.5])
            peo2d();  
        }
    }
}
peo3d();

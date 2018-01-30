module cilindroBordesRebajados(distInf,tamInf,long,tam,distSup,tamSup){
    hull(){
        linear_extrude(height=long) circle(r=tam);
        translate([0,0,long+distSup]) linear_extrude(height=1) circle(r=tamSup);
        translate([0,0,0-distInf]) linear_extrude(height=1) circle(r=tamInf);
        
    }
}


module cilindroBordesRebajadosHueco(distInf,tamInf,long,tam,distSup,tamSup, longHueco, tamHueco){
    difference(){
        cilindroBordesRebajados(distInf,tamInf,long,tam,distSup,tamSup);
        translate([0,0,(long-longHueco)/2])linear_extrude(height=longHueco) circle(r=tamHueco);
    }
}


module cabezal(){
    translate([0,0,115])cilindroBordesRebajados(2,1,10,15,3,2);
    translate([0,0,40])linear_extrude(height=90) circle(r=10);
    translate([0,0,127])cilindroBordesRebajados(2,1,2,15,1,11);
    translate([0,0,102])cilindroBordesRebajados(3,2,8,18,12,11);
}

module base(){
    difference(){
        translate([0,0,-44])cilindroBordesRebajados(0,0,75,20,5,14);
        translate([0,0,-44])cilindroBordesRebajados(0,0,68,16,5,14);
    }
    
    translate([0,0,37])cilindroBordesRebajadosHueco(5,1,70,13,0,0,50,8);
    translate([0,0,-3]){
        translate([0,0,82])cilindroBordesRebajados(20,2,8,16,1.5,11);
        translate([0,0,88])cilindroBordesRebajados(20,2,13,19,1.5,11);
    
        difference(){
            cabezal();
            translate([0,0,135])cilindroBordesRebajados(8,5,10,12,0,0);
        }
    }
    
}
module interseccion_esferas(tam,r){
    intersection(){
        translate([tam,0])sphere(r=r, $fn=50, center=true);
        translate([-tam,0])sphere(r=r, $fn=50, center=true);
    }
}

module soporte1(){
    scale([1.5,1.1,1.9])
    difference(){
        interseccion_esferas(7,30);
        translate([10,0,-35])cilindroBordesRebajados(20,1,70,22,0,0);
        translate([12,0,25])scale([1/1.5,1/1.1,1/1.9])sphere(35,center=true);
        translate([-30,0,-25])cube([20,1,50]);
        translate([-22,0,7])scale([1/1.5,1/1.1,1/1.9])sphere(5);
    }
}

module soporte2(){
    scale([1.75,1.2,2.5])
    translate([0,0,3])
    difference(){
        interseccion_esferas(3,20);
        translate([-9,0,-35])linear_extrude(height=100) circle(r=19,center=true);
        translate([5,0,-15])scale([1/1.5,2,0.5])sphere(15,center=true);
        translate([-5,0,22])scale([1/1.75,1,2])sphere(25,center=true);
        
    }
}

module cuboBordesRebajados(distInf,tamInf,long,distSup,tamSup){
    hull(){
        cube([long,long,long],center=true);
        translate([0,0,long+distSup]) cube([tamSup,tamSup,tamSup],center=true);
        translate([0,0,0-distInf]) cube([tamInf,tamInf,tamInf],center=true);
        
    }
}

module enganchesCables(){
    intersection(){
        translate([-24,12,-35])cilindroBordesRebajados(4,0,3,5,5,1);
        translate([-23,12,-35])rotate([0,0,60])interseccion_esferas(1,5);
    }
    intersection(){
        translate([5,28,-25])cilindroBordesRebajados(1,0,3,5,5,1);
         translate([5,27,-25])rotate([0,0,0])interseccion_esferas(1,5);
    }
}
module cilindroRedondeado(dist,r){
    hull(){
           sphere(r=r,center=true);
           translate(dist)sphere(r=r,center=true);
    }
}
module cable1(r){
    
      translate([-23,-12,35])cilindroRedondeado([0,1,10],r);
      translate([-23,-11,45])cilindroRedondeado([-2,2,10],r);
      translate([-25,-9,55])cilindroRedondeado([-3,3,9],r);
      translate([-28,-6,64])cilindroRedondeado([-1,2,8],r);
      translate([-29,-4,72])cilindroRedondeado([0,2,7],r);
      translate([-29,-2,79])cilindroRedondeado([1,1,5],r);
      translate([-28,-1,84])cilindroRedondeado([3,1,4],r);
      translate([-25,0,88])cilindroRedondeado([3,0,3],r);
      translate([-22,0,91])cilindroRedondeado([7,0,4],r);
}


module cable2(r){
      translate([5,-27,25])cilindroRedondeado([0,0,7],r);
      translate([5,-27,32])cilindroRedondeado([1,-1,8],r);
      translate([6,-28,40])cilindroRedondeado([1,-2,7],r);
      translate([7,-30,47])cilindroRedondeado([1,-2,8],r);
      translate([8,-32,55])cilindroRedondeado([1,-2,7],r);
    translate([9,-34,62])cilindroRedondeado([1,-1,8],r);
    translate([10,-35,70])cilindroRedondeado([1,0,7],r);
    translate([11,-35,77])cilindroRedondeado([1,3,6],r);
    translate([12,-32,83])cilindroRedondeado([0,5,5],r);
    translate([12,-27,88])cilindroRedondeado([0,7,4],r);
    translate([12,-20,92])cilindroRedondeado([0,7,3],r);
    //([17,-25,92])cilindroRedondeado([0,7,1],r);
     
}
module cuadradoMobil(dist,tam){
    hull(){
        cube(tam);
        translate(dist) cube(tam);
    }
}

module cables(){
    cable1(3.5);
    cable2(3.5);
}

module gancho(){
    rotate([0,0,20]){
    cuadradoMobil([0,-15,20],[8,4,4]);
    translate([2,-15,20])cuadradoMobil([0,2,30],[4,4,4]);
    translate([2,-14,50])cuadradoMobil([0,10,-5],[4,4,4]);
    }
}


module ganchos(){
    translate([15,-20,0])rotate([0,0,15])gancho();
    rotate([0,0,120])translate([5,-20,0])rotate([0,0,10])gancho();
    rotate([0,0,280])translate([0,-20,0])rotate([0,0,-10])gancho();
}

module detalles(){

    rotate([180,0,0])enganchesCables();
    cables();
    translate([0,0,90])ganchos();
}

module portalGun(){
    translate([0.5,0,-0.2])base();
    scale([1,.95,1])soporte1();
    translate([1,0,97])rotate([180,0,0])scale([1,1,1.1])soporte2();
    detalles();
    
}
scale(40/100)portalGun();

module anillo(h,w,r){
    rotate_extrude() translate([h,w]) circle(r);
}
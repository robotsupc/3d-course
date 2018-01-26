module dup(eje = [1,0]) {
    children();
    mirror(eje) children();
}



module pairwise_hull() {
    for (i = [0:$children-2]) {
        hull() {
            children(i);
            children(i+1);
        }
    }
}



module ccube(size, trans) {
    translate([trans[0]*size[0]/2, trans[1]*size[1]/2,
        trans[2]*size[2]/2]) cube(size, center=true);
}

module cut(axis, size=1000) {
    intersection() {
        ccube([1,1,1]*size,axis);
        children();
    }
}

module dup(eje = [1,0]) {
    children();
    mirror(eje) children();
}

// Hulls children two by two, if complete is true it will hull the first and last too
module pairwise_hull(complete=false) {
    for (i = [0:$children-2]) {
        hull() {
            children(i);
            children(i+1);
        }
    }
    if (complete) {
        hull() {
            children(0);
            children($children-1);
        }
    }
}

// Cuts its children on the specified axis
module cut(axis, size=1000) {
    module ccube(s, t) {
        translate([t[0]*s[0]/2, t[1]*s[1]/2,
            t[2]*s[2]/2]) cube(s, center=true);
    }

    intersection() {
        ccube([1,1,1]*size,axis);
        children();
    }
}





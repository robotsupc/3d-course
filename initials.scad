
module initials(a, b) {
    module letra(t) {
        h = 50;
        translate([0,0,-h/2])
        linear_extrude(height=h)
        text(t,
            halign="center",
            valign="center");
    }
    
    intersection() {
        rotate([90,0,0])
        letra(a);
        rotate([90,0,90])
        letra(b);
    }
}
initials("A", "G");

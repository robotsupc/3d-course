function n_cuadrados(n)
    = n == 0
    ? []
    : concat(n_cuadrados(n-1), pow(n, 2));

function zip(a1, a2, i=0, arr=[])
    = i >= len(a1) || i >= len(a2)
    ? arr
    : zip(a1, a2, i+1, concat(arr, [[a1[i], a2[i]]]));
    
    
function nats(n)
    = n == 0
    ? []
    : concat(nats(n-1), n);
    
function numeros(n) = zip(nats(n), n_cuadrados(n));


function wrap(arr) = concat([[0,0]], arr, [[arr[len(arr)-1][0],0]]);

rotate_extrude()translate([-4,0,0])polygon(wrap(numeros(4)));
echo(numeros(4));


echo(n_cuadrados(7));
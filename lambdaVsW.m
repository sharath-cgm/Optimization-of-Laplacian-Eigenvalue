// scilab code to plot the graph between lambda2 and weight of an edge(varying from 0 to 50)

// incidence matrix of a graph
i = [
-1  0   -1  -1  0;
1   -1  0   0   0;
0   1   1  0   0;
0   0   0   1   -1;
0   0   0   0   1;
]

// function to calculate second smallest eigenvalue corresponding to input weight w
function z = lambda2(w)
    weights = [
    1   0   0   0   0;
    0   2   0   0   0;
    0   0   1   0   0;
    0   0   0   w   0;
    0   0   0   0   3;
    ]
    laplacian = i * weights * i';
    d = spec(laplacian);
    z = d(2,1);
endfunction

// wAxis: vector from 0 to 50, of size 250
// l2: values of lambda2 corresponding to wAxis
wAxis = linspace(0, 50, 250);
l2 = [];
for j = 1 : 250
    temp = lambda2(wAxis(1,j));
    l2 = [l2 temp];
end

plot(wAxis, l2);
xtitle("Variation of lambda2 with w");
xlabel("weights (1 cm = 1 unit of weight)");
ylabel("Lambda2 (1 cm = 1 unit of lambda2)");

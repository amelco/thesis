set term pdf enhanced font ',14'

set border 3
unset xtics
unset ytics
set xlabel "water flux, q [L/T]"
set ylabel "Diffusion-Dispersion coefficients [L^2/T]"

set out 'Ds.pdf'
tau=5E-2*86400
O=0.1
Dm=4640000
D(q)=tau*q/O
set key top left invert

set logscale x
plot [0.1:1000] D(x) lc -1 lt 1 t "mechanical dispersion", Dm lc -1 lt 0 t "molecular diffusion"

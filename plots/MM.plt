set term pdf enhanced

I(x)=Im*x/(Km+x)
Im=0.76
Km=16.7

set out 'orig_MM.pdf'
set border 3
unset ytics
unset xtics
unset key

set xlabel "Concentration in external medium"
set ylabel "Solute uptake rate"

set ytics ("0" 0, "I_m" Im, "Im/2" Im/2) nomirror
set xtics ("0" 0, "K_m" Km) nomirror

set arrow from Km,0 to Km, Im/2 nohead lt 0 lc -1
set arrow from 0,Im/2 to Km, Im/2 nohead lt 0 lc -1

plot [0:250][0:1] I(x) lt 1 lc -1, Im lt 0 lc -1

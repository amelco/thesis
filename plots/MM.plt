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



set out '../figuras/MM_plus.pdf'

I2(x)=Im*(x-cmin)/(Km+x-cmin) + k*(x-cmin)
I3(x)=Im*(x-cmin)/(Km+x-cmin)
Im=113
Km=32.4
k=1.
cmin=8

unset key
unset ytics
unset xtics
set xtics ("0" 0, "C_{min}" cmin) nomirror
#set xtics 10 nomirror
#set ytics 20 nomirror
unset arrow

set label "total uptake" at 150,280
set label "linear" at 175,160
set label "component" at 175,140
set label "saturable component" at 140,70

plot [0:200][0:] I2(x) lt 1 lc -1 lw 3, I3(x) lt 0 lc -1, k*(x-cmin) lc -1 lt 1

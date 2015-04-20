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


set out '../figuras/MM_c.pdf'

unset arrow
unset label
unset xtics
unset ytics

qs(x)=Im*x/(Km+x) + q*x
Im=0.76
Km=3.7
q=0.01
clim=0
c2=Im/q

A(x)=Im*x/(Km+x)
P(x)=q*x

clim1=(-Km+(Km**2+4*Im*Km/q)**0.5)/2
clim2=(-Km-(Km**2+4*Im*Km/q)**0.5)/2

if ( clim1>0 ) clim=clim1
if ( clim2>0 ) clim=clim2

print clim
print c2
set xtics ("0" 0, "C_{lim}" clim, "C_2" c2) nomirror
set ytics ("0" 0, "I_m" Im) nomirror
set xlabel "Concentration at root surface"

set label "active contribution" at 60,0.2
set label "passive contribution" at 60,0.55
set label "total uptake\n      (q_{s0})" at 70,0.9
set label "plant demand" at 10,0.9
set label "potential active uptake\n (original MM equation)" at 74,0.7
set arrow from 17,0.88 to clim/2, Im lt 1 lc -1


#plot [0:350][0:] I(x), qs(x)
plot [0:100][0:1] \
(x<clim?qs(x):x>clim&&x<c2?Im:q*x) lt 1 lc -1 lw 4, \
(x<clim?A(x):x>clim&&x<c2?Im-P(x):0) lt 1 lc -1 lw 1, \
P(x) lt 1 lc -1 lw 1, \
Im lt 0 lc -1 lw 1, \
A(x) lt 0 lc -1 lw 1

set term pdf enhanced

h1 =  -0.1
h2 =  -0.2
h3 = -0.8
h4 =  -1.2
as = -1/(h4-h3)
bs = 1+h3/(h4-h3)
aw = 1/(h2-h1)
bw = 1-h2/(h2-h1)

set out 'feddes.pdf'
set border 9
unset ytics
set y2tics
set xtics nomirror
unset key

set xlabel "pressure head, h"
set y2label "reduction function, {/Symbol a}"

#set ytics ("0" 0, "I_m" Im, "Im/2" Im/2) nomirror
#set xtics ("0" 0, "K_m" Km) nomirror

#set arrow from Km,0 to Km, Im/2 nohead lt 0 lc -1
#set arrow from 0,Im/2 to Km, Im/2 nohead lt 0 lc -1

plot [-1.4:0] (x<=h4?0:(x>h4&&x<h3?as*x+bs:(x>=h3&&x<=h2?1:(x>h2&&x<h1?aw*x+bw:0)))) lt 1 lc -1
#plot [h4:h3] as*x+bs

PRO make_fig

; This creates the plot for Figure 1 in chapter 2 of thesis
; Inspiration taken from Reflector & Antennas chapter in NRAO online course

!P.FONT = 0 
set_plot, 'ps'

piii=textoidl('\Pi')
pii=textoidl('\pi')
nu=textoidl('\nu')
theta=textoidl('\theta')
u=fillarr(0.0007,-6,6)
n=n_elements(u)
pi=dblarr(n)
pos=aspect(1.0, margin=0.15)
!p.multi=[0,3,2]

For i=0, n-1 do begin
If u[i] ge -0.5 and u[i] le 0.5 then pi[i]=1 else pi[i]=0
Endfor

plot, u,pi, xrange=[-1,1],yr=[-0.3,1.2], xtitle='u', ytitle='f(u)',$
xthick=4,ythick=4,thick=4, chars=3.0,charthick=4,/ystyle,position=pos

xyouts,-0.85,0.9, piii+'(u)', chars=1.5,charthick=4
; 
l=fillarr(0.001,-15,15)
sinc=sin(!pi*l)/(!pi*l)
; 
; plot, l,sinc,  xr=[-5,5], yr=[-0.3,1.2], xtitle='l', ytitle='F(l)',$
; xthick=4,ythick=4,thick=4, chars=3.0,charthick=4,/ystyle,position=pos
; 
; xyouts,-5,0.9, 'sinc('+pii+'l)', chars=1.5,charthick=4
; 
; sinc2=sinc^2
; plot, l,sinc2,  xr=[-5,5], yr=[-0.3,1.2], xtitle='l', ytitle='A('+nu+','+theta+',0)',$
; xthick=4,ythick=4,thick=4, chars=3.0,charthick=4,/ystyle,position=pos
; 
; xyouts,-5,0.9, 'sinc!u2!n('+pii+'l)', chars=1.5,charthick=4

device, /close
SET_PLOT, 'x'
stop
End
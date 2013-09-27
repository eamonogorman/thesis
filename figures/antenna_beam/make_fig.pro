PRO make_fig

; This creates the plot for Figure 1 in chapter 2 of thesis
; Inspiration taken from Reflector & Antennas chapter in NRAO online course

ODEV_L, 'fig2c'
!P.FONT=0
SPECTABLE

piii=textoidl('\Pi')
pii=textoidl('\pi')
nu=textoidl('\nu')
theta=textoidl('\theta')
lambda=textoidl('\lambda')
u=fillarr(0.0007,-6,6)
n=n_elements(u)
pi=dblarr(n)
pos=aspect(1.0, margin=0.15)
!p.multi=[0,3,2]

For i=0, n-1 do begin
If u[i] ge -0.5 and u[i] le 0.5 then pi[i]=1 else pi[i]=0
Endfor

; plot, u,pi, xrange=[-1,1],yr=[-0.3,1.2], xtitle='u', ytitle='f(u)',$
; xthick=4,ythick=4,thick=4, chars=3.0,charthick=4,/ystyle,position=pos
; 
; xyouts,-0.85,0.9, piii+'(u)', chars=1.5,charthick=4
; 
l=fillarr(0.001,-15,15)
sinc=sin(!pi*l)/(!pi*l)
; 
; plot, l,sinc,  xr=[-5,5], yr=[-0.3,1.2], xtitle='l', ytitle='F(l)',$
; xthick=4,ythick=4,thick=4, chars=3.0,charthick=4,/ystyle,position=pos
; 
; xyouts,-5,0.9, 'sinc(l)', chars=1.5,charthick=4
; 
sinc2=sinc^2
plot, l,sinc2,  xr=[-5,5], yr=[-0.3,1.2], xtitle='l', ytitle='A('+nu+','+theta+',0)',$
xthick=4,ythick=4,thick=5, chars=4.0,charthick=4,/ystyle,position=pos

xyouts,-5,0.9, 'sinc!u2!n(l)', chars=2.0,charthick=5

a=[-0.45,0.45]
b=[0.5,0.5]

plots, a,b, thick=4,color=4
arrow, 1.9, 0.8, 0, 0.5,/DATA,color=4,thick=4,hsize=400.0
;arrow, xt, yt, xh, yh, 
xyouts, 1.0,0.82, 'HPBW=0.89'+lambda+'/D', color=4,charsize=1.5

;arrow, -0.5, -0.15,1.0, 0,/DATA,color=4,thick=4,hsize=400.0
;xyouts, -5.5,-0.20, '1st null at 1.22'+lambda+'/D', color=4,charsize=1.5

arrow, -2.2, 0.39,-1.6, 0.05,/DATA,color=4,thick=4,hsize=400.0
xyouts, -5.5,0.4, '1st sidelobe', color=4,charsize=1.5

device, /close
SET_PLOT, 'x'
stop
End
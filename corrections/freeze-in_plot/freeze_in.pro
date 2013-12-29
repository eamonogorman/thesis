PRO freeze_in
;
GET_CCONST, cc, hh, me, mp, Roo, bk, Gnewt, msol, rsol, pc, au, ee, yr
;
ODEV_L, 'freeze-in'
!P.FONT=0
SPECTABLE
;
;####################################################################################
; Create Radial Profile
;####################################################################################
rstar=25.0
r = fillarr(.01,1.2,100)*rsol*rstar
;####################################################################################
; Create Simple Temperature Profile 
;####################################################################################

beta=1.0
n=n_elements(r)
tmax=10000.0
tem=dblarr(n)
For i=0,n-1L do begin
  tem[i]=tmax*((r[0]/r[i])^beta)
Endfor

;####################################################################################################
; Create Ionization fraction based  on Glassgold & Huggins Analytical Expression
;####################################################################################################

;############## 1st find recombination coeff alpha0 for tmax ###################################
z=1
a=1.27	;Tmax=10,000 K taken by interpolating spitzer data
alpha0=((2.06d-11)*((z)^2)*a)/(tmax^(0.5))
;################################################################################################

x_hi=1.0d-4

m_dot=1.0d-10*(msol/yr)
v=35.0d+5
C=m_dot/(4.0*!pi*1.3*mp*v)	; Hydrogen only

p=0.77
b=p*beta

y=(x_hi*alpha0*c)/(r[0]*v*(1.0-b))	;Constant for paper
x_0=0.5

i_r=dblarr(n)
x_h=dblarr(n)
For i=0,n-1L do begin
  I_r[i]=y*(1.0 - (r[0]/r[i])^(1.0-b))
  x_h[i]=(x_0*x_hi*exp(-1.0*i_r[i]))/(x_hi + x_0*(1.0-exp(-1.0*i_r[i])))
Endfor

plot, r/(rsol*rstar), x_h, ytitle='x!dH II!n = n!dH II!n / (n!dH I!n + n!dH II!n)',xtitle='R!dstar!n',$
chars=1.8, thick=8, xstyle=1, xthick=4, ythick=4, xr=[1,10], yr=[0,1]

m_dot=2.0d-10*(msol/yr)
C=m_dot/(4.0*!pi*1.3*mp*v)
y=(x_hi*alpha0*c)/(r[0]*v*(1.0-b))	;Constant for paper
For i=0,n-1L do begin
  I_r[i]=y*(1.0 - (r[0]/r[i])^(1.0-b))
  x_h[i]=(x_0*x_hi*exp(-1.0*i_r[i]))/(x_hi + x_0*(1.0-exp(-1.0*i_r[i])))
Endfor
oplot, r/(rsol*rstar), x_h,color=2, thick=8,lines=3

m_dot=1.0d-10*(msol/yr)
v=70.0d+5
C=m_dot/(4.0*!pi*1.3*mp*v)
y=(x_hi*alpha0*c)/(r[0]*v*(1.0-b))	;Constant for paper
For i=0,n-1L do begin
  I_r[i]=y*(1.0 - (r[0]/r[i])^(1.0-b))
  x_h[i]=(x_0*x_hi*exp(-1.0*i_r[i]))/(x_hi + x_0*(1.0-exp(-1.0*i_r[i])))
Endfor
oplot, r/(rsol*rstar), x_h,color=4, thick=8,lines=2

xyouts, 2.1, 0.92, 'R!dstar!n = 25 R!dsol!n, r!d1!n=1.2 R!dstar!n, T(r)=10,000(r!d1!n/r) K', chars=1.8 

xyouts, 4.0, 0.725, 'M=1x10!u-10!n M!dsol!n yr!u-1!n, v=35 km s!u-1!n',chars=1.8
xyouts, 4.08, 0.765, '.',chars=2.5

xyouts, 4.0, 0.65, 'M=2x10!u-10!n M!dsol!n yr!u-1!n, v=35 km s!u-1!n',chars=1.8,color=2
xyouts, 4.08, 0.69, '.',chars=2.5,color=2

xyouts, 4.0, 0.8, 'M=1x10!u-10!n M!dsol!n yr!u-1!n, v=70 km s!u-1!n',chars=1.8,color=4
xyouts, 4.08, 0.84, '.',chars=2.5,color=4

linex=[2.2,3.8]
liney=[0.815,0.815]
oplot, linex,liney,lines=2,color=4,thick=8
liney=[0.74,0.74]
oplot, linex,liney,color=0,thick=8
liney=[0.67,0.67]
oplot, linex,liney,lines=3,color=2,thick=8


DEVICE, /CLOSE
stop
END
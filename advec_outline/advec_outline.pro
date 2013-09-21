PRO advec_outline
;
ODEV_p, 'advec_outline'
!P.FONT=0
SPECTABLE

PLOT, [0,1], [0,1], PSYM=3, chars=1.8, thick=2, $
  xstyle=1, lines=0, $
  xtitle='', xthick=2, $
  ytitle='', ythick=2, $
  ystyle=1, $
  color=1, /nodata

;############### Horizontal lines ##################

x1=[0.25,0.55] & y1=[1,1]
plots, x1,y1,color=0, thick=2
y1=[0.85,0.85]
plots, x1,y1,color=0, thick=2

x1=[-0.1,0.2] & y1=[0.75,0.75]
plots, x1,y1,color=0, thick=2
y1=[0.6,0.6] 
plots, x1,y1,color=0, thick=2
x1=[-0.1,0.2] & y1=[0.5,0.5]
plots, x1,y1,color=0, thick=2
y1=[0.35,0.35] 
plots, x1,y1,color=0, thick=2
x1=[-0.1,0.2] & y1=[0.25,0.25]
plots, x1,y1,color=0, thick=2
y1=[0.1,0.1] 
plots, x1,y1,color=0, thick=2

x1=[0.6,0.9] & y1=[0.75,0.75]
plots, x1,y1,color=0, thick=2
y1=[0.6,0.6] 
plots, x1,y1,color=0, thick=2
x1=[0.6,0.9] & y1=[0.5,0.5]
plots, x1,y1,color=0, thick=2
y1=[0.35,0.35] 
plots, x1,y1,color=0, thick=2
x1=[0.6,0.9] & y1=[0.25,0.25]
plots, x1,y1,color=0, thick=2
y1=[0.1,0.1] 
plots, x1,y1,color=0, thick=2

;############### Vertical lines ##################

x1=[0.25,0.25] & y1=[0.85,1]
plots, x1,y1,color=0, thick=2
x1=[0.55,0.55]
plots, x1,y1,color=0, thick=2

x1=[-0.1,-0.1] & y1=[0.75,0.6]
plots, x1,y1,color=0, thick=2
x1=[0.2,0.2] 
plots, x1,y1,color=0, thick=2

x1=[-0.1,-0.1] & y1=[0.5,0.35]
plots, x1,y1,color=0, thick=2
x1=[0.2,0.2]
plots, x1,y1,color=0, thick=2

x1=[-0.1,-0.1] & y1=[0.25,0.10]
plots, x1,y1,color=0, thick=2
x1=[0.2,0.2] 
plots, x1,y1,color=0, thick=2

x1=[0.6,0.6] & y1=[0.75,0.6]
plots, x1,y1,color=0, thick=2
x1=[0.9,0.9] 
plots, x1,y1,color=0, thick=2

x1=[0.6,0.6] & y1=[0.5,0.35]
plots, x1,y1,color=0, thick=2
x1=[0.9,0.9] 
plots, x1,y1,color=0, thick=2

x1=[0.6,0.6] & y1=[0.25,0.10]
plots, x1,y1,color=0, thick=2
x1=[0.9,0.9] 
plots, x1,y1,color=0, thick=2

;############ Horizontal arrows #########
arrow, 0.24,0.62,0.55,0.62,color=0,/DATA, thick=2
arrow, 0.24,0.42,0.55,0.42,color=0,/DATA, thick=2
arrow, 0.24,0.12,0.55,0.12,color=0,/DATA, thick=2

arrow, 0.55,0.72,0.24,0.72,color=0,/DATA, thick=2
arrow, 0.55,0.22,0.24,0.22,color=0,/DATA, thick=2

;############## Vertical Arrows ###############
arrow, 0.4,0.83,0.4,0.74,color=0,/DATA, thick=2

arrow, 0.05,0.58,0.05,0.52,color=0,/DATA, thick=2
arrow, 0.05,0.33,0.05,0.27,color=0,/DATA, thick=2

; ################ big arrow ########
arrow, -0.18,0.93,0.18,0.93,color=0,/DATA
x1=[-0.18,-0.18] & y1=[0,0.93]
plots, x1,y1,color=0, thick=2
x1=[-0.18,0.4] & y1=[0,0]
plots, x1,y1,color=0, thick=2
x1=[0.4,0.4] & y1=[0,0.1]
plots, x1,y1,color=0, thick=2

; ########### Font #################
xyouts, 0.64, 0.17, 'VLA Data',chars=1.4

xyouts, -0.06, 0.20, 'Compute',chars=1.4
xyouts, -0.06, 0.17, 'radio',chars=1.4
xyouts, -0.06, 0.14, 'spectrum',chars=1.4

xyouts, 0.64, 0.45, 'Energy',chars=1.4
xyouts, 0.64, 0.42, 'balance',chars=1.4

xyouts, 0, 0.45, 'n!dHI!n',chars=1.4
xyouts, 0, 0.42, 'n!de!n',chars=1.4
xyouts, 0, 0.39, 'n!dHII!n',chars=1.4

xyouts, -0.07, 0.72, 'Rate',chars=1.4
xyouts, -0.07, 0.69, 'equations',chars=1.4
xyouts, -0.07, 0.66, 'with',chars=1.4
xyouts, -0.07, 0.63, 'advection',chars=1.4

xyouts, 0.64, 0.72, 'Radiative',chars=1.4
xyouts, 0.64, 0.69, 'transfer',chars=1.4
xyouts, 0.64, 0.66, 'equation',chars=1.4
xyouts, 0.62, 0.62, 'PRD +',chars=1.2
xyouts, 0.75, 0.632, 'escape',chars=1.2
xyouts, 0.75, 0.608, 'prob',chars=1.2

xyouts, 0.32, 0.97, 'UV Data',chars=1.3
xyouts, 0.3, 0.945, '(i.e., HST)',chars=1.3
xyouts, 0.35, 0.91, 'v(r)',chars=1.1
xyouts, 0.35, 0.885, 'dM/dt',chars=1.1
xyouts, 0.35, 0.86, 'T(r)',chars=1.1

xyouts, 0.37, 0.69, 'I',chars=1.5
xyouts, 0.37, 0.59, 'n!di!n',chars=1.5

DEVICE, /CLOSE


;
END
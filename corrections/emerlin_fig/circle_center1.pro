PRO circle_center1

ODEV_L, 'merlin_aori_new1'
!P.FONT=0
SPECTABLE
sig=textoidl('\sigma')

; Convert rms values from mJy beam-1 to mJy per pix
beam_area=1.133*80.0*60.0	;mas^2
pos1=aspect(1.0)
; Make grid
xgrid=(indgen(512)-256)*15	;mas
ygrid=(indgen(512)-256)*15	;mas

emerlin=readfits('AORI012SC.75.ICL001')	; in Jy beam-1 want mJy per pixel
emer_pix_in_beam=beam_area/(15.*15.)
rms=0.009*(1./emer_pix_in_beam)
levels=rms*[indgen(20)+1]*4	;4sig contours
emerlin=emerlin*(1./emer_pix_in_beam)*(1.d+3)	;mjy per pixel
contour, emerlin,(xgrid-20),(ygrid+80), levels=levels, xrange=[-350,350],yrange=[-350,350],  chars=1.7,thick=3,$
position=[pos1[0],pos1[1],pos1[2],pos1[3]],/xstyle,/ystyle,xtitle='mas', ytitle='mas'
xyouts, -220,290, 'e-Merlin: 80X60 mas restoring beam', chars=1.3,charthick=3.0
xyouts, -180,250, 'Contours = 4'+sig+' (1'+sig+'=0.009 mJy)', chars=1.3,charthick=3.0
xyouts, -180,210, 'Expected photospheric position', chars=1.3,charthick=3.0,color=2

;Find maximum of emission

xpt=(260.-256.0)*15.	;mas
ypt=(252.0 - 256.0)*15.	;mas
xcenter=(xpt-20.0)
ycenter=(ypt+80.0)
radius=20.0
points = (2*!PI / 99.0)*FINDGEN(100)
x = xcenter + radius*COS(points )
y = ycenter + radius*SIN(points )
cir=TRANSPOSE([[x],[y]])
POLYFILL, CIR, Color=2

xpt=(260.-256.0)*15.	;mas
ypt=(252.0 - 256.0)*15.	;mas
xcenter=(xpt-330.0)
ycenter=(ypt-220.0)
radius1=30.0
radius2=40.0
phi = (2*!PI / 99.0)*FINDGEN(100)
bpa=10	;POSITION ANGLE WRT COORDINATE SYSTEM
xm = xcenter + radius1*cos(phi)*cos(bpa) + radius2*sin(phi)*sin(bpa)
ym = ycenter - radius1*cos(phi)*sin(bpa) + radius2*sin(phi)*cos(bpa)


oplot, xm,ym,color=4,thick=4
cir=TRANSPOSE([[xm],[ym]])
POLYFILL, CIR, Color=4
xyouts, xcenter-30, ycenter+50, 'BEAM',color=4, chars=1.3,charthick=3.0

DEVICE, /CLOSE
stop
END
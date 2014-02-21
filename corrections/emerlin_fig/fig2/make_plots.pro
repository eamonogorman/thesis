PRO make_plots

ODEV_L, '3_plots_new'
!P.FONT=0
SPECTABLE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; This is for the low resolution analysis ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

restore, '/media/95a465c2-86d8-4173-9edc-7750e1b1879b/merlin/HBL2001_model/low_res/model_gmh_convol.sav'

; Convert rms values from mJy beam-1 to mJy per pix
beam_size=[180.0,180.]		;mas
beam_area=1.133*180.0*180.0	;mas^2
pix_in_beam=beam_area/(5.0*5.0)	;1 pix = 5mas*5mas
rms=0.027*(1./pix_in_beam)
levels=rms*[indgen(15)+1]*4	;4sig contours

; Make grid
xgrid=(indgen(250)-125)*5	;mas
ygrid=(indgen(250)-125)*5	;mas

;Set aspects 
pos1=aspect(1.0, margin=0.28)

;2) Plot Model convolved with E-Merlin Beam 
contour, convol_im,xgrid/1.,ygrid/1.,levels=levels,chars=1.3,xtitle='mas',ytitle='mas',$
Position=[pos1[0]-0.2,pos1[1]-0.184,pos1[2]-0.2,pos1[3]-0.184],background=1,color=0, charthick=3,thick=3,$
xrange=[-350/1.,350/1.],yrange=[-350/1.,350/1.],/xstyle,/ystyle,xthick=3,ythick=3, xminor=1,yminor=1
xyouts, -310/1.,290/1., '5.75 GHz model convolved with', chars=1.1,charthick=3.0
xyouts, -200/1.,250/1., '180x180 mas beam', chars=1.1,charthick=3.0

print, 'Max of GMH low res image ', max(convol_im)

;3) Plot Anita's e-Merlin Image

; Make grid
xgrid=(indgen(512)-256)*15	;mas
ygrid=(indgen(512)-256)*15	;mas

emerlin=readfits('/media/95a465c2-86d8-4173-9edc-7750e1b1879b/merlin/emerlin_cubes/AORI012_3500.ICL001')	; in Jy beam-1 want mJy per pixel
emer_pix_in_beam=beam_area/(15.*15.)
rms=0.027*(1./emer_pix_in_beam)
levels=rms*[indgen(15)+1]*4	;4sig contours
emerlin=emerlin*(1./emer_pix_in_beam)*(1.d+3)	;mjy per pixel
contour, emerlin,(xgrid-20)/1.,(ygrid+80)/1., levels=levels, xrange=[-350/1.,350/1.],yrange=[-350/1.,350/1.],  chars=1.3,thick=3,$
position=[pos1[0]+0.127,pos1[1]-0.184,pos1[2]+0.127,pos1[3]-0.184],/xstyle,/ystyle,xtitle='mas', YTickformat='(A1)',/noerase,xthick=3,ythick=3, xminor=1,yminor=1
xyouts, -220/1.,290/1., 'e-Merlin :180X180 mas', chars=1.1,charthick=3.0
xyouts, -120/1.,250/1., 'restoring beam', chars=1.1,charthick=3.0
; 
print, 'Max of emerlin low res image ', max(emerlin)

print, 'total convolved image flux is ', total(convol_im), ' mJy'
print, 'total emerlin flux is ', total(emerlin), ' mJy'


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; This is for the high resolution analysis ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

restore, '/media/95a465c2-86d8-4173-9edc-7750e1b1879b/merlin/HBL2001_model/high_res/model_gmh_convol.sav'

; Convert rms values from mJy beam-1 to mJy per pix
beam_size=[80.0,60.]		;mas
beam_area=1.133*80.0*60.0	;mas^2
pix_in_beam=beam_area/(5.0*5.0)	;1 pix = 5mas*5mas
rms=0.009*(1./pix_in_beam)
levels=rms*[indgen(20)+1]*4	;4sig contours

; Make grid
xgrid=(indgen(250)-125)*5	;mas
ygrid=(indgen(250)-125)*5	;mas

;Set aspects 
pos1=aspect(1.0, margin=0.28)

; Rotate Image
rot_convol_im=rot(convol_im,143,/interp)

;2) Plot Model convolved with E-Merlin Beam 
contour, rot_convol_im,xgrid/1.,ygrid/1.,levels=levels,chars=1.3,ytitle='mas',XTickformat='(A1)',$
Position=[pos1[0]-0.2,pos1[1]+0.26,pos1[2]-0.2,pos1[3]+0.26],background=1,color=0, charthick=3,thick=3,$
xrange=[-350/1.,350/1.],yrange=[-350/1.,350/1.],/xstyle,/ystyle,/noerase,xthick=3,ythick=3, xminor=1,yminor=1
xyouts, -310/1.,290/1., '5.75 GHz model convolved with', chars=1.1,charthick=3.0
xyouts, -200/1.,250/1., '80x60 mas beam', chars=1.1,charthick=3.0

print, 'Max of GMH high res image ', max(convol_im)

;3) Plot Anita's e-Merlin Image

; Make grid
xgrid=(indgen(512)-256)*15	;mas
ygrid=(indgen(512)-256)*15	;mas

emerlin=readfits('/media/95a465c2-86d8-4173-9edc-7750e1b1879b/merlin/emerlin_cubes/AORI012SC.75.ICL001')	; in Jy beam-1 want mJy per pixel
emer_pix_in_beam=beam_area/(15.*15.)
rms=0.009*(1./emer_pix_in_beam)
levels=rms*[indgen(20)+1]*4	;4sig contours
emerlin=emerlin*(1./emer_pix_in_beam)*(1.d+3)	;mjy per pixel
contour, emerlin,(xgrid-20)/1.,(ygrid+80)/1., levels=levels, xrange=[-350/1.,350/1.],yrange=[-350/1.,350/1.],  chars=1.3,thick=3,$
position=[pos1[0]+0.1265,pos1[1]+0.26,pos1[2]+0.1265,pos1[3]+0.26],/xstyle,/ystyle,YTickformat='(A1)',/noerase,XTickformat='(A1)',xthick=3,ythick=3, xminor=1,yminor=1
xyouts, -220/1.,290/1., 'e-Merlin: 80X60 mas', chars=1.1,charthick=3.0
xyouts, -120/1.,250/1., 'restoring beam', chars=1.1,charthick=3.0
; 
print, 'Max of emerlin high res image ', max(emerlin)

print, 'total convolved image flux is ', total(convol_im), ' mJy'
print, 'total emerlin flux is ', total(emerlin), ' mJy'

;plot beam
xpt=(260.-256.0)*15.	;mas
ypt=(252.0 - 256.0)*15.	;mas
xcenter=(xpt-330.0)
ycenter=(ypt-220.0)
radius1=30.0
radius2=40.0
phi = (2*!PI / 99.0)*FINDGEN(100)
bpa=10
xm = xcenter + radius1*cos(phi)*cos(bpa) + radius2*sin(phi)*sin(bpa)
ym = ycenter - radius1*cos(phi)*sin(bpa) + radius2*sin(phi)*cos(bpa)


oplot, xm,ym,thick=4
cir=TRANSPOSE([[xm],[ym]])
POLYFILL, CIR
xyouts, xcenter-40, ycenter+50, 'BEAM', chars=1.,charthick=3.0

DEVICE, /CLOSE
stop

End
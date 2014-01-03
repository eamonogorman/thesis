PRO disk_temp
;
; ODEV_L, 'disk_temps'
; !P.FONT=0
; SPECTABLE
GET_CCONST, cc, hh, me, mp, Roo, bk, Gnewt, msol, rsol, pc, au, ee, yr
;
; First plot Lim's
te=[3450.0, 3180.0, 2850.0,2300.0, 1370.0]
te_err=[850.0, 350.0, 450.0,300.0, 330.0]
rad=[45.0,55.0,70.0,95.0,155.0]/(43.33/2)
rad_err=[1.0,1.0,4.0,6.0,14.0]/(43.33/2)
;
data_lim=te
data_err_lim=te_err
radius_lim=rad
radius_err_lim=rad_err
flx_lim=[27.96,11.92,6.86,3.35,1.77]
flx_lim_err=[5.6,0.48,0.21,0.05,0.09]
freq_lim=[43.34,22.46,14.94,8.46,4.86]*1d+9

plot, rad, te, PSYM=3, chars=1.8, thick=4, $
  xstyle=1, lines=0, $
  xtitle='Radius (R!d*!n)', xthick=4, $
  ytitle='T!de!n (K)', ythick=4, $
  ystyle=1, color=0, /nodata, xr=[0,10],yr=[0,4500]
oplot, rad, te, PSYM=sym(1),symsize=2,color=4
oploterror,rad, te, rad_err,te_err, psym=3, /NOHAT,errcolor=4,errthick=3
vline, 1, lines=1,thick=4
xyouts, 0.9, 400, 'Photospheric radius',  ORIENTATION=90,chars=1.5

;Richards
rad=sqrt(235.0*218.0)/2.0/(43.33/2)
te=1170.0
te_err=135
rad_err=6.0/(43.33/2)
plots, rad, te, PSYM=sym(4),symsize=2,color=3
oploterror,rad, te, rad_err,te_err, psym=3, /NOHAT,errcolor=3,errthick=3

data_rich=te
data_err_rich=te_err
radius_rich=rad
radius_err_rich=rad_err
flx_rich=1.71
flx_rich_err=0.027
freq_rich=5.75d+9

; 2004 Data
; Q, K, U, X, C
wl=[0.7,1.3,2.0,3.5,6.2]
flx=[0.0303667, 0.013419, 0.0073608, 0.00325924, 0.00150276]*1.0d+3
flx_err=[0.000624777, 0.000114086, 0.000148242, 2.99882e-05, 3.43981e-05]*1.0d+3
diam=[0.0977773, 0.124499, 0.154151, 0.181116, 0.263705]
diam_err=[0.00665329, 0.00384792, 0.0130323,0.00965509, 0.043973]
;
radius=diam/2.0/(0.04333/2)
radius_err=diam_err/2.0/(0.04333/2)
;
te=(2.0*flx*(wl^2))/(diam*diam)
;
;##### errors on te
bottom_err=diam*diam*sqrt((diam_err/diam)^2+(diam_err/diam)^2)
top_err=(2.0*flx_err*(wl^2))
te_err=te*sqrt((top_err/(2.0*flx*(wl^2)))^2 + (bottom_err/(diam*diam))^2)
;##################
;
oplot, radius, te, PSYM=sym(5),symsize=2,color=2
oploterror,radius, te, radius_err, te_err, psym=3, /NOHAT,errcolor=2,errthick=3

data_04=te
data_err_04=te_err
radius_04=radius
radius_err_04=radius_err
flx_04=flx
flx_04_err=flx_err
freq_04=cc/wl

; 2003 Data
; Q, K, U, X
wl=[0.7,1.3,2.0,3.5]
flx=[0.0259358, 0.0110256, 0.00568354, 0.0027194]*1.0d+3
flx_err=[0.000966283, 0.000260625, 0.000172912, 3.29997e-05]*1.0d+3
diam=[0.0969883,0.120403,0.13584,0.163267]
diam_err=[0.0128079, 0.0104876,0.0181333,0.0121496]
;
radius=diam/2.0/(0.04333/2)
radius_err=diam_err/2.0/(0.04333/2)
;
te=(2.0*flx*(wl^2))/(diam*diam)
;
;##### errors on te
bottom_err=diam*diam*sqrt((diam_err/diam)^2+(diam_err/diam)^2)
top_err=(2.0*flx_err*(wl^2))
te_err=te*sqrt((top_err/(2.0*flx*(wl^2)))^2 + (bottom_err/(diam*diam))^2)
;##################
;
oplot, radius, te, PSYM=sym(6),symsize=2,color=3
oploterror,radius, te, radius_err, te_err, psym=3, /NOHAT,errcolor=3,errthick=3

data_03=te
data_err_03=te_err
radius_03=radius
radius_err_03=radius_err
flx_03=flx
flx_03_err=flx_err
freq_03=cc/wl

; 2002 Feb Data
; K, U, X, C
wl=[1.3,2.0,3.5, 6.2]
flx=[0.0106622, 0.00540607,0.00272784, 0.00208083]*1.0d+3
flx_err=[0.000206881, 0.000215528, 3.83611e-05, 0.000473593]*1.0d+3
diam=[0.11915, 0.15199, 0.212689, 0.681509]
diam_err=[0.00887298, 0.0247552, 0.0147162, 0.537398]
;
radius=diam/2.0/(0.04333/2)
radius_err=diam_err/2.0/(0.04333/2)
;
te=(2.0*flx*(wl^2))/(diam*diam)
;
;##### errors on te
bottom_err=diam*diam*sqrt((diam_err/diam)^2+(diam_err/diam)^2)
top_err=(2.0*flx_err*(wl^2))
te_err=te*sqrt((top_err/(2.0*flx*(wl^2)))^2 + (bottom_err/(diam*diam))^2)
;##################
;
oplot, radius, te, PSYM=sym(6),symsize=2,color=4
oploterror,radius, te, radius_err, te_err, psym=3, /NOHAT,errcolor=4,errthick=3
 
data_02=te
data_err_02=te_err
radius_02=radius
radius_err_02=radius_err
flx_02=flx
flx_02_err=flx_err
freq_02=cc/wl

; ############
xyouts, 5.5, 4150, 'VLA: Lim et al. (1998)',chars=1.3
plots, 5.3, 4200, PSYM=sym(1),symsize=2,color=4
xyouts, 5.5, 3900, 'VLA + Pie Town (2002)',chars=1.3
plots, 5.3, 3950, PSYM=sym(6),symsize=1.8,color=4
xyouts, 5.5, 3650, 'VLA + Pie Town (2003) ',chars=1.3
plots, 5.3, 3700, PSYM=sym(6),symsize=2,color=3
xyouts, 5.5, 3400, 'VLA + Pie Town (2004)',chars=1.3
plots, 5.3, 3450, PSYM=sym(5),symsize=2,color=2
xyouts, 5.5, 3150, 'e-MERLIN: Richards et al. (2013) ',chars=1.3
plots, 5.3, 3200, PSYM=sym(4),symsize=2,color=3


;

; ######## Fit power law
data=[data_lim,data_rich,data_04,data_03,data_02[0:2]]
data_err=[data_err_lim,data_err_rich,data_err_04,data_err_03,data_err_02[0:2]]
radius=[radius_lim,radius_rich,radius_04,radius_03,radius_02[0:2]]
radius_err=[radius_err_lim,radius_err_rich,radius_err_04,radius_err_03,radius_err_02[0:2]]
flx=[flx_lim,flx_rich,flx_04,flx_03,flx_02[0:2]]
flx_err=[flx_lim_err,flx_rich_err,flx_04_err,flx_03_err,flx_02_err[0:2]]
freq=[freq_lim,freq_rich,freq_04,freq_03,freq_02[0:2]]
;
radius_sort=sort(radius)
data_log=alog10(data[radius_sort])
data_err_log=alog10(data_err[radius_sort])
radius_log=alog10(radius[radius_sort])
radius_err_log=alog10(radius_err[radius_sort])

freq_log=alog10(freq)
flx_log=alog10(flx)
flx_err_log=alog10(flx_err)


y2=LINFIT(radius_log, data_log, /DOUBLE, MEASURE_ERRORS=data_err_log,chisq = chisq, prob=prob, sigma=sigma)

line1=y2[1]*radius_log + y2[0]

;plot, 10^radius_log, 10^data_log,psym=1
oplot, 10^radius_log, 10^line1,thick=4,lines=2



;DEVICE, /CLOSE
plot, freq_log, flx_log, psym=1
y3=LINFIT(freq_log, flx_log, /DOUBLE, MEASURE_ERRORS=flx_err_log,chisq = chisq, prob=prob, sigma=sigma)
line2=y3[1]*freq_log + y3[0]

;plot, 10^radius_log, 10^data_log,psym=1
oplot, freq_log, line2,thick=4,lines=2

stop
END
PRO make_model
;
ODEV_L, 'carma_configs'
!P.FONT=0
!p.multi=[0,2,2]

GET_CCONST, cc, hh, me, mp, Roo, bk, Gnewt, msol, rsol, pc, au, ee, yr
make_ct,ncolors=4

readcol,'e_config_plotants.csv',xe,ye,FORMAT = fmt

readcol,'d_config_plotants.csv',xd,yd,FORMAT = fmt

readcol,'c_config_plotants.csv',xc,yc,FORMAT = fmt

plot, xe-30, ye-40, ytitle='Y (m)',xtitle='x (m)',xr=[-50,50],yr=[-50,50],$
xstyle=1, ystyle=1,chars=1.3,thick=4,background=1,color=0, xthick=4, $
ythick=4,psym=sym(1),symsize=1.6,charthick=4,/normal,position=[0.08,0.28,0.35,0.72]
xyouts, 3,38,'E-config',chars=1.8,color=5
; Now overplot 10.4m antennas
plots, xe[0]-30, ye[0]-40, psym=sym(1),symsize=2.2, color=4
plots, xe[2]-30, ye[2]-40, psym=sym(1),symsize=2.2, color=4
plots, xe[5]-30, ye[5]-40, psym=sym(1),symsize=2.2, color=4
plots, xe[8]-30, ye[8]-40, psym=sym(1),symsize=2.2, color=4
plots, xe[12]-30, ye[12]-40, psym=sym(1),symsize=2.2, color=4
plots, xe[14]-30, ye[14]-40, psym=sym(1),symsize=2.2, color=4


plot, xd-80, yd-90,xtitle='x (m)',xr=[-100,100],yr=[-100,100],$
xstyle=1, ystyle=1,chars=1.3,thick=4,background=1,color=0, xthick=4, $
ythick=4,psym=sym(1),symsize=1.6,charthick=4,/normal,position=[0.4,0.28,0.67,0.72]
xyouts, 5,77,'D-config',chars=1.8,color=5
plots, [-50,50], [50,50],lines=2,color=2,thick=5
plots, [-50,50], [-50,-50],lines=2,color=2,thick=5
plots, [-50,-50], [-50,50],lines=2,color=2,thick=5
plots, [50,50], [-50,50],lines=2,color=2,thick=5
; Now overplot 10.4m antennas
plots, xd[0]-80, yd[0]-90, psym=sym(1),symsize=2.2, color=4
plots, xd[1]-80, yd[1]-90, psym=sym(1),symsize=2.2, color=4
plots, xd[4]-80, yd[4]-90, psym=sym(1),symsize=2.2, color=4
plots, xd[5]-80, yd[5]-90, psym=sym(1),symsize=2.2, color=4
plots, xd[13]-80, yd[13]-90, psym=sym(1),symsize=2.2, color=4
plots, xd[14]-80, yd[14]-90, psym=sym(1),symsize=2.2, color=4


plot, xc-120, yc-250,xtitle='x (m)',xr=[-250,250],yr=[-250,250],$
xstyle=1, ystyle=1,chars=1.3,thick=4,background=1,color=0, xthick=4, $
ythick=4,psym=sym(1),symsize=1.6,charthick=4,/normal,position=[0.72,0.28,0.99,0.72]
xyouts, 10,190,'C-config',chars=1.8,color=5

; Now overplot 10.4m antennas
plots, xc[1]-120, yc[1]-250, psym=sym(1),symsize=2.2, color=4
plots, xc[4]-120, yc[4]-250, psym=sym(1),symsize=2.2, color=4
plots, xc[5]-120, yc[5]-250, psym=sym(1),symsize=2.2, color=4
plots, xc[6]-120, yc[6]-250, psym=sym(1),symsize=2.2, color=4
plots, xc[13]-120, yc[13]-250, psym=sym(1),symsize=2.2, color=4
plots, xc[14]-120, yc[14]-250, psym=sym(1),symsize=2.2, color=4

plots, [-100,100], [100,100],lines=2,color=2,thick=5
plots, [-100,100], [-100,-100],lines=2,color=2,thick=5
plots, [-100,-100], [-100,100],lines=2,color=2,thick=5
plots, [100,100], [-100,100],lines=2,color=2,thick=5

plots, [ 0.35, 0.46 ], [ 0.72, 0.61 ], /normal, lines=2, thick=5,color=2
plots, [ 0.67, 0.79 ], [ 0.72, 0.59 ], /normal, lines=2, thick=5,color=2

plots, [ 0.46, 0.35 ], [ 0.39, 0.28 ], /normal, lines=2, thick=5,color=2
plots, [ 0.79, 0.67 ], [ 0.40, 0.28 ], /normal, lines=2, thick=5,color=2

DEVICE, /CLOSE

stop
END
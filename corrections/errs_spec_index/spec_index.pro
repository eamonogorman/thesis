PRO spec_index



; ODEV_L, 'evla_spec_index'
; !P.FONT=0
; 
; nu=textoidl('\nu')
; alpha=textoidl('\alpha')
; unit=[1., 1.]

; Alpha Boo
; make_ct,ncolors=3
q=alog10([1.63, 2.87,3.15,4.9,8.46,22.46,33.56,43.28]*1d+9)	;l,s,s,c,x,k,ka,q
flx=alog10([0.067, 0.127, 0.148,0.214,0.51,1.827,4.159,5.941])
err=alog10([0.013, 0.012, 0.028,0.035,0.03,0.043,0.083,0.301])

y1=LINFIT(q[0:3], flx[0:3], /DOUBLE)
y2=LINFIT(q[0:3], flx[0:3], /DOUBLE, MEASURE_ERRORS=err[0:3],chisq = chisq, prob=prob, sigma=sigma)

; plot, q,flx,psym=sym(1),symsize=2.0,background=1,color=0,$
; xtitle='Log!d10!n '+nu+' (Hz)',ytitle='Log!d10!n Flux Density (mJy)',$
; thick=5,charthick=4,charsize=2.0,xthick=3,ythick=3	
; 
; flx=10^flx
; err=10^err
; ymn=(flx-err)
; ymx=(flx+err)
; PLOTS, q[0]*unit, alog10([ymn[0],ymx[0]]), lines=0, color=0, thick=3
; PLOTS, q[1]*unit, alog10([ymn[1],ymx[1]]), lines=0, color=0, thick=3
; PLOTS, q[2]*unit, alog10([ymn[2],ymx[2]]), lines=0, color=0, thick=3
; PLOTS, q[3]*unit, alog10([ymn[3],ymx[3]]), lines=0, color=0, thick=3
; PLOTS, q[4]*unit, alog10([ymn[4],ymx[4]]), lines=0, color=0, thick=3
; PLOTS, q[5]*unit, alog10([ymn[5],ymx[5]]), lines=0, color=0, thick=3
; PLOTS, q[6]*unit, alog10([ymn[6],ymx[6]]), lines=0, color=0, thick=3
; PLOTS, q[7]*unit, alog10([ymn[7],ymx[7]]), lines=0, color=0, thick=3

; line1=y1[1]*q+y1[0]  
; line2=y2[1]*q+y2[0]  
; oplot, q[0:3],line2,color=2, thick=5
; print, y2[1]
; print, 'chisq aboo ', chisq
; print, 'prob aboo ', prob
; print, 'sigma aboo ', sigma

;############################# Errors
q=alog10([1.63, 2.87,3.15,4.9,8.46,22.46,33.56,43.28]*1d+9)	;l,s,s,c,x,k,ka,q
flx=([0.067, 0.127, 0.148,0.214,0.51,1.827,4.159,5.941])
err=([0.013, 0.012, 0.028,0.035,0.03,0.043,0.083,0.301])
print, 'errors'
 y1=LINFIT(q[0:3], alog10(flx[0:3]+err[0:3]), /DOUBLE)
 print, y1[1]
 y1=LINFIT(q[0:3], alog10(flx[0:3]-err[0:3]), /DOUBLE)
 print, y1[1]
;#############################


; ; Alpha Tau
; q=alog10([3.15,4.96,8.46,22.46,33.56,43.28]*1d+9)	;s,c,x,k,ka,q
; flx=alog10([0.062,0.147,0.296,1.864,2.188,3.672])
; err=alog10([0.017,0.01,0.014,0.042,0.091,0.259])
; 
; y1=LINFIT(q[0:2], flx[0:2], /DOUBLE)
; y2=LINFIT(q[0:2], flx[0:2], /DOUBLE, MEASURE_ERRORS=err[0:2],chisq = chisq, sigma=sigma)
; oplot, q,flx,psym=sym(4),symsize=2.5,color=4
; line1=y1[1]*q+y1[0]  
; line2=y2[1]*q+y2[0]  
; oplot, q[0:2],line2,color=3,thick=5
; print, y2[1]
; print, 'chisq atau ', chisq
; print, 'sigma aboo ', sigma	
; 
; flx=10^flx
; err=10^err
; ymn=(flx-err)
; ymx=(flx+err)
; PLOTS, q[0]*unit, alog10([ymn[0],ymx[0]]), lines=0, color=4, thick=3
; PLOTS, q[1]*unit, alog10([ymn[1],ymx[1]]), lines=0, color=4, thick=3
; PLOTS, q[2]*unit, alog10([ymn[2],ymx[2]]), lines=0, color=4, thick=3
; PLOTS, q[3]*unit, alog10([ymn[3],ymx[3]]), lines=0, color=4, thick=3
; PLOTS, q[4]*unit, alog10([ymn[4],ymx[4]]), lines=0, color=4, thick=3
; PLOTS, q[5]*unit, alog10([ymn[5],ymx[5]]), lines=0, color=4, thick=3
; 
; ;############################# Errors
; q=alog10([3.15,4.96,8.46,22.46,33.56,43.28]*1d+9)	;s,c,x,k,ka,q
; flx=([0.062,0.147,0.296,1.864,2.188,3.672])
; err=([0.017,0.01,0.014,0.042,0.091,0.259])
; print, 'errors'
; y1=LINFIT(q[0:3], alog10(flx[0:3]+err[0:3]), /DOUBLE)
; print, y1[1]
; y1=LINFIT(q[0:3], alog10(flx[0:3]-err[0:3]), /DOUBLE)
; print, y1[1]
; ;#############################
; 
; xyouts, 9.2,0.62,''+alpha+' Boo',color=0,charsize=2.0,charthick=4.0
; plots,[9.15,0.66], psym=sym(1),symsize=2.0,color=0
; 
; xyouts, 9.2,0.43,''+alpha+' Tau',color=4,charsize=2.0,charthick=4.0
; plots,[9.15,0.46], psym=sym(4),symsize=2.0,color=4
; 
; xyouts, 9.2,-0.70,alpha+' = 1.05',color=2,charsize=2.0,charthick=4.0
; xyouts, 9.7,-1.1,alpha+' = 1.58',color=3,charsize=2.0,charthick=4.0
; 
; DEVICE, /CLOSE
; stop
END
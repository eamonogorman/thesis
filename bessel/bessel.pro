PRO bessel
;
a=300.
theta = fillarr(0.01,0,90)
phi = fillarr(0.01,0,360)
u = a*sin(!dtor*theta)*cos(!dtor*phi);

l=1/u

; F=sin(!dtor*!pi*l)/(!pi*l)
; plot, l,F,xr=[-100,100]

x=beselj(!pi*27.*u,1)/u
plot, u,x
;
END
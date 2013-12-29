PRO mass_loss


;################# Alpha Boo ######################
v_inf=40.0
dist=11.3
wl=[6.0,9.5,10.0,20.0]
flx=[0.214,0.148,0.127,0.067]

m_dot=5.5813842e-14*(v_inf)*((dist)^1.5)*((flx)^0.75)*((wl)^0.45)
print, 'Alpha Boo: Ionised mass Loss rates are ', m_dot

;errors
dist_err=0.1
flx_err=[0.035, 0.028, 0.012, 0.013]
m_dot_err=m_dot*(1.5*(dist_err/dist)+0.75*(flx_err/flx))
print, 'Alpha Boo: errors', m_dot_err
print, 'Alpha Boo: percent errors', m_dot_err*100.0/m_dot

;################# Alpha Tau ######################
v_inf=30.0
dist=20.4
wl=[6.0,9.5]
flx=[0.147,0.062]

m_dot=5.5813842e-14*(v_inf)*((dist)^1.5)*((flx)^0.75)*((wl)^0.45)
print, 'Alpha Tau: Ionised mass Loss rates are ', m_dot

;errors
dist_err=0.3
flx_err=[0.01,0.017]
m_dot_err=m_dot*(1.5*(dist_err/dist)+0.75*(flx_err/flx))
print, 'Alpha Tau: errors', m_dot_err
print, 'Alpha Tau: percent errors', m_dot_err*100.0/m_dot

END

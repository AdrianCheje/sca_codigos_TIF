
//--------------modelo de referencia
dzeta1=1
Ts1=0.255623
Wn1=3.912/(dzeta1*Ts1); // frecuencia natural
//Ts=3
//gamma1=1
//gamma2=0.0001
//------------ modelo para el filtro
gamma1=5
gamma2=0.02
// modelo del sistema
K=0.1705 // hertz
T=7.1167

// controlador PID
Kp1=T*Wn1^2/K;
Ki1=Wn1^2*T/(10*K);
Kd1=(2*T*dzeta1*Wn1-1)/K

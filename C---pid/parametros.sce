// modelo de nomotoo
K=0.1705  // hertz
T=7.1167 // seg



// modelo de referencia
Wn3=0.3  //rad/s
 
// control PID
Kp3=(T*Wn3^2)/K;
Ki3=Wn3*Kp3/10
dzeta3=0.8
Kd3=(2*T*dzeta3*Wn3-1)/K


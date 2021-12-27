// Form the state space model (assume full state output)
T=7.1167;
K=0.1705;

a=-1/T;
b=K/T;

A = [0 1; 0 a];
B = [0; b];
C = [1 0];

P = syslin("c",A, B, C);
//The compensator weights
Q=[100000 0;0 0.1]; //Weights on states
R= 0.001; //Weight on input
Kc=lqr(P,Q,R);
K1=-Kc(1,1);
K2=-Kc(1,2);



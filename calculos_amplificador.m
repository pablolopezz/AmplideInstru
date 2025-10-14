%%DATOS EXPERIMENTOS

m = [0 10 20 50 100 200];
V_m = [-0.488 -0.463 -0.440 -0.368 -0.250 -0.015];

regresLin(m,V_m,[]);


%%VAMOS A NECESITAR DS ETAPAS AMPLIFICADORAS PARA LLEGAR A ELLO

%%VAMOS A PONER R1 = 10k, Rth = 1k


Vc = 5;
R1 = 10e3; % Resistance R1 in ohms
Rth = 1e3; % Resistance Rth in ohms
Vcc = Vc;  % Assuming Vcc is set to Vc for calculation

V =[0:1e-6: 0.15e-3*Vcc];

Vf = 2*R1/(Rth+2*R1)*V;
Ecc = Rth/(Rth+2*R1)*V;

A=3.3/Vf(end)

% plot(V,Vf);
% hold on;
% plot(V,Ecc);
% hold on;
% plot(V,Vf+Ecc);

%GANANCIA

R2 = A*R1;


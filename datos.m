% Cadena de instrumentación

%%DATOS EXPERIMENTOS

m = [0 10 20 50 100 200];
V_m = [-0.488 -0.463 -0.440 -0.368 -0.250 -0.015];

%regresLin(m,V_m,[]);

%Datos

Vcc     = 5;                                % voltios
Scc     = (-0.015-(-0.488))/200             % milivoltios/g
Vaboff  = -0.488e-3                         % voltios
Vabmax  = (Vaboff+Scc*1000)*0.001;          % voltios
Rth     = 1000;                             % ohmios
fc      = 10;                               % Hercios
R1      = 1000;                             % ohmios
R3      = 1000;                             % ohmios

%% Célula de carga min----->V

m_in_min = 0; m_in_max = 1;                 % kg



%% Filtro

alpha=2*R1/(2*R1+Rth);

Vfmin=alpha*Vaboff;
Vfmax=alpha*Vabmax;

Cf = 1/(2*pi*fc*Rth);                       % faradios

%% Amplificador

% Primera etapa

A = 3.3/(Vfmax-Vfmin)                       % V/V

A1 = sqrt(A);                               % V/V
R2 = A1*R1;                                 % ohmios

% Segunda etapa

A2 = sqrt(A);                               % V/V
R4 = A2*R1;                                 % ohmios

OffA=Vfmin

%% CAD

b = 10;

Scad = (2.^b - 1)/3.3                       % LSB/V

%% FI

Sfi=1/(A*alpha*Scad*Scc)
Offfi=-OffA/(A*alpha*Scc)-Vaboff/Scc
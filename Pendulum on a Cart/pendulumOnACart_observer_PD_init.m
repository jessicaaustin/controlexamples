
clear;
clc;
close all;

%% EOMs

% plant params (physical values)
g = 9.81;  % gravity [m/s^2]
cM = 5;    % Cart mass [kg]
pL = 0.25;  % pendulum length [m]
pm = 1;     % pendulum mass [kg]

% model params -- slightly off to account for non-perfect characterization
cM_model = cM+0.2;
pL_model = pL-0.1; 
pm_model = pm-0.15; 

A = [0                      0                           1	0
     0                      0                           0	1
     0           (-pm_model*g)/cM_model                 0	0
     0	((cM_model+pm_model)*g)/(cM_model*pL_model) 	0	0];
B = [0
     0
     1/cM_model
     -1/(cM_model*pL_model)];
C = [1  0  0  0
     0  1  0  0];
D = 0;
sys = ss(A,B,C,D);
fprintf('\nControllability:\n\trank(ctrb(sys))=%d\n',rank(ctrb(sys)));


%% Initial values

theta_init = 0.2;   % initial pendulum angle [rad]
dTheta_init = 2.0;  % initial pendulum angular velocity [rad/s]


%% Sensors

dt = 1/1000;  % sample time [sec]
encRez=12;    % encoder resolution [bits]
fcutDeriv = 10;  % cutoff frequency for derivative filter [Hz]


%% Controller

% use pole placement to determine K
p1 = -2 + 1i;
p2 = -2 - 1i;
p3 = -1.0000 + 0.2506i;
p4 = -1.0000 - 0.2506i;
K = place(A,B,[p1 p2 p3 p4]);

figure;
    pzmap(ss(A-B*K,B,C,D)); title('controller');
    xlim([-12 1]);

%% Observer

fprintf('\nObservability:\n\trank(obsv(sys))=%d\n',rank(obsv(sys)));

% use pole placement to determine L
p1 = -10 + 10i;
p2 = -10 - 10i;
p3 = -5.0000 + 0.2506i;
p4 = -5.0000 - 0.2506i;
L=(place(A',C',[p1 p2 p3 p4]))';

figure;
    pzmap(ss(A-L*C,B,C,D)); title('observer');
    xlim([-12 1]);

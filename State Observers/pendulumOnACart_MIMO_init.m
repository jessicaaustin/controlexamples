
clear;
clc;
close all;

%% EOMs

% plant params (physical values)
g = 9.81;  % gravity [m/s^2]
cM = 5;    % Cart mass [kg]
pL = 0.25;  % pendulum length [m]
pm = 1;     % pendulum mass [kg]

C = [1  0  0  0
     0  1  0  0];


%% Initial values

theta_init = 0.2;   % initial pendulum angle [rad]
dTheta_init = 2.0;  % initial pendulum angular velocity [rad/s]
y_init = 1.0;       % initial position [m]
dY_init = 0.5;      % intial velocity [m/s]

%% Sensors

dt = 1/1000;  % sample time [sec]
encRez=12;    % encoder resolution [bits]


%% Controller

% hand-tuned gains
kp_f = 30;
kd_f = 8;
kp_torque = 30;
kd_torque = 8;
fcutDeriv = 50;  % cutoff frequency for derivative filter [Hz]

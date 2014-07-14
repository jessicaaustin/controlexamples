
clear;
close all;

%% Parameters

m = 1;   %[kg]
k = 0.8;   %[N/m]
c = 0.2; %[Ns/m]

% timestep
dt = 0.001;  %[s]
experimentStopTime = 60; %[s]

% frequencies
wmin = 0.1;  %[Hz]
wmax = 10;   %[Hz]

clear;
close all;

dt = 0.001; %[sec]
time=(0:dt:30)'; %[sec]
wmin = 0.5; %[Hz]
wmax = 1.5; %[Hz]

%% two chirp signals, with phase offset

phaseOffset = -25; %[deg]

% generate chirp signals
inputSignal = chirp(time,wmin,time(end),wmax,'linear');
outputSignal = chirp(time,wmin,time(end),wmax,'linear',phaseOffset);

% bode plot
bodeDemo_plot(time, dt, inputSignal, outputSignal, wmin, wmax);
suptitle('25 deg phase lag');
        
%% two chirp signals, magnitude offset by 12%

magnitudeDifference = 1.12;

% generate chirp signals
inputSignal = chirp(time,wmin,time(end),wmax,'linear');
outputSignal = magnitudeDifference*chirp(time,wmin,time(end),wmax,'linear');

% bode plot
bodeDemo_plot(time, dt, inputSignal, outputSignal, wmin, wmax);
suptitle('12% magnitude increase');
        
%% two chirp signals, magnitude offset by 50%

magnitudeDifference = 1.5;

% generate chirp signals
inputSignal = chirp(time,wmin,time(end),wmax,'linear');
outputSignal = magnitudeDifference*chirp(time,wmin,time(end),wmax,'linear');

% bode plot
bodeDemo_plot(time, dt, inputSignal, outputSignal, wmin, wmax);
suptitle('50% magnitude increase');

%% Phase and magnitude offsets

phaseOffset = -25; %[deg]
magnitudeDifference = 1.12;

% generate chirp signals
inputSignal = chirp(time,wmin,time(end),wmax,'linear');
outputSignal = magnitudeDifference*chirp(time,wmin,time(end),wmax,'linear',phaseOffset);

% bode plot
bodeDemo_plot(time, dt, inputSignal, outputSignal, wmin, wmax);
suptitle('25 deg phase lag and 12% magnitude increase');
        
%% continuous (chirp) vs discrete (single frequencies)

phaseOffset = -25; %[deg]
magnitudeDifference = 1.12;

% generate discrete experiments
inputSignal = [];
outputSignal = [];
allTime = [0];
for w=wmin:.5:wmax
    allTime = [allTime; time+allTime(end)];
    inputSignal = [inputSignal;
                   chirp(time,w,time(end),w,'linear')];
    outputSignal = [outputSignal;
                    magnitudeDifference*chirp(time,w,time(end),w,'linear',phaseOffset)];
end
allTime(1)=[];

% bode plot
bodeDemo_plot(allTime, dt, inputSignal, outputSignal, wmin, wmax);
suptitle('25 deg phase lag and 12% magnitude increase (discrete experiments)');

% generate chirp signals
inputSignal = chirp(allTime,wmin,allTime(end),wmax,'linear');
outputSignal = magnitudeDifference*chirp(allTime,wmin,allTime(end),wmax,'linear',phaseOffset);

% bode plot
bodeDemo_plot(allTime, dt, inputSignal, outputSignal, wmin, wmax);
suptitle('25 deg phase lag and 12% magnitude increase (chirp signal)');
        
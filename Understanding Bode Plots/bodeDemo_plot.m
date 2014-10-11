function [] = bodeDemo_plot(time, dt, inputSignal, outputSignal, wmin, wmax)

%% Analyze frequency content

% represent as a system in the time domain
datat=iddata(outputSignal, inputSignal, dt);
% same data in the frequency domain
dataf=fft(datat);
% convert to rad/s
wmin=wmin*2*pi;
wmax=wmax*2*pi;
freqResp=spafdr(dataf);

%% Bode Plot

% bode opts
opts = bodeoptions('cstprefs');
opts.FreqUnits = 'Hz';
opts.YLimMode = {'manual';'manual'};
opts.YLim = {[-1,4];[-60,1]}; %{mag,phase}

figure;
    subplot(5,1,1:3); hold on;
        plot(time,inputSignal, 'b');
        plot(time,outputSignal, 'r');
        legend('input', 'output');
        xlabel('time (sec)');
        grid on;
    subplot(5,1,4:5);
        bode(freqResp, {wmin, wmax}, opts);
        grid on;
        title('');

end
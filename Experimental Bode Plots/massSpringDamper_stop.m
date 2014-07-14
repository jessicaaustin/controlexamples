
%% State-space system

A = [0 1; -k/m -c/m];
B = [0 1/m]';
C = [1 0];
D = [0];

sys = ss(A,B,C,D);
figure;
    bode(sys, {wmin, wmax});
    title('Bode Diagram (state-space system)');


%% Physical system

% Time domain
figure;
    subplot(2,1,1);
        plot(time_sim, x_sim);
        ylabel('x (m)');
    subplot(2,1,2);
        plot(time_sim, F_sim);
        ylabel('F (N)');
    xlabel('time (sec)');

% Bode Plot
datat=iddata(x_sim, F_sim, dt);  % represent the system as input and output 
                                 % data with timestep dt (time domain)
dataf=fft(datat);   % same data in the frequency domain
set(dataf,'InputName','F', 'OutputName', 'x')

gf=spafdr(dataf);  % estimate frequency response using spectral analysis
    
figure;
    bode(gf, {wmin, wmax});
    title('Bode Diagram (simulation)');

% Estimate transfer function
% Of the form:  X/F = 1/(m*s^2 + b*s + k)
np = 2;
nz = 0;
fprintf('\nEstimating transfer function....\n');
sysest = tfest(dataf, np, nz)
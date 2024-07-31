clear

% Define motor parameters
J=0.0027;
Ff=0.0004924;
L_q = 0.000795; %H
L_d = L_q; %H
R_s= 0.05; % Ohm
Flux = 0.192;  %Wb
p = 4;
vdc=560;
Vdc=100;

%Calculating Gains
fsw=5000;
Kpq=(L_q*2*pi*fsw)/10;
Kpd=(L_d*2*pi*fsw)/10;
Kiq=Kpd*(R_s/L_q);
Kid=Kpd*(R_s/L_d);
Ksq=Kiq;
Ksd=Kid;

Kp = (L_q*2*pi*fsw)/10;
Ki = (L_d*2*pi*fsw)/10;
Ki_s = 1;
Kp_s = 1;



% Open SISO Design Tool for q-axis
%sisotool(G_q);
%nyquist(G_q);

% 
%% Bode plot of Pi(s)

s=tf('s');
%P = 1/(L_q*s + R_s);
%sisotool(P)

    
% Define motor parameters
L_q = 96.5E-6; %H
L_d = L_q; %H
R_s= 7.06E-3; % Ohm
Flux = 0.1827;  %Wb
p = 4;
Kp = 143;
Ki = 1100;
Ki_s = 1;
Kp_s = 1;



% Open SISO Design Tool for q-axis
%sisotool(G_q);
%nyquist(G_q);

% 
%% Bode plot of Pi(s)

s=tf('s');
P = 1/(L_q*s + R)
sisotool(P)

    
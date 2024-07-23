% Define motor parameters
L_d= 0.00525; % H
L_q= 0.00525; % H
R_s = 0.9585; % Ohm
Flux = 0.1827;  %Wb
p = 4;
omega = 100; % Angular speed
%Kp = ;
%Ki = ;

% Define the transfer functions for the d-axis and q-axis
% Motor dynamics (assuming simple RL model for demonstration)
G_d = tf(1, [L_d, R_s]);
G_q = tf(1, [L_q, R_s]);

% Decoupling terms
D_d = tf(omega*L_q, 1);
D_q = tf([omega*L_d, 0]) + tf(omega*Flux, 1);


% Combined open-loop transfer function for d-axis
OL_d = G_d;

% Combined open-loop transfer function for q-axis
OL_q = G_q;

% Open SISO Design Tool for d-axis
%sisotool(OL_d);

% Open SISO Design Tool for q-axis
sisotool(OL_q);



clear

% Define motor parameters
L_q = 96.5E-6; %H
L_d = L_q; %H
R_s= 7.06E-3; % Ohm
Flux = 0.03737;  %Wb
p = 4;

%Calculating Gains
fn=R_s/(2*pi*L_q);
Kpq=(L_q*2*pi*fn)/10;
Kpd=(L_d*2*pi*fn)/10;
Kiq=Kpd*(R_s/L_q);
Kid=Kpd*(R_s/L_d);


%Kp = 143;
%Ki = 1300;
%Ki_s = 1;
%Kp_s = 1;



% Open SISO Design Tool for q-axis
%sisotool(G_q);
%nyquist(G_q);

% 
%% Bode plot of Pi(s)

s=tf('s');
%P = 1/(L_q*s + R_s);
%sisotool(P)

    
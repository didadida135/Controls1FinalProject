clear

% Define motor parameters
J=0.0027;
Ff=0.0004924;
Lq = 0.000795; %H
Ld = Lq; %H
Rs= 0.05; % Ohm
Flux = 0.192;  %Wb
p = 4;
vdc=560;
Vdc=100;
Kt=Flux*p;

%Calculating Gains
fsw=5000;
Kpq=(Lq*2*pi*fsw)/10;
Kpd=(Ld*2*pi*fsw)/10;
Kiq=Kpd*(Rs/Lq);
Kid=Kpd*(Rs/Ld);
Ksq=Kiq;
Ksd=Kid;

Kp = (Lq*2*pi*fsw)/10;
Ki = (Ld*2*pi*fsw)/10;
Ki_s = 1;
Kp_s = 1;


% Define linearized state-space matrices
A = [-Rs/Ld, Lq/Ld;
    -Ld/Lq, -Rs/Lq]; % *K matrix
    
B = [1/Ld, 0;
     0, 1/Lq];

% 
C = eye(2); % Output all states
D = zeros(2,2); % No direct feedthrough from inputs to outputs

% E how do we add this one?
E = [0;      % *wm
    Flux/Lq]; 

%Controller Matrix
K= [0,1;
    1,0]; % *w_m

iqm=[1 1;0 0];
idm = [0 0;1 1];


%Obs = ------

% Create state-space model
sys = ss(A, B, C, D);
%step(sys);

% Display state-space matrices
%disp('State-space matrices:');
%disp('A = ');
%disp(A);
%disp('B = ');
%disp(B);
%disp('C = ');
%disp(C);
%disp('D = ');
%disp(D);

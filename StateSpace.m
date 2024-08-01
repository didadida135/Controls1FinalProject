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

%Matrix Gains
Kiqe=[0,-1;0,0];
Kiqm=[0,0;0,-Rs/Lq];

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
Kdu = 1; %Find poles and gain values for feedback values
Kqu = 1; %Find poles and gain values for feedback values


%Temp Parameters
Td=Ld/Rs;
Tq=Lq/Rs;
a=1/Ld;
b=1/Lq;
c=1/Td;
d=1/Tq;


% Define linearized state-space matrices
A = [0, -1; 0, -Rs/Lq]; % *K matrix
B = [0;1/Lq]; % + reference input
C = [0 1]; % Output iq states
%Also double check C (should be outputting 
D = [1]; % iq ref feedthrough
%Double check D matrix, right now its outputting total Iq error due to
%matrix dimension constraints

% E how do we add this one?
%E = [0;Flux/Lq]; 

%Controller Matrix
wmM= [0,1;
    1,0]; % *w_m

iM=ones(3);


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

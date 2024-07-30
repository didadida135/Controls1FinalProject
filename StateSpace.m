clear

% Define symbolic variables and parameters
Lq = 0.000795; %H
Ld = Lq; %H
Rs= 0.05; % Ohm
Flux = 0.192;  %Wb
p = 4;
vdc=560;

%Calculating Gains
fsw=5000;
Kpq=(Lq*2*pi*fsw)/10;
Kpd=(Ld*2*pi*fsw)/10;
Kiq=Kpd*(Rs/Lq);
Kid=Kpd*(Rs/Ld);
Ksq=Kiq;
Ksd=Kid;


% Define linearized state-space matrices
A = [-Rs/Ld, Lq/Ld;
    -Ld/Lq, -Rs/Lq]; % *K matrix
    
B = [1/Ld, 0;
     0, 1/Lq];

% E how do we add this one?
E = [0;      % *wm
    Flux/Lq]; 

% Assuming Psi_f is linearly approximated or given as a constant
C = eye(2); % Output all states
D = zeros(2,2); % No direct feedthrough from inputs to outputs

%Controller Matrix
K= [0,1;
    1,0]; % *w_m

%Obs = ------

% Create state-space model
sys = ss(A, B, C, D);
step(sys);

% Display state-space matrices
disp('State-space matrices:');
disp('A = ');
disp(A);
disp('B = ');
disp(B);
disp('C = ');
disp(C);
disp('D = ');
disp(D);

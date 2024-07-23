% Define symbolic variables and parameters
syms id iq vd vq real
syms R L Psi_f p real

% Operating point
I_q = 2.0; % Example operating current in q-axis
omega_m0 = 100; % Example operating mechanical speed

% Define linearized state-space matrices
A = [-R/L, -omega_m0;omega_m0, -R/L];

B = [1/L, 0;
     0, 1/L];

% Assuming Psi_f is linearly approximated or given as a constant
C = eye(2); % Output all states
D = zeros(2,2); % No direct feedthrough from inputs to outputs

% Create state-space model
sys = ss(A, B, C, D);

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

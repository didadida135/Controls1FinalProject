A = [0 1; -100 -5];
C = [1 0; 0 0]';
desired_poles = [-800 + 600i, -800 - 600i];
L = place(A', C', desired_poles)';

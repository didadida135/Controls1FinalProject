import control as ctrl
import matplotlib.pyplot as plt

%Plant transfer function, example G(s) = 1 / (s^2 + s + 1)
G = ctrl.tf([1], [1, 1, 1])

%PI controller parameters
K = 1
T_i = 1  %# Choose T_i based on desired performance
C1 = ctrl.tf([K*T_i, K], [T_i, 0])

%Open-loop transfer function
L = C1 * G

%# Bode plot to find crossover frequency
mag, phase, omega = ctrl.bode(L, dB=True)

%# Closed-loop transfer function
T = ctrl.feedback(L, 1)

%# Step response
t, y = ctrl.step_response(T)
plt.figure()
plt.plot(t, y)
plt.title('Step Response')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.grid()
plt.show()

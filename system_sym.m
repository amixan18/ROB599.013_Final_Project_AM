function [yp,u] = system_sym(t,y)

% Mass-Spring-Damper
b = 1;%10
beta = 0.5;%8/3
k = 15;%28
alpha = 10;
m = 5;
sp = 3;


beta_zero = 1.5;
epsilon = 0.1;
delta_max = 10;

omega = y(1) + y(2);
sigmoid = omega / (abs(omega)+epsilon);

fb = (-b*y(2) - beta*y(2)^3 - k*(y(1)+sp)- alpha*(y(1)+sp)^3)/m;
a = fb + y(2);
g = 1/m;

%No feedback, no disturbance
% yp = [y(2); fb];

%Feedback without disturbance
% v = -beta_zero * sigmoid;
% u = -a/g + v;
% yp = [y(2); fb + g*u];

%Feedback with disturbance
delta = delta_max*(rand()*2-1);%Random
% delta = delta_max*(sin(3*t));%Sine
ro = delta_max/g;
% v = -beta_zero * sigmoid;%Previous
v = -(ro+beta_zero) * sigmoid;%Updated
u = -a/g + v;
yp = [y(2); fb + g*u + delta];


clc
clear all
close all

t_span = [0 30];
y0 = [-5; 0];
[t,y] = ode23(@system_sym,t_span,y0);

for k = 1:numel(t)
    [yp,u(k)] = system_sym(t(k),y(k,:).');
end

figure
plot(t,y(:,1))
title('Mass Position')
ylabel('Position(m)') 
xlabel('Time(s)') 
grid on;
figure
plot(t,y(:,2))
title('Mass Velocity')
ylabel('Velocity(m/s)') 
xlabel('Time(s)') 
grid on;
figure
plot(t,u)
title('Input Force')
ylabel('Force(N)') 
xlabel('Time(s)') 
grid on;
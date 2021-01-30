clear all;
close all;

global C

addpath ../geom2d/geom2d
C.q_0 = 1.60217653e-19;
C.hb = 1.054571596e-34; % Dirac constant
C.h = C.hb * 2 * pi; % Planck constant
C.m_0 = 9.10938215e-31;% electron mass
C.kb = 1.3806504e-23; % Boltzmann constant
C.eps_0 = 8.854187817e-12; % vacuum permittivity
C.mu_0 = 1.2566370614e-6;% vacuum permeability
C.c = 299792458; % speed of light
C.g = 9.80665; %metres (32.1740 ft) per s²

nTime = 200; %number of steps
dt = 1;
force = 1;
Velocity = 0;
m = 1;
avev = 0;
n=0;
x = 0;
Ps = 0.05;
% Ps = 1-exp(-dt/20)
driftV = 0;
t=0;

%calculated acceleration due to force
for i = 2:nTime
    if(rand(1)<=Ps)
        Velocity(i) = 0;%starting v
    else 
        Velocity(i) = Velocity(i-1) + ((C.q_0*force)/C.m_0)*dt;%calculating v
    end
        
    driftV(i) = mean(Velocity);  %drift calculation
    x(i) = x(i-1) + Velocity(i-1)*dt;
    t(i) = t(i-1) + dt; %time array

    subplot(3,1,1)
    hold on
    plot(t,Velocity,'b')
    plot(t,driftV,'go')
    title(sprintf('V vs time. Average =%0.5f ',driftV(i)));

    subplot(3,1,2)
    hold on
    plot(x,Velocity,'r')
    plot(x,driftV,'go')
    

    subplot(3,1,3)
    hold on
    plot(t,x)
    
    pause(0.001)
    
end
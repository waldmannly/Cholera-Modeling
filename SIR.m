%% SIR MODEL from MAA 
%% 
clc

% type RKStage5.m 

format compact
format long

% estimation with stage 5 Runge Kutta method

% s= y(1) = susectible 
% i= y(2) = infection
% r= y(2) = immune

initialPop = 10900000; %10.9 million  
initialLevelofInfection = 8400; 
initialImmune = 0 ; 
b= 1/3; %infecting contact period (one contact every 3 days) 
k= 1/7; % average period of infectiousness is about 7 days 
sknot =  (initialPop)/ (initialPop + initialImmune); 
iknot = initialLevelofInfection/(initialPop+initialImmune) ;
rknot = initialImmune/ (initialPop + initialImmune);
time = 150;


timex = [0:1:time];

out = RKStage5( @(Y) [-b*Y(1)*Y(2), b*Y(1)*Y(2)-k*Y(2), k*Y(2)], [sknot, iknot, rknot], 1, time, 1);  

totalPopArr = ones(time+1 , 1); 
percentofpeoplethatdie = .60; 
totalPopArr = totalPopArr - percentofpeoplethatdie*out(:,3) ; 

hold on
a1 = plot(timex,out(:,1),'m');
M1 = 'susceptible fraction of pop';

a2 = plot(timex, out(:,2), 'r');
M2 = 'infected fraction of pop   ';

a3 = plot(timex, percentofpeoplethatdie*out(:,3), 'b');
M3 = 'dead fraction of pop       ';

a4 = plot(timex, totalPopArr, 'g'); 
M4 = 'total fraction of pop left '; 

a5 = plot(timex, (1-percentofpeoplethatdie)*out(:,3), 'y');
M5 = 'immune/recovered fraction  ';

xlabel('Time in Days'),ylabel('Fraction of People'), title('SIR MODEL with scaled variables from Haiti ( 60% deathrate )')
legend([a1; a2; a3; a4; a5], [M1; M2; M3; M4; M5]);
snapnow
hold off
clf


initialPop = 10900000; %10.9 million  
initialLevelofInfection = 8400; 
initialImmune = 0 ; 
b= 1/3; %infecting contact period (one contact every 3 days) 
k= 1/7; % average period of infectiousness is about 7 days 
sknot =  (initialPop)/ (initialPop + initialImmune); 
iknot = initialLevelofInfection/(initialPop+initialImmune) ;
rknot = initialImmune/ (initialPop + initialImmune);
time = 150;



timex = [0:1:time];

out = RKStage5( @(Y) [-b*Y(1)*Y(2), b*Y(1)*Y(2)-k*Y(2), k*Y(2)], [sknot, iknot, rknot], 1, time, 1);  

totalPopArr = ones(time+1 , 1); 
percentofpeoplethatdie = .30; 
totalPopArr = totalPopArr - percentofpeoplethatdie*out(:,3) ; 

hold on
a1 = plot(timex,out(:,1),'m');
M1 = 'susceptible fraction of pop';

a2 = plot(timex, out(:,2), 'r');
M2 = 'infected fraction of pop   ';

a3 = plot(timex, percentofpeoplethatdie*out(:,3), 'b');
M3 = 'dead fraction of pop       ';

a4 = plot(timex, totalPopArr, 'g'); 
M4 = 'total fraction of pop left '; 

a5 = plot(timex, (1-percentofpeoplethatdie)*out(:,3), 'y');
M5 = 'immune/recovered fraction  ';

xlabel('Time in Days'),ylabel('Fraction of People'), title('SIR MODEL with scaled variables from Haiti ( 30% deathrate )')
legend([a1; a2; a3; a4; a5], [M1; M2; M3; M4; M5]);
snapnow

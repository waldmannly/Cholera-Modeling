format long
clear

 time = 1000;           %time in days
 timex = [0:1:time];    %time array
 Narr= [500000;1500000;8000000];%population
%  Narr = [0;0;10000000];
 N = sum(Narr) ; 
 initS = N*.999;     %initial susecptible pop
 initI = N*.001;     %initial infected pop
 initR = N*0;       %initial recovered pop
 initB = 0;   %initial bateria in water




Lambda = .0000638356; %birth rates 
mu= .0000210958;            %mortality rate 
beta = 10^-8;        %human to human transmission rate
epsilon = .0002739726;      %loss of immunity rate
lambda = 10^-8;       %water to human transmission rate
gamma =.2;       %recovery rate
alpha =.0005;        %disease induce mortality
% xi=[3;7;10];             %shedding rate
xi = 7;
delta =.33  ;       %baterial death rate

flist = @(Y) [Lambda*N-mu*Y(1)-beta*Y(1)*Y(2)-lambda*Y(1)*Y(4)+epsilon*Y(3),...
    beta*Y(1)*Y(2)+lambda*Y(1)*Y(4)-(gamma+mu+alpha)*Y(2),...
    gamma*Y(2)-mu*Y(3)-epsilon*Y(3),...
    xi*Y(2)-delta*Y(4)];

init = [initS initI initR initB];
h=1;
steps=time;
freq=1;

out = RKStage5( flist ,init, 1, time, 1);  


hold on
a1 = plot(timex,out(:,1),'m');
M1 = 'susceptible pop';

a2 = plot(timex,out(:,2), 'r');
M2 = 'infected pop   ';

a3 = plot(timex,out(:,3) , 'b');
M3 = 'recovered pop  ';


xlabel('Time in Days'),ylabel('Total People'), title('SIWR GDP STRUCTURED MODEL high')
legend([a1; a2; a3], [M1; M2; M3]);
snapnow
hold off
clf

hold on

a3 = plot(timex,out(:,4) , 'b');
M3 = 'bateria low   ';


xlabel('Time in Days'),ylabel('Total bateria'), title('bateria differences')
legend(a3,  M3);
snapnow
hold off

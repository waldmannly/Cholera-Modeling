%% Codeco MODEL from MAA 
%% 
clc

% S - number of susceptibles
% I - number of infected
% B - concentration of toxigenic V. cholerae in water (cells/ml)
% H - total human population
% n - Human birth and death rates (day-1)
% a - rate of exposure to contaminated water (day-1) 
% K - concentration of V. cholerae in water that yields 50% chance of catching cholera (cells/ml)
% r - rate at which people recover from cholera (day-1) 
% nb- growth rate of V. cholerae in the aquatic environ- ment (day-1)
% mb- loss rate of V. cholerae in the aquatic environment (day-1)
% e - contribution of each infected person to the population of V. cholerae in the aquatic environment (cell/ml day-1 person-1)

H = .9; %10.9 million  
birthrates = 25; %per thousand
deathrates = 8.7; %per thousand
n  = birthrates-deathrates;%birth and death rates (per thousand?) 
%  a  = @(t) .5 +.5*sin((2*pi*t)/365);%rate of exposture to contaminated water
% B  = ;%concentration of toxigenic V. cholerae in water cell
% nb = ;%gowth rate of bacteria in aquatic environment
% mb = ;%loss rate of cholerae in the aquatic environment
% j=1;
%  netnb = @(t) j + j*(sin((2*pi*t)/365)); % netnb + netnb*(sin((2*pi*Y(1))/365))
% r = .2;
% k=1;
%  e  = @(t) k + k*sin((2*pi*t)/365);%the infected persons contribution to spread
K  = 1000;%concentration of cholerae in water that yeild 50% chance
% lambda= @(B) B/(K+B);%concentration of bacteria in water that yields 50% chance  Y(4)/(K+Y(4))
time = 100;
timex = [0:1:time];

%  a  = @(t) .5 +.5*sin((2*pi*count)/365);

% Y(1) = time, Y(2) = S, Y(3) = I, Y(4) =B
% out = RKStage5( @(Y) [Y(1) ,n*(H-Y(2))-(a(Y(1)))*(Y(4)/(K+Y(4)))*Y(4)*Y(2), (Y(4)/(K+Y(4)))*a(Y(1))*Y(4)*Y(2)-r*Y(3), Y(3)*(netnb(Y(1)))+(e(Y(1)))*Y(2)], [0,H, 0, 0], 1, time, 1);  

% out = RKStage5( @(Y) [n*(H-Y(1))-(a)*(Y(3)/(K+Y(3)))*Y(3)*Y(1), (a)*(Y(3)/(K+Y(3)))*Y(3)*Y(1)-r*Y(2), Y(3)*(netnb)+(e)*Y(2)], [H, 0, 0], 1, time, 1); 

% flist = @(Y) [Y(1),n*(H-Y(2))-(a(Y(1)))*(Y(4)/(K+Y(4)))*Y(4)*Y(2), (Y(4)/(K+Y(4)))*a(Y(1))*Y(4)*Y(2)-r*Y(3), Y(3)*(netnb(Y(1)))+(e(Y(1)))*Y(2)];

a =1; 
r =.2; 
nb = 2/3;
mb = 1; 
e = 10; 
SC = 6600; 


% flist = @(Y) [H-r/n*Y(2), (n*(r*K*mb - r*K*nb+a*e*H))/(e*(n+a)*r), (e*Y(2))/(mb-nb)];
flist = @(Y) [n*(H-Y(1))-a*(Y(3)/(Y(3)+K))*Y(1), a*(Y(3)/(Y(3)+K))*Y(1)-r*Y(2), Y(3)*(nb-mb)+e*Y(2)]
init = [H,.1 0];
h=1;
steps=time;
freq=1;

Y=init;
pts=zeros(1+fix(steps/freq),length(init));
pts(1,:)=Y; ic=1;
% j=0;
% k=0; 
% count =0;
for i=1:steps
%     count =count+1; 
%     netnb =  j + j*(sin((2*pi*count)/365)); 
%     e = k + k*sin((2*pi*count)/365);
 
    k1=h*flist(Y);
    k2=h*flist(Y+0.25*k1);
    k3=h*flist(Y+0.5*k2);
    k4=h*flist(Y+1/2*k1 - k2 + 5/4*k3);
    k5=h*flist(Y +2/3*k2+1/3*k4);
    Y=Y+(3*k1+4.0*k2+10*k3+4*k4+3*k5)/24.0;
    if rem(i,freq)==0 ic=ic+1; pts(ic,:)=Y;
    end;
end

out = pts; 

hold on
a1 = plot(timex,out(:,1),'m');
M1 = 'susceptible fraction of pop';

a2 = plot(timex, out(:,2), 'r');
M2 = 'infected fraction of pop   ';

a3 = plot(timex, out(:,3), 'b');
M3 = '3 fraction of pop          ';

% a4 = plot(timex, out(:,4), 'g');
% M4 = '4 fraction of pop          ';



xlabel('Time in Days'),ylabel('Fraction of People'), title('SIR MODEL with scaled variables from Haiti ( 30% deathrate )')
legend([a1; a2; a3], [M1; M2; M3]);
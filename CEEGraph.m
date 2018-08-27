%%6-36 Question 
%% 
years = ones(1,11) * 2000;
adding = [0:10];
years = (years+adding)' ;
netGen = [3802105;3736644;3858452;3883185;3970555;4055423;4064702;4156745;4119388;3950331;4125060];

%% Part a 
emissions = netGen* .68956


years1 = ones(1,51) * 2000;
adding = [0:50];
years1 = (years1+adding)' ;
%% part B and C 
genFit = fit(years, netGen, 'poly1')

emisFit = fit(years, emissions, 'poly1')

hold on
a1 = plot(genFit, years, netGen ,'g');
M1 = 'Net Generation';

a2 = plot(emisFit, years, emissions ,'b');
M2 = 'CO2 emissions ';

xlabel('Year'),ylabel('Net Generation tmWh(g),Metric tons CO2 emited(b)'), title('6-36 B')
legend([a1;a2], [M1;M2]);
snapnow
hold off
clf

fd =ones(1,51) ;
fd=fd';

a3 = plot(genFit,years1,fd ,'g');
legend(a3,M1); 
xlabel('Year'),ylabel('Net Generation from all energy Sources'),title('net gen fit')
snapnow

clf
a3 = plot(emisFit,years1,fd ,'b');
legend(a3,M2); 
xlabel('Year'),ylabel('Metric tons of CO2 emited'),title('emission fit')
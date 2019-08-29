function Run_Hysteresis_y2_MRN_NA_ABMSUH() 

% Regulated mutual repression network with negative autoregulations (MRN-NA)
% Hysteresis Analysis of y(2)

%% Parameter setting
global K k S n

figure
C = {'r','k'};
l = 0;
while l < 1
for a = [7 8] 


% Kinetic parameter settings
k(1) = 100;      % Rate constant of y(1)
k(2) = 1;        % Degradation constant of y(1)

k(3) = 18.1;     % Rate constant of y(2) by y(1)
k(6) = 18.1;     % Rate constant of y(3) by y(1)

k(5) = 0.8;      % Degradation constant of y(2)
k(8) = 0.8;      % Degradation constant of y(3)

k(9) = 4.1;      % Auto-repressor feedback rate of y(3)
k(10)= 4.1;      % Auto-repressor feedback rate of y(2)

K(1) = 9;        % Activator binding constant for y(2):y(1)
K(3) = 9;        % Repressor binding constant for y(3):y(1)

K(2) = 43;       % Repressor binding constant for y(2): y(3)
K(4) = 43;       % Repressor binding constant for y(3):y(2)

K(5) = 9;        % Auto-repressor feedback binding of y(3)
K(6) = 9;        % Auto-repressor feedback binding of y(2)

n(1) = a;        % Hill coefficient
k(7) = 43.1;     % Rate constant of y(3) by y(2)

%% To make the program to fix the steady state level of y(2) and y(3)
% We can estimate the steady state values of y(1), y(2) and y(3).
y1_ss = 0;
y2_ss = 76;
% For negative autoregulations 
y3_ss = ((k(6)*K(3)/(K(3) + y1_ss) + k(7)*hillNA(y2_ss,n(1),K(4)) - k(8)*K(6))..... 
     + ((k(6)*K(3)/(K(3) + y1_ss) + k(7)*hillNA(y2_ss,n(1),K(4)) - k(8)*K(6))^2......... 
     + 4*k(8)*K(6)*(k(6)*K(3)/(K(3) + y1_ss) + k(7)*hillNA(y2_ss,n(1),K(4)) + k(10)))^(1/2))/(2*k(8));

k(4) = (k(5) *y2_ss - k(3)*y1_ss/(y1_ss + K(1)) - k(9)*K(5)/(K(5) + y2_ss) )/ hillNA(y3_ss,n(1),K(2));

%% simulation
inputS = linspace(-6,2,211);
y0 = [0,0,0];
for i = 1:1:211
    S = 10.^inputS(i);
    [T, Y] = ode45(@EQregulatedMRNNA,[0 10],y0);  
    increase(i) = Y(end,2);
    y0 = [Y(end,1), Y(end,2),Y(end,3)];
end

for i = 211:-1:1
    S = 10.^inputS(i);
    [T, Y] = ode45(@EQregulatedMRNNA,[0 10],y0);  
    decrease(i) = Y(end,2);
    y0 = [Y(end,1), Y(end,2),Y(end,3)];
end

%%
l = l + 1;
p = l;

semilogx(10.^inputS, increase,'color',C{p},'linewidth',3);hold on;
semilogx(10.^inputS, decrease,'color',C{p},'linewidth',3);hold on;

end
end

set(gca,'fontname','arial','fontweight','bold','fontsize',12,'linewidth',2,'Ylim', [0, 120]);
title('MRN-NA:Hysteresis','FontWeight','bold');
xlabel('Input Signal S','fontname','arial','fontweight','bold','fontsize',12);
ylabel('Output y(2)','fontname','arial','fontweight','bold','fontsize',12);
legend('n=7','n=7','n=8','n=8');
box on;
end
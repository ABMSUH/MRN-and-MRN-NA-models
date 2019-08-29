function Run_Deterministic_MRN_NA_ABMSUH() 
tic

% Regulated mutual repression network with negative autoregulations (MRN-NA)
% Deterministic Memory Analysis of y(2) and y(3)proteins by y(1)

%% Parameter setting
global K k S n

% Initial condition settings
Nvar = 3;        % Number of variables
y(Nvar,1) = 0;
Tend = 1000;

figure
C = {'b','m'};
l = 0;
while l < 2 
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

%%
time = 0:0.1:Tend;
S = getStepInputMRNNA(time);

%% Simulation
y0 = odeset('RelTol',1e-4,'AbsTol',1e-4);
[T,Y] = ode45(@EQregulatedMRNNA,[0 Tend],y',y0);

%%
l = l + 1;
p = l;
subplot(4,1,1);
plot(time, S, 'g-','linewidth',2);hold on;
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 1.2], 'Ytick',[0 1]);
ylabel('Input signal','fontname','arial','fontsize',15);
title('MRN-NA:Deterministic','FontWeight','bold');
box on;
    
subplot(4,1,2);
plot(T, Y(:,1), 'b-','linewidth',2);hold on;
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 140], 'Ytick',[20 76 120]);
ylabel('y(1)','fontname','arial','fontsize',15);
box on;

subplot(4,1,3);
plot(T, Y(:,2) ,'color',C{p},'linewidth',2);hold on;
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 140], 'Ytick',[20 76 120]);
ylabel('y(2)','fontname','arial','fontsize',15);
legend('n = 7','n = 8');
box on;
    
subplot(4,1,4);
plot(T, Y(:,3) ,'color',C{p},'linewidth',2);hold on;
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 140], 'Ytick',[20  76 120]);
xlabel('Time [s]','fontname','arial','fontsize',15);
ylabel('y(3)','fontname','arial','fontsize',15);
box on;

end
end
legend('n = 7','n = 8');
toc
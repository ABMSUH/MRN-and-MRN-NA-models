function Run_Stochastic_MRN_NA_ABMSUH()
tic

% Regulated mutual repression network with negative autoregulations (MRN-NA)
% Stochastic Memory Analysis of y(2) and y(3)proteins by y(1)

%% Parameter setting
global K k n
figure
C = {'b'};
l = 0;
while l < 1 
for a = [7] 

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

% Initial condition settings
x0 = zeros(1,3); % The number of molecules
x0(1) = 1;       % y(1)
x0(2) = 1;       % y(2)
x0(3) = 1;       % y(3)

% Time range settings
tstart = 0;
tend = 1000;
tspan = [tstart tend];

time = 0:0.1:tend;
Signal = getStepInput(time);

%% Simulation
[T,X] = gillespie(@propensity,@changeNum,tspan,x0);

%%
l = l + 1;
p = l;
subplot(411);
plot(time, Signal, 'g-','linewidth',2);hold on;
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 1.2], 'Ytick',[0 1]);
xlabel('Time','fontname','arial','fontsize',15);
ylabel('Input signal','fontname','arial','fontsize',15);
title('MRN-NA:Stochastic','FontWeight','bold');
box on;   

subplot (412)
plot(T,X(:,1),'b','linewidth',1);
xlim(tspan);
xlabel('Time','FontSize',15,'FontName','Arial');
ylabel('y(1)','FontSize',15,'FontName','Arial');
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 140], 'Ytick',[20 76 120]);

subplot (413)
plot(T,X(:,2),'color',C{p},'linewidth',1);
hold on;
xlim(tspan);
xlabel('Time','FontSize',15,'FontName','Arial');
ylabel('y(2)','FontSize',15,'FontName','Arial');
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 140], 'Ytick',[20 76 120]);
legend('n = 7');

subplot (414)
plot(T,X(:,3),'color',C{p},'linewidth',1);
hold on;
xlabel('Time','FontSize',15,'FontName','Arial');
ylabel('y(3)','FontSize',15,'FontName','Arial');
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 140], 'Ytick',[20 76 120]);

end
end
legend('n = 7');
toc

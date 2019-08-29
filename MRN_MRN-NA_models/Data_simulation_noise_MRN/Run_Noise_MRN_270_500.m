function Run_Noise_MRN_270_500() 
tic

% Regulated mutual repression network (MRN)
% Noise Analysis of y(2) and y(3) proteins by y(1)

%% Parameter Setting
global k K n ;

figure
C = {'b','m','b','m','b','m','b','m','b','m','b','m','b','m','b'};
l = 0;
while l < 15
 
 
for a= [42,44,46,48,50,52,54,56,58,60,62,64,66,68,70];   
    
% Kinetic parameter settings
k(1) = 100;     % Rate constant of y(1)
k(2) = 1;       % Degradation constant of y(1)

k(3) = 18.1;    % Rate constant of y(2) by y(1)
k(6) = 18.1;    % Rate constant of y(3) by y(1)

k(5) = 0.8;     % Degradation constant of y(2)
k(8) = 0.8;     % Degradation constant of y(3)
 
K(1) = 9;       % Activator binding constant for y(2):y(1)
K(3) = 9;       % Repressor binding constant for y(3):y(1)

K(2) = a;       % Repressor binding constant for y(2): y(3)
K(4) = a;       % Repressor binding constant for y(3):y(2)

n(1) = 8;       % Hill coefficient
k(7) = 43.1;    % Rate constant of y(3) by y(2)

%% To make the program to fix the steady state level of y(2) and y(3)
% We can estimate the steady state values of y(1), y(2) and y(3).
y1_ss = 0;
y2_ss = 76;
y3_ss = (k(6)*K(3)/(y1_ss + K(3)) + k(7)*hill(y2_ss,n(1),K(4)))/k(8);
k(4) = (k(5) *y2_ss - k(3)*y1_ss/(y1_ss + K(1)) )/ hill(y3_ss,n(1),K(2)); 

% Initial condition settings
x0 = zeros(1,3); 
x0(1) = 1;      % y(1)
x0(2) = 1;      % y(2)
x0(3) = 1;      % y(3)

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
subplot(221);
plot(time, Signal, 'g-','linewidth',2);hold on;
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 1.2], 'Ytick',[0 1]);
xlabel('Time','fontname','arial','fontsize',15);
ylabel('Input signal','fontname','arial','fontsize',15);
box on;   

subplot (222)
plot(T,X(:,1),'b','linewidth',1);
xlim(tspan);
xlabel('Time','FontSize',15,'FontName','Arial');
ylabel('y(1)','FontSize',15,'FontName','Arial');
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 140], 'Ytick',[20 76 120]);

%%
subplot (223)
plot(T,X(:,2),'color',C{p},'linewidth',1);
hold on;
xlim(tspan);
xlabel('Time','FontSize',15,'FontName','Arial');
ylabel('y(2)','FontSize',15,'FontName','Arial');
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 140], 'Ytick',[20 76 120]);

H = X(:,2);
vv=H(find(270 < T & T < 550));
M2 = mean(vv)
S2 = std(vv)
CV2 = std(vv)./mean(vv)


subplot (224)
plot(T,X(:,3),'color',C{p},'linewidth',1);
hold on;
xlabel('Time','FontSize',15,'FontName','Arial');
ylabel('y(3)','FontSize',15,'FontName','Arial');
set(gca,'fontname','arial','fontsize',15,'linewidth',2,'XLim',[0 1000],'Xtick',[0 250 500 750 950],'Ylim', [0, 140], 'Ytick',[20 76 120]);

H = X(:,3);
vv=H(find(270 < T & T < 500));
M3 = mean(vv)
S3 = std(vv)
CV3 = std(vv)./mean(vv)

end
end

toc
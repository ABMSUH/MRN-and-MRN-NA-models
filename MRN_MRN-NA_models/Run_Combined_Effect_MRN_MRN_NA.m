function Run_Combined_Effect_MRN_MRN_NA() 
tic
% Data from stochastic and deterministic simulation
% MRN

x1_MRN = [4 5 6 7 8 9 10 11 12 12 11 10 9 8 7 6 5 4];% for deterministic memory
y1_MRN = [37.5 33 32 31 40 44 46 48 49 84 84 83 82 81 81 78 73 61.5];

x2_MRN = [8 9 10 11 12 12 11 10 9 8];% for stochastic memory
y2_MRN = [41 44 46 48 49 54.1 53.1 51.2 48 45];

% MRN_NA
x1_MRN_NA = [4 5 6 7 8 9 10 11 12 12 11 10 9 8 7 6 5 4]; % for deterministic memory
y1_MRN_NA = [36.5 32.6 31.7 30 39.5 44 46 48 49 84.3 84.3 83.4 82.4 82 81.4 79 74 62];

x2_MRN_NA = [7 8 9 10 11 12 12 11 10 9 8 7];% for stochastic memory
y2_MRN_NA = [35 41 44 46 48 49 57.7 55.7 54.6 52 50 40];

figure;

h = fill(x1_MRN,y1_MRN,'m');
set(h,'facealpha',0.9)
hold on;

hh = fill(x2_MRN,y2_MRN,'y');
set(hh,'facealpha',0.9)
hold on;

g = fill(x1_MRN_NA,y1_MRN_NA,'g');
set(g,'facealpha',0.4)
hold on;
gg = fill(x2_MRN_NA,y2_MRN_NA,'r');
set(gg,'facealpha',0.4)
hold off;

xlabel('Hill (n)','FontSize',12,'FontName','Arial');
ylabel('Disssociation constant K(2)=K(4)','FontSize',12,'FontName','Arial');
set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [1, 12],'Xtick',[1 2 3 4 5 6 7 8 9 10 11 12],'Ylim', [0, 90], 'Ytick',[0 10 20 30 40 50 60 70 80 90]);
title('Combined Effect of MRN and MRN-NA model','fontname','arial','fontweight','bold','fontsize',12);
legend('MRN:Deterministic Memory','MRN:Stochastic Memory','MRN-NA:Deterministic Memory','MRN-NAStochastic Memory');
toc


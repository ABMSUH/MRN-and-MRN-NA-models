function Run_Combined_Effect_MRN_MRN_NA_model_double_well_depth_2() 
tic
% here consider depth untill>=2 and neglect=0.9 : sometimes >5

% For double well
% Fokker_Planck from Chemical Lengevin equation
% Combined Effect of MRN, and MRN-NA models on Memory of y(2) and y(3)proteins by y(1)

% for MRN
x1 = [3 4 5 6 7 8 9 10 11 12 12 11 10 9 8 7 6 5 4 3];% for y2
y1 = [11 10 10 10 9 9 9 8 8 8 42 42 40 38 37 35 33 30.5 29 27];

x2 = [3 4 5 6 7 8 9 10 11 12 12 11 10 9 8 7 6 5 4 3];% for y3
y2 = [16 14 13 13 25 30 31 32 32 32 55 54 54 53 52 50 46 41 35 29];

% for MRN-NA
x3 = [3 4 5 6 7 8 9 10 11 12 12 11 10 9 8 7 6 5 4 3];% for y2
y3 = [8 8 8 8 7 7 7 6 5 5 46 46 45 43 42 40 39 37.5 34 33];

x4 = [3 4 5 6 7 8 9 10 11 12 12 11 10 9 8 7 6 5 4 3];% for y3
y4 = [14 12 10 10 20 28 29 30 30 31 61 59.5 59 58 56 54 50 46 40 29];

figure

hh = fill(x3,y3,'b');
set(hh,'facealpha',0.4)
hold on;
h = fill(x1,y1,'r');
set(h,'facealpha',0.4)
hold on;

%fill(x2,y2,'b')
%hold on;
%fill(x3,y3,'r')
%hold off;
xlabel('Hill coefficient(n)','FontSize',12,'FontName','Arial');
ylabel('Dissociation constant (K(2)=K(4))','FontSize',12,'FontName','Arial');
set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [1, 12],'Xtick',[1 2 3 4 5 6 7 8 9 10 11 12],'Ylim', [0, 90], 'Ytick',[0 30  60 90]);
legend('MRN:y(2)','MRN-NA:y(2)');

figure
gg = fill(x4,y4,'b');
set(gg,'facealpha',0.4)
hold on;

g = fill(x2,y2,'r');
set(g,'facealpha',0.4)
hold on;

%fill(x2,y2,'b')
%hold on;
%fill(x3,y3,'r')
%hold off;
xlabel('Hill coefficient(n)','FontSize',12,'FontName','Arial');
ylabel('Dissociation constant (K(2)=K(4))','FontSize',12,'FontName','Arial');
set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [1, 12],'Xtick',[1 2 3 4 5 6 7 8 9 10 11 12],'Ylim', [0, 90], 'Ytick',[0  30  60  90]);
%title('MRN model for depth>=1','fontname','arial','fontweight','bold','fontsize',12);
legend('MRN:y(3)','MRN-NA:y(3)');

%figure
%fill(x3,y3,'b')
%hold on;
%fill(x2,y2,'b')
%hold on;
%fill(x3,y3,'r')
%hold off;
%xlabel('Hill coefficient(n)','FontSize',12,'FontName','Arial');
%ylabel('Dissociation constant (K(2)=K(4))','FontSize',12,'FontName','Arial');
%set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [1, 12],'Xtick',[1 2 3 4 5 6 7 8 9 10 11 12],'Ylim', [0, 90], 'Ytick',[0 30  60 90]);
%title('MRN model for depth>=1','fontname','arial','fontweight','bold','fontsize',12);
%legend('MRN:y(2)');

%figure
%fill(x4,y4,'b')
%hold on;
%fill(x2,y2,'b')
%hold on;
%fill(x3,y3,'r')
%hold off;
%xlabel('Hill coefficient(n)','FontSize',12,'FontName','Arial');
%ylabel('Dissociation constant (K(2)=K(4))','FontSize',12,'FontName','Arial');
%set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [1, 12],'Xtick',[1 2 3 4 5 6 7 8 9 10 11 12],'Ylim', [0, 90], 'Ytick',[0  30  60  90]);
%title('MRN model for depth>=1','fontname','arial','fontweight','bold','fontsize',12);
%legend('MRN:y(3)');

toc
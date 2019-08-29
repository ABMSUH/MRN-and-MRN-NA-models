function Figure_MFPT_MRN_MRN_NA_for_n_increases
% fing the MFPT of MRN and MRN-NA model
% MFPT : Fokker-Planck from chemical Langevin

% MRN : when K(2)=K(4)=15
a = [3 4 6 8 10 12]; % value of n
M_lower_Y2 = [3.18 6.47 8.75 9.53 10.21 10.68];
M_upper_Y2 = [3.66 4.02 4.85 5.36 5.95 6.54];

% when K(2)=K(4)=49
b = [3 4 6 8 10 12];
M_lower_Y3 = [1.14 1.0 1.21 1.39 1.48 1.53];
M_upper_Y3 = [2.05 4.06 5.24 5.47 5.51 6.1];

% MRN-NA : when K(2)=K(4)=15
c = [3 4 6 8 10 12]; % value of n
M_lower_Y22 = [3.4 7.37 9.35 10.13 11.17 11.4];
M_upper_Y22 = [4.1 5.02 5.85 6.36 6.95 7.54];

% when K(2)=K(4)=49
d = [3 4 6 8 10 12];
M_lower_Y33 = [1.4 1.6 1.7 1.9 2.0 2.1];
M_upper_Y33 = [3.05 5.06 6.24 6.47 6.51 7.1];


%%
figure
plot(a,M_lower_Y2,'LineStyle','-','color','r','linewidth',3.5);hold on;
plot(a,M_upper_Y2,'LineStyle','-','color','g','linewidth',3.5);hold on;

plot(b,M_lower_Y3,'LineStyle','-','color','b','linewidth',3.5);hold on;
plot(b,M_upper_Y3,'LineStyle','-','color','k','linewidth',3.5);hold on;

plot(c,M_lower_Y22,'LineStyle',':','color','r','linewidth',3.5);hold on;
plot(c,M_upper_Y22,'LineStyle',':','color','g','linewidth',3.5);hold on;

plot(d,M_lower_Y33,'LineStyle',':','color','b','linewidth',3.5);hold on;
plot(d,M_upper_Y33,'LineStyle',':','color','k','linewidth',3.5);hold on;
title('MRN and MRN-NA model');
ylabel('log10(MFPT)','fontname','arial','fontweight','normal','fontsize',12);
xlabel('Hill (n)','fontname','arial','fontweight','normal','fontsize',12);
set(gca,'fontname','arial','fontsize',12,'linewidth',1.8,'XLim',[2 12],'Xtick',[2 3 4 5 6 7 8 9 10 11 12],'Ylim', [0, 15], 'Ytick',[0 5 10 15]);
legend('MRN:T_L[y(2)]','MRN:T_U[y(2)]','MRN:T_L[y(3)]','MRN:T_U[y(3)]','MRN-NA:T_L[y(2)]','MRN-NA:T_U[y(2)]','MRN-NA:T_L[y(3)]','MRN-NA:T_U[y(3)]',0)

end
function Figure_MFPT_MRN_MRN_NA_y3_y2_SAME_value_n
% fing the MFPT of MRN and MRN-NA model
% MFPT : Fokker-Planck from chemical Langevin

%M_lower_Y33 = [];
%M_upper_Y33 = [];

%For MRN n=3
a = [20 25 30 35 40];
M_lower_Y2 = [3.93 3.5 3.71 3.1 2.45];
M_upper_Y2 = [2.45 1.87 1.57 1.38 1.27];

b = [20 25 30 35 40];
M_lower_Y3 = [1.24 1.14 1.3 1.12 1.11];
M_upper_Y3 = [3.32 3.05 2.57 2.05 1.57];

%For MRN-NA n=3
c = [20 25 30 35 40];
M_lower_Y22 = [4.43 4 4.21 3.6 2.95];
M_upper_Y22 = [3.25 2.67 2.37 2.18 2.07];


d = [20 25 30 35 40];
M_lower_Y33 = [1.74 1.64 1.8 1.62 1.61];
M_upper_Y33 = [4.12 3.83 3.33 2.83 2.35];


figure
plot(a,M_lower_Y2,'LineStyle','-','color','r','linewidth',3);hold on;
plot(a,M_upper_Y2,'LineStyle','-','color','g','linewidth',3);hold on;

plot(b,M_lower_Y3,'LineStyle','-','color','b','linewidth',3);hold on;
plot(b,M_upper_Y3,'LineStyle','-','color','k','linewidth',3);hold on;

plot(c,M_lower_Y22,'LineStyle',':','color','r','linewidth',3);hold on;
plot(c,M_upper_Y22,'LineStyle',':','color','g','linewidth',3);hold on;

plot(d,M_lower_Y33,'LineStyle',':','color','b','linewidth',3);hold on;
plot(d,M_upper_Y33,'LineStyle',':','color','k','linewidth',3);hold on;
title('MAN:n=3 and MRN:n=3');
ylabel('log10(MFPT)','fontname','arial','fontweight','normal','fontsize',12);
xlabel('Dissociation constants(K(2)=K(4))','fontname','arial','fontweight','normal','fontsize',12);
set(gca,'fontname','arial','fontsize',12,'linewidth',1.8,'XLim',[20 40],'Xtick',[20 25 30 35 40],'Ylim', [0, 15], 'Ytick',[0 5 10 15]);
legend('MRN:T_L[y(2)]','MRN:T_U[y(2)]','MRN:T_L[y(3)]','MRN:T_U[y(3)]','MRN-NA:T_L[y(2)]','MRN-NA:T_U[y(2)]','MRN-NA:T_L[y(3)]','MRN-NA:T_U[y(3)]',0)

end
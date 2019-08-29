function Figure_MFPT_MRN_NA_y3_y2_k9_k10
% fing the MFPT of MRN-NA model when k(9)=k(10) as a functions
% MFPT : Fokker-Planck from chemical Langevin

%For k(9)=k(10)

a = [1 2 3 4 5];
M_lower_Y2 = [2.98 3.5 3.7 4.3 4.5];
M_upper_Y2 = [2.01 2.4 2.6 3.2 3.4];

b = [1 2 3 4 5];
M_lower_Y3 = [0.7 0.9 1.1 1.3 1.5];
M_upper_Y3 = [1.02 1.4 1.5 1.7 1.9];


figure

plot(a,M_lower_Y2,'LineStyle',':','color','r','linewidth',3);hold on;
plot(a,M_upper_Y2,'LineStyle',':','color','g','linewidth',3);hold on;

plot(b,M_lower_Y3,'LineStyle',':','color','b','linewidth',3);hold on;
plot(b,M_upper_Y3,'LineStyle',':','color','k','linewidth',3);hold on;

ylabel('log10(MFPT)','fontname','arial','fontweight','normal','fontsize',12);
xlabel('Negative autoregulation constants(k(9)=k(10))','fontname','arial','fontweight','normal','fontsize',12);
set(gca,'fontname','arial','fontsize',12,'linewidth',1.8,'XLim',[1 5],'Xtick',[1 2 3 4 5],'Ylim', [0, 10], 'Ytick',[0 5 10 15]);
legend('MRN-NA:T_L[y(2)]','MRN-NA:T_U[y(2)]','MRN-NA:T_L[y(3)]','MRN-NA:T_U[y(3)]')

end
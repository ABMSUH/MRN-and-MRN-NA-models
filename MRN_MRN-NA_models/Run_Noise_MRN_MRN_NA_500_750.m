
function Run_Noise_MRN_MRN_NA_500_750() 
tic


% Data for K(2)= K(4)= 42 to 70 and n=8

K = 42:2:70;% for K(2)=K(4)


% MRN: Time for 500 to 750

CV2 = [1.4 1.42 1.41 1.42 1.35 1.37 1.21 1.2 1.19 0.97 0.93 0.77 0.68 0.60 0.58 ]; % for y(2)

CV3 = [0.60 0.61 0.55 0.51 0.49 0.44 0.37 0.35 0.32 0.31 0.23 0.23 0.26 0.22 0.23 ];% for y(3)


% MRN-NA % Time for 500 to 750

NACV2 = [1.2 1.19 1.16 1.17 1.1 1.03 1.07 1.04 1.02 0.9 0.79 0.65 0.60 0.53 0.52 ]; % for y(2)

NACV3 = [0.41 0.40 0.38 0.37 0.37 0.34 0.30 0.22 0.25 0.23 0.17 0.16 0.18 0.15 0.16];% for y(3)

figure;
% MRN
plot(K,CV2,'marker','*','color','m','linewidth',2)
hold on;
plot(K,CV3,'marker','*','color','r','linewidth',2)
hold on
%MRN-NA
plot(K,NACV2,'marker','*','color','c','linewidth',2)
hold on;
plot(K,NACV3,'marker','*','color','k','linewidth',2)

hold off;
xlabel('Dissociation constant K(2)=K(4)','FontSize',12,'FontName','Arial');
ylabel('Noise (CV)','FontSize',12,'FontName','Arial');
set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [42, 70],'Xtick',[42 48 56 62 70],'Ylim', [0, 1.5], 'Ytick',[0 0.5 1 1.5]);
title('Coefficient of Variation [CV]: 500~750','fontname','arial','fontweight','bold','fontsize',12);
legend('y(2)-MRN','y(3)-MRN','y(2)-MRN-NA','y(3)-MRN-NA');
toc
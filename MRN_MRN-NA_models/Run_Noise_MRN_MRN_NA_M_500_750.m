
function Run_Noise_MRN_MRN_NA_M_500_750() 
tic

% Mutual MRN and MRN-NA
% Data for K(2)=K(4)=42 to 70 and n=8

K = 42:2:70;% for K(2)=K(4)

% MRN: Time for 500 to 750


M2 = [79.18 77.80 78.48 75.64 75.95 70.96 74.80 70.96 73.81 69.22 69.07 64.42 66.37 62.72 60.84]; % for y(2)

M3 = [33.73 35.05 34.09 32.60 30.43 29.53 31.93 32.86 29.16 32.32 28.50 27.77 25.74 23.82 22.14];% for y(3)


% MRN-NA : Time for 500 to 750

NAM2 = [73.50 71.09 70.09 72.24 67.30 66.33 70.11 65.85 68.87 66.57 65.94 61.92 61.89 57.71 56.61]; % for y(2)

NAM3 = [29.74 29.67 30.13 27.67 26.98 24.64 25.68 28.82 24.14 20.46 22.42 23.00 22.92 19.47 17.16];% for y(3)


figure;
% MRN
plot(K,M2,'marker','*','color','r','linewidth',2)
hold on;
plot(K,M3,'marker','*','color','m','linewidth',2)
hold on
%MRN-NA
plot(K,NAM2,'marker','*','color','k','linewidth',2)
hold on;
plot(K,NAM3,'marker','*','color','c','linewidth',2)

hold off;
xlabel('Dissociation constant K(2)=K(4)','FontSize',12,'FontName','Arial');
ylabel('Mean','FontSize',12,'FontName','Arial');
set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [42, 70],'Xtick',[42 48 56 62 70],'Ylim', [0, 100], 'Ytick',[0 20 40 60 80 100]);
title('Mean: 500~750','fontname','arial','fontweight','bold','fontsize',12);
legend('y(2)-MRN','y(3)-MRN','y(2)-MRN-NA','y(3)-MRN-NA');
toc
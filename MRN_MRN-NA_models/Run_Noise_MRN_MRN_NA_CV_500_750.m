
function Run_Noise_MRN_MRN_NA_CV_500_750() 
tic

% Mutual MRN and MRN-NA
% Data for K(2)=K(4)=42 to 70 and n=8

K = 42:2:70;% for K(2)=K(4)



% MRN: Time for 500 to 750


My2 = [79.18 77.80 78.48 75.64 75.95 70.96 74.80 70.96 73.81 69.22 69.07 64.42 66.37 62.72 60.84]; % for y(2)

My3 = [33.73 35.05 34.09 32.60 30.43 29.53 31.93 32.86 29.16 32.32 28.50 27.77 25.74 23.82 22.14];% for y(3)


% MRN-NA % Time for 500 to 750

NAMy2 = [73.50 71.09 70.09 72.24 67.30 66.33 70.11 65.85 68.87 66.57 65.94 61.92 61.89 57.71 56.61]; % for y(2)

NAMy3 = [29.74 29.67 30.13 27.67 26.98 24.64 25.68 28.82 24.14 20.46 22.42 23.00 22.92 19.47 17.16];% for y(3)


% MRN: Time for 500 to 750

STDy2 = [38.73 33.05 30.9 31.60 25.43 22.53 21.93 22.86 19.16 21.32 18.50 17.77 16.01 14.2 12.14]; % for y(2)

STDy3 = [42.3 44.5 39.9 40.0 33.3 34.3 29.3 30.6 25.6 23.2 21.0 19.7 20.4 18.1 14.4]; % for y(2)


% MRN-NA % Time for 500 to 750

NASTDy2 = [22.74 21.67 20.13 17.67 16.98 14.64 15.68 11.82 13.14 12.46 12.42 13.00 12.92 9.47 9.16];   % for y(2)

NASTDy3 = [34.4 33.7 30.1 28.7 24.8 20.4 21.01 21.2 15.9 13.6 14.5 13.50 14.7 11.5 9.6];   % for y(2)


CV3 = STDy3./My3;
CV2 = STDy2./My2;
NACV3 = NASTDy3./NAMy3;
NACV2 = NASTDy2./NAMy2;


figure;
% MRN
plot(K,CV2,'marker','*','color','r','linewidth',2)
hold on
plot(K,CV3,'marker','*','color','m','linewidth',2)
hold on;

% MRN-NA
plot(K,NACV2,'marker','*','color','k','linewidth',2)
hold on;
plot(K,NACV3,'marker','*','color','c','linewidth',2)
hold off;

xlabel('Dissociation constant K(2)=K(4)','FontSize',12,'FontName','Arial');
ylabel('Noise (CV)','FontSize',12,'FontName','Arial');
set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [42, 70],'Xtick',[42 48 56 62 70],'Ylim', [0, 1.5], 'Ytick',[0 0.5 1 1.5]);
title('Coefficient of Variation [CV]: 500~750','fontname','arial','fontweight','bold','fontsize',12);
legend('y(2)-MRN','y(3)-MRN','y(2)-MRN-NA','y(3)-MRN-NA');
toc
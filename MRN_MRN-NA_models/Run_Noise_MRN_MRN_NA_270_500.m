
function Run_Noise_MRN_MRN_NA_270_500() 
tic

% Data for K(2)=K(4)=42 to 70 and n=8

K = 42:2:70; % for K(2)= K(4)


% MRN: Time for 270 to 500

CV2 = [0.13 0.129 0.128 0.127 0.1126 0.125 0.1124 0.123 0.121 0.121 0.12 0.11 0.11 0.10 0.10]; % for y(2)

CV3 = [0.86 0.74 0.67 0.65 0.64 0.63 0.60 0.63 0.60 0.6 0.62 0.57 0.54 0.56 0.51];% for y(3)


% MRN-NA % Time for 270 to 500

NACV2 = [0.09 0.095 0.08 0.07 0.08 0.07 0.06 0.09 0.08 0.078 0.077 0.07 0.06 0.05 0.049]; % for y(2)

NACV3 = [0.47 0.45 0.46 0.44 0.43 0.4 0.42 0.37 0.36 0.35 0.31 0.30 0.25 0.24 0.23];% for y(3)

figure;
% MRN
plot(K,CV2,'marker','*','color','r','linewidth',2)
hold on;
plot(K,CV3,'marker','*','color','m','linewidth',2)
hold on
%MRN-NA
plot(K,NACV2,'marker','*','color','k','linewidth',2)
hold on;
plot(K,NACV3,'marker','*','color','c','linewidth',2)

hold off;
xlabel('Dissociation constant K(2)=K(4)','FontSize',12,'FontName','Arial');
ylabel('Noise (CV)','FontSize',12,'FontName','Arial');
set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [42, 70],'Xtick',[42 48 56 62 70],'Ylim', [0, 1], 'Ytick',[0 0.3 0.5 0.7 0.9]);
title('Coefficient of Variation [CV]: 270~500','fontname','arial','fontweight','bold','fontsize',12);
legend('y(2)-MRN','y(3)-MRN','y(2)-MRN-NA','y(3)-MRN-NA');
toc
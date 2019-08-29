
function Run_Noise_MRN_MRN_NA_STD_500_750() 
tic

% Mutual MRN and MRN-NA
% Data for K(2)=K(4)=42 to 70 and n=8

K = 42:2:70;% for K(2)=K(4)


% MRN: Time for 500 to 750

STD2 = [38.73 33.05 30.9 31.60 25.43 22.53 21.93 22.86 19.16 21.32 18.50 17.77 16.01 14.2 12.14]; % for y(2)

STD3 = [42.3 44.5 39.9 40.0 33.3 34.3 29.3 30.6 25.6 23.2 21.0 19.7 20.4 18.1 14.4]; % for y(2)



% MRN-NA : Time for 500 to 750

NASTD2 = [22.74 21.67 20.13 17.67 16.98 14.64 15.68 11.82 13.14 12.46 12.42 13.00 12.92 9.47 9.16];   % for y(2)

NASTD3 = [34.4 31.7 30.1 28.7 24.8 20.4 21.01 21.2 15.9 13.6 14.5 13.50 14.7 11.5 9.6];   % for y(2)


figure;
% MRN
plot(K,STD2,'marker','*','color','r','linewidth',2)
hold on
plot(K,STD3,'marker','*','color','m','linewidth',2)
hold on;

%MRN-NA
plot(K,NASTD2,'marker','*','color','k','linewidth',2)
hold on;
plot(K,NASTD3,'marker','*','color','c','linewidth',2)
hold off;
xlabel('Dissociation constant K(2)=K(4)','FontSize',12,'FontName','Arial');
ylabel('STD','FontSize',12,'FontName','Arial');
set(gca,'fontname','arial','fontsize',12,'linewidth',1.5,'Xlim', [42, 70],'Xtick',[42 48 56 62 70],'Ylim', [0, 50], 'Ytick',[0 25 50]);
title('Standard Deviation (STD): 500~750','fontname','arial','fontweight','bold','fontsize',12);
legend('y(2)-MRN','y(3)-MRN','y(2)-MRN-NA','y(3)-MRN-NA');
toc
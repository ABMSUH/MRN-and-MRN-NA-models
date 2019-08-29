function dydt = EQregulatedMRN(t,y)
global K k n  
dydt = zeros(3,1);
S = getStepInput(t);
dydt(1) =k(1)*S - k(2) * y(1);
dydt(2) =k(3)*y(1)/(y(1) + K(1))  + k(4) * K(2)^n(1) / ( K(2)^n(1) + y(3)^n(1) ) - k(5) * y(2);
dydt(3) =k(6)*K(3)/(y(1) + K(3))  + k(7) * K(4)^n(1) / ( K(4)^n(1) + y(2)^n(1) ) - k(8) * y(3);

function a = propensity(t,x)
% x(1) =y(1)
% x(2) =y(2)
% x(3) =y(3)


 global k K n S;
 S = getStepInput(t);

 a(1) = k(1) * S;
 a(2) = k(2) * x(1);
 a(3) = k(3) * ( x(1) / ( K(1) + x(1) ) );
 %a(4) = k(4) * hill(x(3),n,K(2)); % same result found using this function
 a(4) = k(4) * K(2)^n(1) / ( K(2)^n(1) + x(3)^n(1) );
 a(5) = k(5) * x(2);
 a(6) = k(6) * ( K(3) / ( K(3) + x(1) ) );
 %a(7) = k(7) *  hill(x(2),n,K(4));
 a(7) = k(7) * K(4)^n(1) / ( K(4)^n(1) + x(2)^n(1) );
 a(8) = k(8) * x(3);

%v = zeros(1,n_species);
%
%if j == 1
%    v(1) = +1;
%end
%if j == 2
%    v(1) = -1;
%end
%if j == 3
%    v(2) = +1;
%end
%if j == 4
%    v(2) = +1;
%end
%if j == 5
%    v(2) = -1;
%end
%if j == 6
%    v(3) = +1;
%end
%if j == 7
%    v(3) = +1;
%end
%if j == 8
%    v(3) = -1;
%end
end
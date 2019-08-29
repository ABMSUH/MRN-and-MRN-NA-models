function [T,X] = gillespie(propensity,changeNum,tspan,x0)
% Do not change this function!

T(1) = tspan(1);
X(1,:) = x0;
x = x0;

while 1
    if T(length(T)) > tspan(2);
        break;
    end
    [tau, v] = next(propensity,changeNum,T(end),x);
    [n, m] = size(T);
    T(m+1) = T(m) + tau;
    [n, m] = size(X);
    X(n+1,:) = x + v;
    x = x + v;
end

end
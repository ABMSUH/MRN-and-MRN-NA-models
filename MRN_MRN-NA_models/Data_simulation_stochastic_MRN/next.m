function [tau, v] = next(propensity,changeNum,t,x)
% Do not change this function!

a = propensity(t,x);

a0 = sum(a);
tau = log(1/rand)/a0;

if sum(a) == 0
    return;
end

r = rand;
temp = 0;
for j = 1:length(a)
    temp = temp + a(j);
    if temp > r*a0
        break;
    end
end

v = changeNum(j,length(x));

end

function S = getStepInputMRNNA(t)
    S(t>=0 & t < 250)=0;
    S(t>=250 & t < 500)=1;
    S(t>= 500)=0;
end
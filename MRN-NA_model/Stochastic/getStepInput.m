function S = getStepInput(t)
    S(0<=t & t < 250)=0;
    S(250<=t & t < 500)=1;
    S(500<= t)=0;
end
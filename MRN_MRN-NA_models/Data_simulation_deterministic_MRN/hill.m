function y=hill(x,n,ec50)
y=(ec50.^n)./((x.^n)+(ec50.^n));

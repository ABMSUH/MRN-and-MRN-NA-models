function x=hillNA(y,n,ec50)
x=(ec50.^n)./((y.^n)+(ec50.^n));
%Willy Betz
%19 April 2019
%Mech 105

%Simpson's Algorithm
%Intigrational Estimate

function I = simpsons(f,a,b,n)
%  f= anonymous function
%  a= Start of interval
%  b= End of interval
%  n= the number of sub-intervals
  
if numel(f)>1 
    n=numel(f)-1; h=(b-a)/n;
    I= h/3*(f(1)+2*sum(f(3:2:end-2))+4*sum(f(2:2:end))+f(end));
else 
    h=(b-a)/n; xi=a:h:b;
    I= h/3*(f(xi(1))+2*sum(f(xi(3:2:end-2)))+4*sum(f(xi(2:2:end)))+f(xi(end)));
end

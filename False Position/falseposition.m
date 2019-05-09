function [root,fx,ea,iter,rootV,eaV] = falseposition(func,xb,es,maxiter)
if nargin<3||isempty(es), maxiter=0.0001;end
if nargin<4||isempty(maxiter), maxiter=200;end

% Inputs:
% func = the finction being evaluated
% xb = initial guess x bracket = [xL xU], where xL = lower boundary x and xU = upper boundary
% es = the desired relative error (default to 0.0001%)
% maxiter = the number of iteration desired (default to 200)
% Outputs:
% root = the estimated root location
% fx = the function evaluated at the root location
% ea = the approximate relative error(%)
% iter= number of iterations performed
% rootV = x root vector
% eaV = approximate relative error vector

% False Position Method
ea = 1; % initial approximate relative error = 100%
for k = 0:maxiter
    while  es > ea % compares desired versus calculated error
        xL = xb(1); % lower x
        xU = xb(2); % upper x
        fxL = func(xL); % lower f(x)
        fxU = func(xU); % upper f(x)
        root = xU - ((fxU*(xL-xU))/(fxL-fxU)); % x root using false position method
        rootV(k+1) = root; % stores the x root per iteration in a vector
        ea = abs((rootV(k+1) - rootV(k))/rootV(k+1)); % approximate relative error
        eaV(k+1) = ea; % stores the error into a vector
        froot = func(root); % f(x root)
        % evaluate f(x) signs
        if fxL*froot < 0
            xb = [xL root]; % new guess x bracket = [xL xU]
        elseif froot*fxU < 0
            xb = [root xU]; % new guess x bracket = [xL xU]
        end
        
    end
end    
    iter = k; % number of iterations performed
    rootV = rootV(2:end); % readjust x root vector
    eaV = eaV(2:end); % readjust approximate relative error vector
    fx = func;
function [L, U, P] = LU_Factorization(A)
    [m, n] = size(A); L=eye(n); P=eye(n); U=A;
    for t=1:m-1
        pivot=max(abs(U(t:m,t)));
        for i=t:m
            if(abs(U(i,t))==pivot)
                id=i;
                break;
            end
        end
        U([t,id],t:m)=U([id,t],t:m);
        L([t,id],1:t-1)=L([id,t],1:t-1)
        P([t,id],:)=P([id,t],:)
        for i=t+1:m
            L(i,t)=U(i,t)/U(t,t);
            U(i,t:m)=U(i,t:m)-L(i,t)*U(t,t:m)
        end
        pause;
    end
 end
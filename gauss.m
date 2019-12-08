function x=gauss(A,B)

n = size(A, 1);
% List of the input
% A is an nxn matrix
%B is an nx1 vector
% n is the number of linear equations

if det(A)==0
    display('Coefficient Matrix is Singular; system might be inconsistent or have infinite solutions');
end

%PHASE 1: Elimination
for k=1:n-1 % Pivot equation
    %Partial Pivoting
    p = k;
    max = abs(A(k,k));
    for s=k+1:n
        if(abs(A(s,k)) > max)
            max = abs(A(s,k));
            p = s;
        end
    end
    
    if p ~= k
        for ii=1:n
            temp = A(k, ii);
            A(k, ii) = A(p, ii);
            A(p, ii) = temp;
        end
        temp = B(p, 1);
        B(p, 1) = B(k, 1);
        B(k, 1) = temp;
        %A([k p], :) = A([p k], :);  % Swap the two rows
    end
    
    for i=k+1:n % equation in which we want to eliminate xk
        factor = A(i,k)/A(k,k); % A(k,k) is the pivot
        for j=k+1:n
            A(i,j)=A(i,j)-factor*A(k,j); %cancellation of xk
        end
        B(i)=B(i)-factor*B(k); % also apply the subtraction to R.H.S.
    end  % ended elimination of xk 
end
% PHASE 2: Back substitution
x(n)=B(n)/A(n,n);
for i=n-1:-1:1 % Work on equations n-1 to 1
    sum=B(i);
    for j=i+1:n
        sum=sum-A(i,j)*x(j);
    end
    x(i)=sum/A(i,i);
end


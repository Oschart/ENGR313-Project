function [res] = numerical_int( splines,values,x1, x2)
% this function uses the trapizoidal method to calculate the value of the
% integral
    n=length(values);
    flag = 0;
    h = (x2-x1)/n;
    sum =0;
    for i=1:n-1
        x = x1+i*h;
        idx = get_interval(values,x);
        if(idx~=-1)
            spline = splines(idx,:);
            sum = sum +F(spline,x );
        
        else   % handle out of range
            flag=1;
            break;
        end
    
    end
    if(flag==0)
        idx = get_interval(values,x1);
        if(idx~=-1)
            spline = splines(idx,:);
            y1 = F(spline,x1 );

            idx = get_interval(values,x2);
            if(idx~=-1)
            spline = splines(idx,:);
            y2 = F(spline,x2 );

            res = (h/2)*(y1+y2+2*sum);
            else
                flag =1;
            end
        else 
            flag=1;
        end
    
    end
    if(flag==1)
        fprintf("Cannot integrate, will return -1");
        res=-1;
    end

end

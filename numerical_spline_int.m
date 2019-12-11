function [res] = numerical_spline_int( splines,values,x1, x2)
% this function uses the trapizoidal method to calculate the value of the
% integral
    n=100;
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
 16  range_diff.m 
@@ -0,0 +1,16 @@
function [res] = range_diff( splines,values,x1,x2)

    count =1;
    idx1=get_interval(values,x1);
    idx2=get_interval(values,x2);
    if(idx1~=-1 && idx2~=-1)
        for i=x1:0.1:x2
            res(count) = numerical_diff(splines,values,i);
            count = count+1;
        end
    else
        fprintf("Error, Range is not in the table. Will return -1");
        res=-1;
    end
end
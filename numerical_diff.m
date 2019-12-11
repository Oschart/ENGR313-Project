function [res] = numerical_diff(splines,values)
% corner cases:
% if the point is the first in the interval, we should use the forward
% difference
% if it's the last, we should use the backward differnce
    for i=1:length(values)
        flag =0;
        h = 1e-12;
        x1 = values(i)-h;
        x2= values(i)+h;
        n = size(values,2);
        if(values(i)==values(n)) % backward
            idx = get_interval(values,x1);
            if(idx~=-1)
                spline = splines(idx,:);
                y1 = F(spline,x1 );
                idx = get_interval(values,values(i));
                if(idx~=-1)
                    spline = splines(idx,:);
                    y2 = F(spline,values(i) );
                    res(i) = (y2-y1)/(h);
                else
                        flag=1;
                end
            else
               flag=1;
            end

        elseif(values(i)==values(1)) % forward
                idx = get_interval(values,values(i));
                if(idx~=-1)
                    spline = splines(idx,:);
                    y1 = F(spline,values(i) );
                    idx = get_interval(values,x2);
                    if(idx~=-1)
                        spline = splines(idx,:);
                        y2 = F(spline,x2 );
                        res(i) = (y2-y1)/(h);
                    else
                        flag=1;
                    end
                else
                    flag=1;
                end

        else
            idx = get_interval(values,x1); %centered
                if(idx~=-1)
                    spline = splines(idx,:);
                    y1 = F(spline,x1 );
                    idx = get_interval(values,x2);
                    if(idx~=-1)
                        spline = splines(idx,:);
                        y2 = F(spline,x2 );
                        res(i) = (y2-y1)/(2*h);
                    else
                        flag=1;
                    end
                else
                    flag=1;
                end
        end
        if(flag==1)
            fprintf("Cannot differintiate, will return -1");
            res=-1;
        end
    end
end


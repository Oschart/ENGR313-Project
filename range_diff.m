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


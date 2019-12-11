function [v1, v2, neg] = take_input(data_start, data_end)
    while 1
        neg = 1;    % negating intergral in case endpoints are flipped
        prompt1 = 'Insert v1: ';
        v1 = input(prompt1);
        prompt2 = 'Insert v2: ';
        v2 = input(prompt2);
        if v1 > v2
            temp = v1;
            v1 = v2;
            v2 = temp;
            neg = -1;
        end
        if valid_range(v1, v2, data_start, data_end) == 1
            break;
        else
            disp('Ops, inserted range is not within our data set, try again')
        end
    end
end
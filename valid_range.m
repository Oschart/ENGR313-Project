function [valid] = valid_range(v1, v2, data_start, data_end)
    if v1 >= data_start && v1 <= data_end
        valid = 1;
    else
        valid = 0;
    end
end
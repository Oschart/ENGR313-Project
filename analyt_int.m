function [val] = analyt_int(f, x1, x2)
    val = 0;
    pow_x1 = x1;
    pow_x2 = x2;
    for i = 1:length(f)
        diff = f(i)*(pow_x2-pow_x1)/i;
        val = val + diff;
        pow_x1 = pow_x1*x1;
        pow_x2 = pow_x2*x2;
    end
end
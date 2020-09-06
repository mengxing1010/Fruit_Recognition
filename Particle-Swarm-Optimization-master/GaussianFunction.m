function [ fval ] = GaussianFunction( p )
    %variance equals to 1, expect equals to 0
    fval = -1/(2*pi)*exp((-p(1)^2-p(2)^2)/2);
end


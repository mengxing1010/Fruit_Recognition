function [ fval ] = AckleyFunction( p )
    fval = -20*exp(-0.2*sqrt(p(1)^2+p(2)^2)/2)-exp((cos(2*pi*p(1))+cos(2*pi*p(2)))/2);

end


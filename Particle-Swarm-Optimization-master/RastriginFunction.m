function [ fval ] = RastriginFunction( p )
    fval = p(1).^2 - 10*cos(2*pi*p(1)) + p(2).^2 - 10*cos(2*pi*p(2));
end


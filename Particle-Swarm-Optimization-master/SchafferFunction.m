function [ fval ] = SchafferFunction( p )
    fval = (sin(p(1)^2+p(2)^2)^2-0.5)/((1+0.001*(p(1)^2+p(2)^2))^2);

end


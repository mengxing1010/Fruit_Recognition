function [ fval ] = GriewankFunction( p )
    fval = (p(1)^2+p(2)^2)/4000-(cos(p(1))+1)*(cos(p(2)/1.414)+1);

end


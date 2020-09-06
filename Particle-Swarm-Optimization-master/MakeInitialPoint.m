function [ p ] = MakeInitialPoint( window,n )
    p1 = unifrnd(window(2),window(1),n,1);
    p2 = unifrnd(window(4),window(3),n,1);
    p = [p1 p2];

end


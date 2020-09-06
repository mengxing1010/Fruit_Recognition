function entropyValue = calculateEntropy(G)

    entropyValue = 0;
    
    for r = 1:256
        for c = 1:256
            val=0;
            if(G(r,c)~=0)
               val = log2(G(r,c));
            end
            entropyValue = entropyValue + (-1)* G(r,c) * val;

        end
    end


end
function [ optF,optX,history ] = PSO_continious_2D_optimal( func,n,p )
    %func is a function handle
    %window = [xUp,xDown,yUp,yDown];
    %Innitialize the partice

    
    %max iteration
    mIter = 50;
    history = zeros(1,mIter);
    pid = zeros(n,2);
    piv = ones(n,1)*inf;
    pgd = zeros(1,2); %#ok<PREALL>
    pgv = inf;
    V = zeros(n,2);
    value = zeros(n,1);
    
    w = 0;%memory parameter
    
    for i = 1:mIter
        %variable p renew at every iteration
        for j = 1:n
            value(j) = func(p(j,:));
        end
        
        [vGlobalMin,pGloabalMin] = min(value);
        
        %renew the global optimal
        if vGlobalMin < pgv
            pgv = vGlobalMin;
            pgd = p(pGloabalMin,:);
        end
        for j = 1:n
            if value(j) < piv(j)
                piv(j) = value(j);
                pid(j,:) = p(j,:);
            end
        end
        PGD = repmat(pgd,n,1);
        
        %add w as an optimization variable
        Vall = cell(11,1);
        count = 1;
        for w = 0:0.1:1
            V = w*V + (1-w)*rand(n,2).*(pid-p) + (1-w)*rand(n,2).*(PGD-p);
            Vall{count} = V;
            count = count+1;
        end

        for j = 1:1:n
            valTable = zeros(1,11);
            for k = 1:1:11
                vPrime = Vall{k}(j,:);
                pPrime = p(j,:) + vPrime;
                valTable(1,k) = func(pPrime);
            end
            [~,index] = min(valTable);
            p(j,:) = p(j,:)+Vall{index}(j,:);
        end
        history(i) = min(value);
    end
    for i = 1:n
            value(i) = func(p(i,:));
    end
    [optF,optX] = min(value);
    optX = p(optX,:);
end


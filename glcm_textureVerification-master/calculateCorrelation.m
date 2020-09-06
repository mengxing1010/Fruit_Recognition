function correlationValue=calculateCorrelation(G)
C=0;
for r = 1:256
    for c= 1:256
        
            deltaX = (r-1)^2*G(r,c)+1; %相关性中σx
            deltaY= (c-1)^2*G(r,c)+1; %相关性中σy
            C = r*c*G(r,c)+C;
       
    end
   correlationValue = (C-1*1)/deltaX/deltaY; %相关性
end
end
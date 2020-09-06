function [G] = glcm(img,O)
    [R,C] = size(img);
    G= zeros(256,256);
    for i=1:R - O(1)
        for j=1:C -O(2)
            newi= i+O(1);
            newj= j+ O(2);
            if(newi<=R & newj <=C) 
                locX= img(i,j);
                locY= img(newi,newj);
                
                if(locX==0)
                    locX=1;
                elseif(locY==0)
                    locY=1;
                end
                G(locX,locY)= G(locX,locY)+1;
            end
                       
        end
    end
end
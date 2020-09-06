clear all;
close all;
clc;

%% Implement the GLCM and Entropy for all the images.
prefix = {'Bark', 'Bush', 'Fabric', 'Floor', 'Flower', 'Food', 'Gravel', 'Hair', 'Marble', 'Metal', 'Paint' };
entropyValues = [ ];
    for i=1:11
        for j=1:9
            fn = sprintf ( '%s.%d.png', prefix{i}, j );
            img = imread(fn);
            
            O= [0 1];
            G= glcm(img,O);
            G= G/sum(G(:));
%             figure,imshow(G,[]);colormap jet;
            entropyValues(i,j)= calculateEntropy(G);
            energyValues(i,j)=calculateEnergy(G);
            correlationValues(i,j)=calculateCorrelation(G);
        end
    end
    

    disp(entropyValues);
    disp(energyValues);
        disp(correlationValues);
  %% Calculate the Accuracy.

numOfHits = 0;
for i = 1: size(entropyValues,1)
    for j=1:size(entropyValues,2)
        checkEntropy = entropyValues(i,j);
        minDiff = checkEntropy ;
        for k=1:size(entropyValues,1)
            for l= 1:size(entropyValues,2)
                    newdiff = abs(entropyValues(k,l)- checkEntropy);
                    
                if(newdiff~=0 & newdiff < minDiff)
                    minDiff= newdiff;
                    classObtained = k;
                end
                
            end
        end
       
        if(classObtained == i)
            numOfHits = numOfHits +1;
        end
    end
end


% disp(classes);
disp(numOfHits);
accuracy = numOfHits/(size(entropyValues,1)*size(entropyValues,2));
accuracy = accuracy * 100;
disp(accuracy);
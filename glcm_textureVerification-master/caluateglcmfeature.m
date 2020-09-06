function [newglcm]=caluateglcmfeature(I)
GLCM2 = graycomatrix(I,'GrayLimits',[],'Offset',[0 1;-1 1;-1 0;-1 -1]);
stats = GLCM_Features1(GLCM2,0)
newstats = struct2cell(stats);
[statsx,statsy] = size(newstats);
newglcm = [];
for i = 1:statsx
    element = [];
    newelement = [];
    glcm = [];
    element = newstats(i,1);
    newelement = element{1,1};
    average = mean(newelement);
    variance = sqrt(cov(newelement));
    glcm = [newelement average variance];
    newglcm = [newglcm glcm];
end
end





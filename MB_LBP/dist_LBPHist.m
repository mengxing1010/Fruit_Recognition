function dist = dist_LBPHist(hist1, hist2)
% compute the Chi square statistic distance between 2 LBP histograms

nLBPFea = 59; % nBin


dist = 0;

for iBin = 1:nLBPFea
    dist = dist + (hist1(iBin) - hist2(iBin))^2 / (hist1(iBin)+hist2(iBin)+eps);
%    id dist
end


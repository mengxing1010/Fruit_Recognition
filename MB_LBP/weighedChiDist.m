function dist = weighedChiDist(LBPFea1, LBPFea2, weight)
% 计算两个 LBP 特征(带有分块)的加权卡方距离

nLBPFea = 59;
nLen = length(LBPFea1);

nBlock = nLen / nLBPFea;

dist = 0;

if nargin < 3
    weight = ones(1, nBlock);
end

for iBlock = 1:nBlock
    % 计算对应块的分块 LBP 直方图距离
    dist = dist + weight(iBlock) * dist_LBPHist( LBPFea1( (iBlock-1)*nLBPFea+1:iBlock*nLBPFea ), LBPFea2( (iBlock-1)*nLBPFea+1:iBlock*nLBPFea ) );
end
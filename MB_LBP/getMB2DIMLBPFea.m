function [vec] = getMB2DIMLBPFea(I, blockSize)
% 计算分区图像 I 的LBP特征,3*3,uniform
% return value: MatLBP --- LBP 响应矩阵
%               histLBP --- 1维行向量，LBP 直方图
%               blockSize --- MBLBP 中的分块大小，默认值为1
%
% 输入：I --- 分区图像
%       blockSize --- 块的大小
%
% 返回值: MatLBP --- LBP 响应矩阵
%        histLBP --- 1维行向量，LBP 直方图
%        MatLBP_MB --- MBLBP 的像素块低分辨率表示

if nargin < 2
    blockSize = 1;
end

% 获得分块图像I的大小
[m n] = size(I);


% 将原始图像依据 blockSize 分块，计算每块的平均灰度值，对应保存在映射矩阵 I_MB 中
mSub = floor(m / blockSize);
nSub = floor(n / blockSize);

mRem = mod(m, blockSize);
nRem = mod(n, blockSize);
mRem = round(mRem / 2);
nRem = round(nRem / 2);

I_MB = zeros(mSub, nSub);

for ii = 1:mSub
    for jj = 1:nSub
        I_center = I( 1+mRem:mRem+mSub*blockSize, 1+nRem:nRem+nSub*blockSize ); % 取中心区域，不够分出整块的留在两个边
        SubRgn = I_center( (ii-1)*blockSize+1 : ii*blockSize, (jj-1)*blockSize+1 : jj*blockSize );
        I_MB(ii, jj) = mean( SubRgn(:) );
    end
end
% 剩下的任务就是对分块矩阵的映射 I_MB 计算 blockSize = 1 的 uniform (8, 2) LBP特征了
rad = 2;
if (mSub <= 2*rad) || (nSub <= 2*rad)
    error('I is too small to compute LBP feature!');
end




MatLBP_MB = zeros(mSub-2*rad, nSub-2*rad);



for ii = 1+rad : mSub-rad
    for jj = 1+rad : nSub-rad
        nCnt = 1;
        
        
        % 计算(8,2)邻域的像素值，不在像素中心的点通过双线性插值获得其值
        nbPT(nCnt) = I_MB(ii, jj-rad);
        nCnt = nCnt + 1;
        
        horInterp1 = I_MB(ii-2, jj-2) + 0.5858*( I_MB(ii-2, jj-1) - I_MB(ii-2, jj-2) ); % 水平方向插值
        horInterp2 = I_MB(ii-1, jj-2) + 0.5858*( I_MB(ii-1, jj-1) - I_MB(ii-1, jj-2) ); % 水平方向插值
        verInterp = horInterp1 + 0.5858*( horInterp2 - horInterp1 ); % 竖直方向插值
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii-2, jj);
        nCnt = nCnt + 1;
        
        horInterp1 = I_MB(ii-2, jj+1) + 0.4142*( I_MB(ii-2, jj+2) - I_MB(ii-2, jj+1) );
        horInterp2 = I_MB(ii-1, jj+1) + 0.4142*( I_MB(ii-1, jj+2) - I_MB(ii-1, jj+1) );
        verInterp = horInterp1 + 0.5858*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii, jj+2);
        nCnt = nCnt + 1;
        
        horInterp1 = I_MB(ii+1, jj+1) + 0.4142*( I_MB(ii+1, jj+2) - I_MB(ii+1, jj+1) );
        horInterp2 = I_MB(ii+2, jj+1) + 0.4142*( I_MB(ii+2, jj+2) - I_MB(ii+2, jj+1) );
        verInterp = horInterp1 + 0.4142*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii+2, jj);
        nCnt = nCnt + 1;
        
        horInterp1 = I_MB(ii+1, jj-2) + 0.5858*( I_MB(ii+1, jj-1) - I_MB(ii+1, jj-2) );
        horInterp2 = I_MB(ii+2, jj-2) + 0.5858*( I_MB(ii+2, jj-1) - I_MB(ii+2, jj-1) );
        verInterp = horInterp1 + 0.4142*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
                
        
        for iCnt = 1:nCnt
            if( nbPT(iCnt) >= I_MB(ii, jj) )
                MatLBP_MB(ii-rad, jj-rad) = MatLBP_MB(ii-rad, jj-rad) + 2^(nCnt-iCnt);
            end
        end
    end
end












nLevel = 4;
d = 2;
G1 = grayMat(MatLBP_MB, nLevel, d, 0, -d, 0); %水平
G2 = grayMat(MatLBP_MB, nLevel, 0, d, 0, -d); %竖直
G3 = grayMat(MatLBP_MB, nLevel, d, -d, -d, d); %+45
G4 = grayMat(MatLBP_MB, nLevel, d, d, -d, -d); %-45
vec = [G1(:); G2(:); G3(:); G4(:)]';


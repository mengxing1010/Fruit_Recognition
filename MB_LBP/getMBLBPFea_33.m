function [histLBP, MatLBP, MatLBP_MB] = getMBLBPFea_33(I, blockSize)
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



% 剩下的任务就是对分块矩阵的映射 I_MB 计算 blockSize = 1 的 uniform 3*3 LBP特征了
rad = 1;
if (mSub <= 2*rad) || (nSub <= 2*rad)
    error('I is too small to compute LBP feature!');
end

MatLBP_MB = zeros(mSub-2*rad, nSub-2*rad);

% 读入 LBP 映射(像素灰度与直方图收集箱索引的映射)
load Mat/LBPMap.mat;

for ii = 1+rad : mSub-rad
    for jj = 1+rad : nSub-rad
        nCnt = 1;
        
        
        % 计算 3*3 邻域的像素值
        nbPT(nCnt) = I_MB(ii-rad, jj-rad);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii-rad, jj);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii-rad, jj+rad);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii, jj+rad);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii+rad, jj+rad);
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I_MB(ii+rad, jj);
        nCnt = nCnt + 1;

        nbPT(nCnt) = I_MB(ii+rad, jj-rad);
        nCnt = nCnt + 1;

        nbPT(nCnt) = I_MB(ii, jj-rad);

                
        
        for iCnt = 1:nCnt
            if( nbPT(iCnt) >= I_MB(ii, jj) )
                MatLBP_MB(ii-rad, jj-rad) = MatLBP_MB(ii-rad, jj-rad) + 2^(nCnt-iCnt);
            end
        end
    end
end

% 还原 MatLBP_MB
MatLBP = zeros(m-2*rad*blockSize, n-2*rad*blockSize);
for ii = 1:mSub-2*rad
    for jj = 1:nSub-2*rad
        MatLBP( mRem+(ii-1)*blockSize+1 : mRem+ii*blockSize, nRem+(jj-1)*blockSize+1 : nRem+jj*blockSize ) = MatLBP_MB(ii, jj);
    end
end


% 计算LBP直方图
histLBP = zeros(1, 59); % 对于(8,2)的uniform直方图共有59个收集箱

for ii = 1:mSub-2*rad
    for jj = 1:nSub-2*rad
        histLBP( vecLBPMap( MatLBP_MB(ii, jj)+1 ) ) = histLBP( vecLBPMap( MatLBP_MB(ii, jj)+1 ) ) + 1;
    end
end

















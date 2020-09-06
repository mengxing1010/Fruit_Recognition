function [histLBP, MatLBP] = getLBPFea(I)
% 计算分区图像 I 的LBP特征,(8,2),uniform
%
% 输入：I --- 分区图像
%
% 返回值: MatLBP --- LBP响应矩阵
%               histLBP --- 1维行向量，LBP直方图

% 获得分块图像I的大小
[m n] = size(I);
rad = 2;
if (m <= 2*rad) || (n <= 2*rad)
    error('I is too small to compute LBP feature!');
end

MatLBP = zeros(m-2*rad, n-2*rad);

% 读入 LBP 映射(像素灰度与直方图收集箱索引的映射)
load Mat/LBPMap.mat;

for ii = 1+rad : m-rad
    for jj = 1+rad : n-rad
        nCnt = 1;
        
        
        % 计算(8,2)邻域的像素值，不在像素中心的点通过双线性插值获得其值
        nbPT(nCnt) = I(ii, jj-rad);
        nCnt = nCnt + 1;
        
        horInterp1 = I(ii-2, jj-2) + 0.5858*( I(ii-2, jj-1) - I(ii-2, jj-2) ); % 水平方向插值
        horInterp2 = I(ii-1, jj-2) + 0.5858*( I(ii-1, jj-1) - I(ii-1, jj-2) ); % 水平方向插值
        verInterp = horInterp1 + 0.5858*( horInterp2 - horInterp1 ); % 竖直方向插值
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I(ii-2, jj);
        nCnt = nCnt + 1;
        
        horInterp1 = I(ii-2, jj+1) + 0.4142*( I(ii-2, jj+2) - I(ii-2, jj+1) );
        horInterp2 = I(ii-1, jj+1) + 0.4142*( I(ii-1, jj+2) - I(ii-1, jj+1) );
        verInterp = horInterp1 + 0.5858*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I(ii, jj+2);
        nCnt = nCnt + 1;
        
        horInterp1 = I(ii+1, jj+1) + 0.4142*( I(ii+1, jj+2) - I(ii+1, jj+1) );
        horInterp2 = I(ii+2, jj+1) + 0.4142*( I(ii+2, jj+2) - I(ii+2, jj+1) );
        verInterp = horInterp1 + 0.4142*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
        nCnt = nCnt + 1;
        
        nbPT(nCnt) = I(ii+2, jj);
        nCnt = nCnt + 1;
        
        horInterp1 = I(ii+1, jj-2) + 0.5858*( I(ii+1, jj-1) - I(ii+1, jj-2) );
        horInterp2 = I(ii+2, jj-2) + 0.5858*( I(ii+2, jj-1) - I(ii+2, jj-1) );
        verInterp = horInterp1 + 0.4142*( horInterp2 - horInterp1 );
        nbPT(nCnt) = verInterp;
                
        
        for iCnt = 1:nCnt
            if( nbPT(iCnt) >= I(ii, jj) )
                MatLBP(ii-rad, jj-rad) = MatLBP(ii-rad, jj-rad) + 2^(nCnt-iCnt);
            end
        end
    end
end



% 计算LBP直方图
histLBP = zeros(1, 59); % 对于(8,2)的uniform直方图共有59个收集箱

for ii = 1:m-2*rad
    for jj = 1:n-2*rad
        histLBP( vecLBPMap( MatLBP(ii, jj)+1 ) ) = histLBP( vecLBPMap( MatLBP(ii, jj)+1 ) ) + 1;
    end
end

















function histLBP = getLBPHist(I, r, c, nMB)
% 取得I的分区 LBP 直方图
%
% 输入：r,c --- 了分区的数目，r*c个分区
%       nMB --- MB-LBP 中块的大小
%
% 返回值：histLBP ---  连接 I 的各个分块的LBP直方图而形成的代表 I 的LBP复合特征向量

[m n] = size(I);

% 计算分区的大小
mPartitionSize = floor(m / r);
nPartitionSize = floor(n / c);

for ii = 1:r-1
    for jj = 1:c-1
        Sub = I( (ii-1)*mPartitionSize+1:ii*mPartitionSize, (jj-1)*nPartitionSize+1:jj*nPartitionSize );
%        hist{ii}{jj} = getMBLBPFea( Sub, nMB );
        hist{ii}{jj} = getMBLBPFea_33( Sub, nMB );
    end
end


% 处理最后一行和最后一列
clear Sub
for ii = 1:r-1
    Sub = I( (ii-1)*mPartitionSize+1:ii*mPartitionSize, (c-1)*nPartitionSize+1:n );
%    hist{ii}{c} = getMBLBPFea(Sub, nMB);
    hist{ii}{c} = getMBLBPFea_33( Sub, nMB );
end
clear Sub

for jj = 1:c-1
    Sub = I( (r-1)*mPartitionSize+1:m, (jj-1)*nPartitionSize+1:jj*nPartitionSize );
%    hist{r}{jj} = getMBLBPFea(Sub, nMB);
    hist{r}{jj} = getMBLBPFea_33( Sub, nMB );
end
clear Sub

Sub = I((r-1)*mPartitionSize+1:m, (c-1)*nPartitionSize+1:n);
%hist{r}{c} = getMBLBPFea(Sub, nMB);
hist{r}{c} = getMBLBPFea_33( Sub, nMB );


% 连接各个分块的LBP直方图形成复合特征向量
histLBP = zeros(1, 0);
for ii = 1:r
    for jj = 1:c
        histLBP = [histLBP hist{ii}{jj}];
    end
end


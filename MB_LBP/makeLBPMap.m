function vecLBPMap = makeLBPMap
% 生成(8,2)临域uniform LBP直方图的映射关系，即将256个灰度值映射到59个收集箱中，
% 所有的非 uniform 放入一个收集箱中

vecLBPMap = zeros(1, 256); %初始化映射表

bits = zeros(1, 8); %8位二进模式串

nCurBin = 1;

for ii = 0:255
    num = ii;
    
    nCnt = 0;
    
    % 获得灰度num的二进制表示bits
    while (num)
        bits(8-nCnt) = mod(num, 2);
        num = floor( num / 2 );
        nCnt = nCnt + 1;
    end
    
    if IsUniform(bits) % 判断bits是不是uniform模式
        vecLBPMap(ii+1) = nCurBin;% 每个uniform模式分配一个收集箱
        nCurBin = nCurBin + 1;
    else
        vecLBPMap(ii+1) = 59;%所有非uniform模式都放入第59号收集箱        
    end
    
end

% 保存映射表
save('Mat/LBPMap.mat', 'vecLBPMap');





function bUni = IsUniform(bits)
% 判断某一个位串模式 bits 是否是 uniform 模式
%
% 输入：bits --- 二进制LBP模式串
%
% 返回值：bUni --- =1，if bits 是uniform模式串；=2，if bits 不是uniform模式串

n = length(bits);

nJmp = 0; % 位跳变数（0->1 or 1->0）
for ii = 1 : (n-1)
    if( bits(ii) ~= bits(ii+1) )
        nJmp = nJmp+1;
    end
end
if bits(n) ~= bits(1)
    nJmp = nJmp+1;
end

if nJmp > 2
    bUni = false;
else
    bUni = true;
end











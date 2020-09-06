%C computes the VAR descriptor.  
% J = CONT(I,R,N,LIMS,MODE) returns either a rotation invariant local   
% variance (VAR) image or a VAR histogram of the image I. The VAR values   
% are determined for all pixels having neighborhood defined by the input   
% arguments. The VAR operator calculates variance on a circumference of   
% R radius circle. The circumference is discretized into N equally spaced  
% sample points. Function returns descriptor values in a continuous form or  
% in a discrete from if the quantization limits are defined in the argument  
% LIMS.   
%  
% Examples  
% --------  
%  
%       im = imread('rice.png');  
%       c  = cont(im,4,16);   
%       d  = cont(im,4,16,1:500:2000);  
%  
%       figure  
%       subplot(121),imshow(c,[]), title('VAR image')  
%       subplot(122),imshow(d,[]), title('Quantized VAR image')  
  
  
  
function result = cont(varargin)   
% Version: 0.1.0  
  
  
% Check number of input arguments.  
error(nargchk(1,5,nargin));  
  
image=varargin{1};  
d_image=double(image);  
  
if nargin==1  
    spoints=[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];  
    neighbors=8;  
    lims=0;  
    mode='i';  
end  
  
  
if (nargin > 2) && (length(varargin{2}) == 1)  
    radius=varargin{2};  
    neighbors=varargin{3};  
    spoints=zeros(neighbors,2);  
    lims=0;  
    mode='i';  
    % Angle step.  
    a = 2*pi/neighbors;  
      
    for i = 1:neighbors  
        spoints(i,1) = -radius*sin((i-1)*a);  
        spoints(i,2) = radius*cos((i-1)*a);  
    end  
      
    if(nargin >= 4 && ~ischar(varargin{4}))  
        lims=varargin{4};  
    end  
      
    if(nargin >= 4 && ischar(varargin{4}))  
        mode=varargin{4};  
    end  
      
    if(nargin == 5)  
        mode=varargin{5};  
    end  
end  
  
if (nargin == 2) && ischar(varargin{2})  
    mode=varargin{2};  
    spoints=[-1 -1; -1 0; -1 1; 0 -1; -0 1; 1 -1; 1 0; 1 1];  
    neighbors=8;  
    lims=0;  
end  
  
  
  
  
% Determine the dimensions of the input image.  
[ysize xsize] = size(image);  
  
miny=min(spoints(:,1));  
maxy=max(spoints(:,1));  
minx=min(spoints(:,2));  
maxx=max(spoints(:,2));  
  
% Block size, each LBP code is computed within a block of size bsizey*bsizex  
bsizey=ceil(max(maxy,0))-floor(min(miny,0))+1;  
bsizex=ceil(max(maxx,0))-floor(min(minx,0))+1;  
  
% Coordinates of origin (0,0) in the block  
origy=1-floor(min(miny,0));  
origx=1-floor(min(minx,0));  
  
% Minimum allowed size for the input image depends  
% on the radius of the used LBP operator.  
if(xsize < bsizex || ysize < bsizey)  
    error('Too small input image. Should be at least (2*radius+1) x (2*radius+1)');  
end  
  
% Calculate dx and dy;  
dx = xsize - bsizex;  
dy = ysize - bsizey;  
  
%Compute the local contrast  
  
for i = 1:neighbors  
    y = spoints(i,1)+origy;  
    x = spoints(i,2)+origx;  
    % Calculate floors and ceils for the x and y.  
    fy = floor(y); cy = ceil(y);  
    fx = floor(x); cx = ceil(x);  
      
    % Use double type images  
    ty = y - fy;  
    tx = x - fx;  
      
    % Calculate the interpolation weights.  
    w1 = (1 - tx) * (1 - ty);  
    w2 =      tx  * (1 - ty);  
    w3 = (1 - tx) *      ty ;  
    w4 =      tx  *      ty ;  
    % Compute interpolated pixel values  
    N = w1*d_image(fy:fy+dy,fx:fx+dx) + w2*d_image(fy:fy+dy,cx:cx+dx) + ...  
        w3*d_image(cy:cy+dy,fx:fx+dx) + w4*d_image(cy:cy+dy,cx:cx+dx);  
    % Compute the variance using on-line algorithm  
    % ( http://en.wikipedia.org/wiki/Algorithms_for_calculating_variance#On-line_algorithm ).  
    if i == 1  
        MEAN=zeros(size(N));  
        DELTA=zeros(size(N));  
        M2=zeros(size(N));  
    end     
    DELTA=N-MEAN;  
    MEAN=MEAN+DELTA/i;  
    M2=M2+DELTA.*(N-MEAN);  
      
end  
  
% Compute the variance matrix.  
% Optional estimate for variance:  
% VARIANCE_n=M2/neighbors;  
result=M2/(neighbors-1);  
  
  
% Quantize if LIMS is given  
if lims  
    [q r s]=size(result);  
    quant_vector=q_(result(:),lims);  
    result=reshape(quant_vector,q,r,s);  
    if strcmp(mode,'h')  
        % Return histogram  
        result=hist(result, length(lims)-1);  
    end  
      
end  
  
if strcmp(mode,'h') && ~lims  
    % Return histogram  
    %epoint = round(max(result(:)));  
    result=hist(result(:),0:1:1e4);  
end  
  
end  
  
function indx = q_(sig,partition)  
  
[nRows, nCols] = size(sig);  
indx = zeros(nRows, nCols);  
  
for i = 1 : length(partition)  
    indx = indx + (sig > partition(i));  
end  
  
end  
load('apple_energy.mat', 'apple_energy');
a=apple_energy(:,2);
b=apple_energy(:,3);
c=apple_energy(:,4);
d=apple_energy(:,5);
e=apple_energy(:,6);
f=apple_energy(:,7);
g=apple_energy(:,8);
h=apple_energy(:,9);
i=apple_energy(:,10);
j=apple_energy(:,11);
k=apple_energy(:,12);
l=apple_energy(:,13);
m=apple_energy(:,14);
n=apple_energy(:,15);
o=apple_energy(:,16);
p=apple_energy(:,17);
q=apple_energy(:,18);
r=apple_energy(:,19);
s=apple_energy(:,20);
t=apple_energy(:,21);
u=apple_energy(:,22);
v=apple_energy(:,23);
w=apple_energy(:,24);
xx=apple_energy(:,25);
y=apple_energy(:,26);
z=apple_energy(:,27);
aa=apple_energy(:,28);
ab=apple_energy(:,29);
ac=apple_energy(:,30);
ad=apple_energy(:,31);
%横坐标
x=apple_energy(:,1);

plot(x,a,'-s',x,b,'-s',x,c,'-s',x,d,'-s',x,e,'-s',x,f,'-s',x,g,'-s',x,h,'-s',x,i,'-s',x,j,'-s',x,k,'-s',x,l,'-s',x,m,'-s',x,n,'-s',x,o,'-s',x,p,'-s',...
    x,q,'-s',x,r,'-s',x,s,'-s',x,t,'-s',x,t,'-s',x,u,'-s',x,v,'-s',x,w,'-s',x,xx,'-s',x,y,'-s',x,z,'-s',x,aa,'-s',x,ab,'-s',x,ac,'-s',x,ad,'-s');hold on
xlabel('角度');
ylabel('能量');
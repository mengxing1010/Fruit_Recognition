clc;clear;
x = -2:0.1:2;
y = -2:0.1:2;
z = zeros(size(x,2),size(y,2));
for row = 1:size(x,2)
    for col = 1:size(y,2)
        z(row,col) = GaussianFunction([x(row) y(col)]);
    end
end
surf(x,y,z);
figure;

z = zeros(size(x,2),size(y,2));
for row = 1:size(x,2)
    for col = 1:size(y,2)
        z(row,col) = AckleyFunction([x(row) y(col)]);
    end
end
surf(x,y,z);
figure;

x = -20:0.5:20;
y = -20:0.5:20;
z = zeros(size(x,2),size(y,2));
for row = 1:size(x,2)
    for col = 1:size(y,2)
        z(row,col) = GriewankFunction([x(row) y(col)]);
    end
end
surf(x,y,z);
figure;


x = -5:0.1:5;
y = -5:0.1:5;
z = zeros(size(x,2),size(y,2));
for row = 1:size(x,2)
    for col = 1:size(y,2)
        z(row,col) = RastriginFunction([x(row) y(col)]);
    end
end
surf(x,y,z);
figure;

x = -2:0.1:2;
y = -2:0.1:2;
z = zeros(size(x,2),size(y,2));
for row = 1:size(x,2)
    for col = 1:size(y,2)
        z(row,col) = RosenbrockFunction([x(row) y(col)]);
    end
end
surf(x,y,z);
figure;

x = -2:0.1:2;
y = -2:0.1:2;
z = zeros(size(x,2),size(y,2));
for row = 1:size(x,2)
    for col = 1:size(y,2)
        z(row,col) = SchafferFunction([x(row) y(col)]);
    end
end
surf(x,y,z);
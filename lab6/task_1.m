a=7;b=a^2;
[x,y] = meshgrid(-10:.1:10, -100:.1:100);
f=(x-a).^2+b.*(y-x.^2).^2;
figure (1)
mesh(x,y,f)
xlabel('x')
ylabel('y')
zlabel('f(x,y)')



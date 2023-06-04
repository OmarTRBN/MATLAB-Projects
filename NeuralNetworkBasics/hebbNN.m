function w=hebbNN(x,y)
    m=size(x,1);
    n=size(x,2);  
    w=zeros(1,n); 
    b=0;
    n=0.1;
for i=1:m
    w=w+n*(x(i,:)*y(i));
    b=b+n*y(i);
    fprintf("Input data from row number %d;\n", i)
    disp(['w= ',num2str(w)])
    disp(['b= ',num2str(b)])
    fprintf("\n")
end     
figure;
gscatter(x(:,1),x(:,2),y);
hold on;

x1=linspace(-1,1,1000);
x2=-(w(1)*x1+b)/w(2);
plot(x1,x2,'r');
hold off;

% To add bias at end of weights array
w(end+1)=b;
end
function w=hebbNN(x,y)
    % Inputs must be -1 or 1 for hebbian

    m=size(x,1); % m is training examples
    n=size(x,2); % n is number of inputs
    w=zeros(1,n); % Initial weights are zero
    b=0;
    eta=0.1;

for i=1:m
    w=w+eta*(x(i,:)*y(i));
    b=b+eta*y(i);
    fprintf("Training example number %d;\n", i);
    disp(['x= ',num2str(x(i,:))]);
    disp(['w= ',num2str(w)]);
    disp(['b= ',num2str(b)]);
    fprintf("\n");
end   

figure;
gscatter(x(:,1),x(:,2),y);
hold on;

% Plotting the hyperplane
x1=linspace(-100,100,10000);
x2=-(w(1)*x1+b)/w(2);
plot(x1,x2,'r');
hold off;

% To add bias at end of weights array
w(end+1)=b;
end
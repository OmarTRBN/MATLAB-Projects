function w=sigmoid_neuron(x,y)
    
    % 'inputs' and 'outputs' arrays must have rows as different values 
    % for same parameter and each column represents different parameter
    
    % Inputs_size will be 'rows * columns'
    inputs_size = size(x);

    % Number of weights (or paramters) is given by 'inputs_size(2)'
    fprintf("Initial weights:");
    w=rand(inputs_size(2), 1)

    fprintf("Initial bias:");
    b=-1*rand(1, 1)

    n=0.1;
    J=0;
    itr = 1;
    max_itr = 1000;
    min_error = 17898;

    W(1,:) = w;
    bias_change(1) = b;
    
    while itr <= max_itr
        
        % Loop for number of output parameters
        for i=1:length(y) 
            % Get i inputs and outpus
            in = x(i,:);
            out = y(i);
            
            % Multiply weights by inputs & add bias
            net = dot(w, in) + b;

            % Activation
            sigma=sigmoid_activation(net);

            % Calculate error & update weights and bias
            error = out - sigma;
            w = w + n*(sigma-sigma^2)*(error.*in)';
            b = b + n*(sigma-sigma^2)*error;           
        
            % Cost function
            J = J + 0.5*error*error;
        end 
        
        % Store values to plot 
        bias_change(itr+1) = b;
        performance(itr+1) = J;
        W(itr+1,:)=w;
        itr = itr+1;

        if J<=min_error
            break;
        else
            J=0;
        end


    end

    % Add bias to end of weights array
    w(end+1, :) = b;

    fprintf("Number of iterations: %d\n", itr)
    
    subplot(3,1,1);
    plot(performance);title('Performance');
    subplot(3,1,2);
    plot(bias_change);title('Bias');
    subplot(3,1,3);
    plot(W);title('weights');
   
    figure;
    gscatter(x(:,1), x(:,2), y); %Eğitim verilerini çizer
    x2=linspace(0,1,100); %0 1 arasında x2 vektörü hesapla
    x1=-(w(2)*x2+w(3))/w(1); %x2 ile ile x1 i hesapla
    hold on ; plot(x1,x2); %Hiperdüzlemi çizer
end
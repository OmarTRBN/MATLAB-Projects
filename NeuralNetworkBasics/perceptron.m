function weights = perceptron(inputs, outputs)
    
    % 'inputs' and 'outputs' arrays must have rows as different values 
    % for same parameter and each column represents different parameter
    
    % Inputs_size will be 'rows * columns'
    inputs_size = size(inputs);

    % Number of weights (or paramters) is given by 'inputs_size(2)'
    fprintf("Initial weights");
    weights = rand(inputs_size(2), 1)
    fprintf("Initial bias");
    bias = -1 * rand(1, 1)

    learning_rate = 0.1;
    J = 0;
    itr = 1;
    max_itr = 1000;
    min_error = 0.1;

    W(1,:) = weights;
    bias_change(1) = bias;
    
    while itr <= max_itr
        
        % Loop for number of output parameters
        for i=1:length(outputs) 
            % Get i inputs and outpus
            in = inputs(i,:);
            out = outputs(i);
            
            % Multiply weights by inputs & add bias
            net = dot(weights, in) + bias;

            % Activation
            net = net > 0;

            % Calculate error & update weights and bias
            error = out - net;
            weights = weights + learning_rate*(error.*in)';
            bias = bias + learning_rate*error;           
        
            % Cost function
            J = J + 0.5*error*error;
        end 
        
        % Store values to plot 
        bias_change(itr+1) = bias;
        performance(itr+1) = J;
        W(itr+1,:)=weights;
        itr = itr+1;

        if J<=min_error
            break
        else
            J=0;
        end


    end

    % Add bias to end of weights array
    weights(end+1, :) = bias;
    
   fprintf("Number of iterations: %d\n", itr)
    % Plot
    subplot(3,1,1);
    plot(performance);title('Performance');
    subplot(3,1,2);
    plot(bias_change);title('Bias');
    subplot(3,1,3);
    plot(W);title('weights');
    figure;

    gscatter(inputs(:,1), inputs(:,2), outputs); %Eğitim verilerini çizer
    x2=linspace(0,1,100); %0 1 arasında x2 vektörü hesapla
    x1=-(weights(2)*x2+weights(3))/weights(1); %x2 ile ile x1 i hesapla
    hold on ; plot(x1,x2); %Hiperdüzlemi çizer
end
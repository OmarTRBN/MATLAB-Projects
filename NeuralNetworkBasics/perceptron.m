function w = perceptron(x,y)
    % Each row is a different training example for 'inputs' and 'outputs'
    
    % Inputs_size will be 'rows * columns'
    m=size(x,1); % m is training examples
    n=size(x,2); % n is number of inputs

    % Number of weights is given by 'n'
    w = rand(n, 1);
    b = -1 * rand(1, 1);
    disp(['Initial weights: ',num2str(w')]);
    disp(["Initial bias = ",num2str(b)]);

    eta = 0.1; % Learning rate
    J = 0; % Cost
    itr = 1; 
    max_itr = 100;
    min_error = 0.1;

    % For plotting changes in bias and weights
    w_plot(1,:) = w;
    b_plot(1) = b;
    
    while itr <= max_itr
        
        % Loop for number of output parameters
        for j=1:length(y)
            fprintf("#################################################\n");
            fprintf("Iteration number %d for training example %d: \n", itr, j);
            
            % Get j inputs and outputs
            in = x(j,:);
            out = y(j);
            fprintf("Inputs: \n");
            disp(in)
            fprintf("Outputs: \n");
            disp(out)
            
            % Multiply weights by inputs & add bias
            net = dot(w,in) + b;
            fprintf('Net = %d\n', net);

            % Step Activation
            net = net > 0;
            fprintf('f(Net) = %d\n', net);

            % Calculate error & update weights and bias
            E = out - net;
            w = w + eta*(E.*in)';
            b = b + eta*E;      
            disp(['Error= ',num2str(E)])
            disp(['New weights= ',num2str(w')])
            disp(['New bias= ',num2str(b)])

            % Cost function
            J = J + 0.5*E*E;
        end 
        
        % Store values to plot 
        b_plot(itr+1) = b;
        performance(itr+1) = J;
        w_plot(itr+1,:)=w;
        itr = itr+1;

        if J<=min_error
            break;
        else
            J=0;
        end

    end

    % Add bias to end of weights array
    w(end+1, :) = b;
    fprintf("#################################################\n")
    fprintf("Final number of iterations: %d\n", itr-1)

    % Plot performance, weights and bias
    subplot(4,1,1);
    plot(performance);title('Performance');
    subplot(3,1,2);
    plot(b_plot);title('Bias');
    subplot(3,1,3);
    plot(w_plot);title('weights');
    figure;
    
    % Plot hyperplane
    gscatter(x(:,1), x(:,2), y);
    x2=linspace(-100,100,10000); 
    x1=-(w(2)*x2+w(3))/w(1); 
    hold on ; plot(x1,x2); hold off;
end
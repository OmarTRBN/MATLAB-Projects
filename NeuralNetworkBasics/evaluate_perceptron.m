function mse = evaluate_perceptron(w, x, y)
    % Separate bias from weights
    b = w(end);
    w = w(1:end-1, :);
    disp(['w= ', num2str(w')]);
    disp(['b= ', num2str(b)]);

    error = zeros(size(y));  % Initialize error vector

    for j = 1:length(y)
        in = x(j, :);
        out = y(j);
        net = dot(w, in) + b;

        % Activation
        net = net > 0;

        error(j) = out - net;  % Calculate error for each example
    end

    plot(error');  % Plot errors for each example
    title('Errors');
    mse = mean(error .* error);  % Calculate mean squared error
end

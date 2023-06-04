function mse = evaluate_perceptron(weights, inputs, outputs)
    bias = weights(end);
    weights = weights(1:end-1, :);

    result = inputs .* weights + bias;

    % Activation
    result = result > 0;

    error = outputs - result;
    plot(error');title('Errors');
    mse = mean(error.*error);
end
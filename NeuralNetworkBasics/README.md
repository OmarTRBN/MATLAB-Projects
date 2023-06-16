This is some MATLAB code that implements the basic concepts of neural networks which I learned in my collee class Artificial Intelligence Systems. An MATLAB implementation of multi layered networks however cannot be found here as of now.

---> 'hebbNN': 
        input: (x,y) = (input_data,desired_values)
        output: [w1 w2 ... wn b]
---> 'perceptron':
        input: (x,y) = (input_data,desired_values)
        output: [w1 w2 ... wn b]
---> 'evaluate_perceptron':
        input: (w,x,y) = ([w1 w2 ... wn b],input_data,desired_values)
        output: mse
---> 'sigmoid_neuron'
        input: (x,y) = (input_data,desired_values)
        output: [w1 w2 ... wn b]
---> 'sigmoid_activation':
        input: x
        output: y = 1/(1+e^(-x))
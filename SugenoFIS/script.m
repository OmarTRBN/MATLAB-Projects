clear;
clc;
% read the data table from file
table = readtable('energy.csv');
% convert data table to array
data = table2array(table);

% split data into training and validation sets
% train
train_in = data(1:700,1:8);
train_out1 = data(1:700,9);
train_out2 = data(1:700,10);
% test
test_in = data(701:768,1:8);
test_out1 = data(701:768,9);
test_out2 = data(701:768,10);

% plot input and output training data
plot(train_out1)
hold on
plot(train_out2)
legend('trainout1','trainout2');
hold off
plot(train_in)

% generate sugeno fis
fis1 = genfis(train_in,train_out1);
fis2 = genfis(train_in,train_out2);

% setting initial fis
opt1 = anfisOptions('InitialFIS',fis1,'EpochNumber',5);
opt2 = anfisOptions('InitialFIS',fis2,'EpochNumber',5);
% tune fis
fis1 = anfis([train_in train_out1],opt1)
fis2 = anfis([train_in train_out2],opt2)

% y1 and y2 are test results
y1 = evalfis(fis1,test_in);
y2 = evalfis(fis2,test_in);
% calculate error for both outputs
error1 = test_out1-y1;
error2 = test_out2-y2;
plot(error1)
hold on
plot(error2)
legend('error1','error2');
hold off
% calculate mse for each output
mse1 = mean(error1.*error1)
mse2 = mean(error2.*error2)

% wanted output and initial fis comparison
% for first output
plot(y1,'r')
hold on
plot(test_out1,'b')
legend('actual','expected');
hold off
% for second output
plot(y2,'r')
hold on
plot(test_out2,'b')
legend('actual','expected');
hold off
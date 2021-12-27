clear;
close all;

% Load in all data needed, inlcuding feature matrices and labels
load TrainImages.mat fMatrixTrain;
load TrainLabels.mat trainLabels;
load TestImages.mat fMatrixTest;
load TestLabels.mat testLabels;

%  Train model
knnModel = fitcknn(fMatrixTrain,trainLabels);

% Test model
predictions = predict(knnModel,fMatrixTest);

% Calculate accuracy of predictions made
Accuracy = Accuracy(testLabels, predictions);

% Calculate and plot a confusion matrix
confusionchart(testLabels, predictions);
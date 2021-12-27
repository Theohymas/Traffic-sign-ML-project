clear;
close all;

% Create imageDataStore
imds = imageDatastore(fullfile('Train'), 'IncludeSubfolders', true,'LabelSource', 'foldernames');

countEachLabel(imds)

% Initialize matrix for image vectors and store Labels in a column vector
fMatrixTrain = zeros(0, 0);
trainLabels = str2double(cellstr(imds.Labels));

% Iterate through imds, convert each image to double/grayscale
% Stack columns of each matrix and transpose to give row Vector
% Add row vector to fMatrixTrain

for i = 1:length(imds.Files)
    newImage = mean(double(imread(imds.Files{i}))/255, 3);
    rowImage = newImage(:).';
    fMatrixTrain(i,:) = rowImage;
    i = i+1;
end

% Save feature matrix and label vectors for later use
save TrainImages.mat fMatrixTrain;
save TrainLabels.mat trainLabels;

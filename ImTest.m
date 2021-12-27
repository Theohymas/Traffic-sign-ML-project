clear;
close all;

% Create imageDataStore
imds = imageDatastore(fullfile('Test'), 'IncludeSubfolders', true,'LabelSource', 'foldernames');

countEachLabel(imds)

% Initialize matrix for image vectors and store Labels in a column vector
fMatrixTest = zeros(0, 0);
testLabels = str2double(cellstr(imds.Labels));

% Iterate through imds, convert each image to double/grayscale
% Stack columns of each matrix and transpose to give row Vector
% Add row vector to fMatrixTest

for i = 1:length(imds.Files)
    newImage = mean(double(imread(imds.Files{i}))/255, 3);
    rowImage = newImage(:).';
    fMatrixTest(i,:) = rowImage;
    i = i+1;
end

% Save feature matrix and label vectors for later use
save TestImages.mat fMatrixTest;
save TestLabels.mat testLabels;
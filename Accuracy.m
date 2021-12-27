function [Accuracy] = Accuracy(a,b)

% sort a vector of the differences, 0 represents correct predition
differences = sort((a - b).^2);

% iterate through the sorted vector, counting 0s to represent successful
% predicitons
i = 1;
while(differences(i)<1)
    i= i+1;
end

% accuracy calculation using i-1 as successful predicitons
Accuracy = (i-1) / length(a);
end


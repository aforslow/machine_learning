function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

vec = [0.01 0.03 0.1 0.3 1 3 10 30];
C_val = 0;
sigma_val = 0;

for i = 1:length(vec)
    for j = 1:length(vec)
        model = svmTrain(X, y, vec(1,i), @(x1,x2) gaussianKernel(x1,x2,vec(1,j)));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        if (i == 1 && j==1)
            finalError = error;
            C_val = i;
            sigma_val = j;
        end
        if (error < finalError)
            finalError = error;
            vals = [i j];
            C_val = i;
            sigma_val = j;
        end
    end
end

C_val = vals(1,1);
sigma_val = vals(1,2);
C = vec(vals(1,1));
sigma = vec(vals(1,2));





% =========================================================================

end

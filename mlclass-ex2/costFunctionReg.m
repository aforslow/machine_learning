function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples
sum1 = 0;
sum2 = 0;
regsum = zeros(size(theta));
gradsum = zeros(size(theta));

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% Cost
for i = 1:m
    sum1 = sum1 + 1/m*(-y(i)*log(sigmoid(X(i,:)*theta))-(1-y(i))*log(1-sigmoid(X(i,:)*theta)));
end
for j = 2:size(theta)
    sum2 = sum2 + lambda/m*(theta(j))^2;
end

J = sum1 + sum2;

%Gradient
for b = 1:size(X,2)
    for a = 1:m
        gradsum(b) = gradsum(b) + 1/m*(sigmoid(X(a,:)*theta) - y(a))*X(a,b);
    end
    if b > 1
        regsum(b) = lambda/m*(theta(b))^2;
    end
end

grad = gradsum + regsum;

        




% =============================================================

end

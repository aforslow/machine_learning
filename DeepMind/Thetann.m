Theta1 = rand(3,4);
Theta2 = rand(1,5);
r = [0 1];
gamma = 0.8;
actionset = [-1 0 1];
s = 2;
a = 1;
s_prime = 3;
a_prime = [1 2 3];
Thetao1 = rand(3,4);
Thetao2 = rand(1,5);

Theta_old = [Thetao1(:); Thetao2(:)];
Theta_new = [Theta1(:); Theta2(:)];



% Forward prop

h = 1e-4;

J = @(p) forwardprop(p,s,a);
perturb = zeros(size(Theta_new));
numgrad = zeros(size(Theta_new));
h = 1e-4;

for j = 1:numel(Theta_new)
    perturb(j) = h;
    loss1 = J(Theta_new - perturb);
    loss2 = J(Theta_new + perturb);
    
    numgrad(j) = (loss2 - loss1)/(2*h)
    perturb(j) = 0;
end

Theta1 = reshape(Theta_new(1:3*3),[3,3]);
Theta2 = reshape(Theta_new(3*3+1:3*3+4),[1,4]);

a1 = [1 s a];
z1 = a1*Theta1';
a2 = [1 sigmoid(z1)];
z2 = a2*Theta2';
J = sigmoid(z2);

% grad = backprop(Theta, 1e-4, z2, a1, a2);
% grad
aval = [];
for k = 1:length(actionset)
    h = forwardprop(Theta_old, s_prime, k);
    aval = [aval h];
end

[~,a] = max(aval);
grad = (r(1) + gamma*a - forwardprop(Theta_new, s, a))*numgrad

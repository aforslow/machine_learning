function [Theta_old, Theta_new] = init_theta(sigma, input, hidden)

Theta1 = rand(hidden,input+1)*2*sigma - sigma;
Theta2 = rand(1,hidden+1)*2*sigma - sigma;

Theta_old = [Theta1(:); Theta2(:)];
Theta_new = [Theta1(:); Theta2(:)];

end
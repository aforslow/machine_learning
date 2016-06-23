function [Theta1, Theta2] = reshape_theta(Theta, input, hidden)

Theta1 = reshape(Theta(1:hidden*(input+1)),[hidden,input+1]);
Theta2 = reshape(Theta(hidden*(input+1)+1:hidden*(input+1)+hidden+1),[1,hidden+1]);

end
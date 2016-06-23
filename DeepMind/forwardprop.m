function J = forwardprop(Theta, sequence, action, input, hidden)

    [Theta1, Theta2] = reshape_theta(Theta, input, hidden);
    
    %Roll out params
    seq = sequence(:)';
    
    a1 = [1 seq action];
    z1 = a1*Theta1';
    a2 = [1 sigmoid(z1)];
    z2 = a2*Theta2';
    J = sigmoid(z2);



end
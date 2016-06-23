function grad = backprop(Theta, y, sequence, action, input, hidden)
    lambda = 0.0001;
    
    [Theta1, Theta2] = reshape_theta(Theta, input, hidden);
    
    seq = sequence(:)';
    
    a1 = [1 seq action];
    z1 = a1*Theta1';
    a2 = [1 sigmoid(z1)];
    z2 = a2*Theta2';
    a = sigmoid(z2);
    
    delta3 = a - y;
    
    delta2 = Theta2'*delta3;
    delta2 = delta2(2:end).*sigmoidGradient(z2);
    
    Delta2 = delta3*a2;
    Delta2(:,2:end) = Delta2(:,2:end) + lambda*Theta2(:,2:end);
    Delta1 = delta2*a1;
    Delta1(:,2:end) = Delta1(:,2:end) + lambda*Theta1(:,2:end);
    
    grad = [Delta1(:); Delta2(:)];
%     disp([a y]);
%     if y==1
%         pause(3);
%     end
end
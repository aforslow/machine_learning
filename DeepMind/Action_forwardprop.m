function [Action, max_value] = Action_forwardprop(Theta_old, sequence, input, hidden)

[Theta1, Theta2] = reshape_theta(Theta_old, input, hidden);
possible_actions = [-1 0 1];
avals = [];
% 
% disp(size(sequence));
% disp(size(Theta1'));
for this_action = 1:length(possible_actions)
    
    a1 = [1 sequence this_action];
    z1 = a1*Theta1';
    a2 = [1 sigmoid(z1)];
    z2 = a2*Theta2';
    a3 = sigmoid(z2);
    
    avals = [avals a3];
end
[max_value,max_action] = max(avals);
Action = possible_actions(max_action);

end
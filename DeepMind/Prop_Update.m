function Theta = Prop_Update(Theta_old, Theta_new, X, alpha, input, hidden)

for update = 1:10
    Theta_grad = zeros(size(Theta_old));
    z_t = X(:,1:2);
    a_t = X(:,3);
    reward = X(:,4);
    z_t1 = X(:,5:6);
    
    for iteration = 1:10
        
        if iteration < 10
            [~,Qmax] = Action_forwardprop(Theta_old, z_t1, input, hidden);
        else
            Qmax = 0;
        end
        y = reward + Qmax;
        Qval = forwardprop(Theta_new, z_t, a_t, input, hidden);
        grad = backprop(Theta_new, y, z_t, a_t, input, hidden);
        Theta_grad = Theta_grad + (reward + gamma*Qmax - Qval)*grad;
    end
    Theta_old = Theta_new;
    Theta_new = Theta_new - alpha/10*Theta_grad;
end


end
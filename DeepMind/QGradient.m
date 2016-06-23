function numgrad = QGradient(Theta_new, thisSequence, thisAction, input, hidden)

    J = @(p) forwardprop(p,thisSequence,thisAction, input, hidden);
    perturb = zeros(size(Theta_new));
    numgrad = zeros(size(Theta_new));
    h = 1e-4;

    for j = 1:numel(Theta_new)
        perturb(j) = h;
        loss1 = J(Theta_new - perturb);
        loss2 = J(Theta_new + perturb);

        numgrad(j) = (loss2 - loss1)/(2*h);
        perturb(j) = 0;
    end


end
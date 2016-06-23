function sGrad = sigmoidGradient(z)
    
    g = 1./(1 + exp(-z));
    sGrad = g.*(1-g);

end
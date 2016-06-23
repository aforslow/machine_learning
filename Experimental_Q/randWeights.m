function W = randWeights(L_in, L_out)
    epsilon = 0.12;
    
    W = zeros(L_out, L_in+1);
    
    W = rand(L_out, L_in+1)*2*epsilon - epsilon;


end
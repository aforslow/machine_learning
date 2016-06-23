function g = sigmoidGradient(z)

    g = (1-sigmoid(z)).*sigmoid(z);

end
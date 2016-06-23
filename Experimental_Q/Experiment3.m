X = [2 3 1; 1 4 2; 2 4 3];
layerstructure = 25;
Theta = initTheta(X,layerstructure);
reward = 1;
lambda = 0.8;
m = size(X,1);

BigDelta = initBigDelta(Theta);

    Position = -0.3;
    Velocity = 0.0;
    tPlot = [];
    hPlot = [];
    height = 1 - cos(Position);
    t=0;
    PossibleActions = [-1 0 1];

while Position < 0.6

    Action = randi([-1 1]);
    Velocity = Velocity + (Action)*0.001 + cos(3*Position)*(-0.0025);
    Position = Position + Velocity;
    height = 1 - cos(Position);
    reward = -1 + height;

    thisX = [Velocity Position Action];
    [grad, BigDelta, y] = nnCompute(thisX, lambda, Theta, reward, BigDelta);
    

    
    tPlot = [tPlot t];
    hPlot = [hPlot height];
    t = t + 1;
end

    plot(tPlot,hPlot);

for i = 1:length(grad)
    grad{i} = 1/t*grad{i};
    grad{i}
    BigDelta{i} = 1/t*BigDelta{i};
end

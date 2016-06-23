for i = 1:s
    time = 0;
    Position = rand()-0.5;
    Velocity = 0.0;
    height = 1 - cos(Position);
    PossibleActions = [-1 0 1];
    y = 0;
    alpha = 0.02;

    x = [-pi:0.01:pi];
    a = 1 + cos(x - pi);
    plot(x, a);
    hold on;

    s = 10000;
    j = true;

    while j == true

%         avals = [];
%         for iAction = PossibleActions
%             iPosition = Position;
%             iVelocity = Velocity;
%             iVelocity = iVelocity + (iAction)*0.001 + cos(iPosition - pi/2)*(-0.0035);
%             iPosition = iPosition + iVelocity;
%             height = 1 - cos(iPosition);
% 
%             thisX = [Velocity Position iAction];
%             [~, ~, aval] = nnCompute(thisX, lambda, Theta, 0, BigDelta, y, alpha);
%             avals = [avals aval];
%             
% 
%         end
%         [~,a] = max(avals);
%         Action = PossibleActions(a)
        
        Action = randi([-1 1]);
        if height >= 0.8
            Velocity = - 0.3*Velocity;
        end

        Velocity = Velocity + (Action)*0.001 + cos(Position - pi/2)*(-0.0035);
        Position = Position + Velocity;
        height = 1 - cos(Position);

%         if ((height >= 0.55) && (Position > 0))
%             j = false;
%         end
        
        h(i) = plot(Position, height,'+');
        time = time + 0.001;
        title(strcat('Time: ', num2str(time,2)));
        drawnow;

        delete(h(i))
    end

end
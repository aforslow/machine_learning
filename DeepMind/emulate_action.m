function [Velocity, Position, height, reward, j] = emulate_action(Velocity, Action, Position)
j = true;
height = 1 - cos(Position);

if height >= 0.8
    Velocity = - 0.3*Velocity;
end
Velocity = Velocity + (Action)*0.001 + cos(Position - pi/2)*(-0.0025);
Position = Position + Velocity;
height = 1 - cos(Position);
% disp([10*Velocity Position]);
% pause(1);
if (height > 0.2) && (Position > 0)
    reward = 1;
    j = false;
    %         elseif (height > 0.4) && (Position < 0)
    %             reward(time) = -1;
    %             j = false;
else
    reward = Position;
end


end
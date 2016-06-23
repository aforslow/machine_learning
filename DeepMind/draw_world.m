function [] = draw_world(Position, height, time)

h(time) = plot(Position, height,'+');
title(strcat('Time: ', num2str(time,2)));
drawnow;

delete(h(time))
end
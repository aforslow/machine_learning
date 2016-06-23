j = true;
time = 0;
PossibleActions = [-1 0 1];
alpha = 0.1;
gamma = 0.9;
sigma = 0.12;
T = 6;
hidden = 6;
features = 3;
input = features*4+1;
[Theta_old, Theta_new] = init_theta(sigma, input, hidden);
firstAction = true;
Theta_grad = zeros(size(Theta_old));
grad = zeros(size(Theta_old));
nElements = 2 + T*features;

% if exist('sequence_matrix.mat','file')
%     seq_mat = load('sequence_matrix.mat','seq_mat');
% end

% subplot(2,1,2);
x = [-pi:0.01:pi];
a = 1 + cos(x - pi);
plot(x, a);
hold on;

for abba = 1:10000
    j = true;
    Position = 0.3*(rand()-0.5);
    Velocity = 0.0;
    height = 1 - cos(Position);
    kval = 0;
    state = [];
    state(:,1) = [0; Velocity; Position];
%     seq_time = 1;
    s_new = zeros(1,4*3);
    MeanSquare = ones(size(Theta_old));
    
    while j == true
%         sequence = [Velocity Position];
%         seq_mat = store_sequence(sequence, nElements);
%         seq_time = seq_time + 1;
%         z(1,:) = phi_func(sequence,features-1);
%         for t = 1:T
            time = time + 1;
            epsilon = rand();
            if (epsilon <= 1-0.9*sigmoid(abba*0.1 - 2)) || (firstAction == true)
                Action = randi([-1 1]);
            else
                [Action,~] = Action_forwardprop(Theta_new, s_old, input, hidden);
%                 disp(size(Theta_new));
%                 disp(size(grad));
                disp([Theta_new grad Action*ones(size(Theta_new))]);
%                 disp([z Action*ones(size(z,1),1)]);
%                 disp(Action);
            end
%             disp(z(t,:));
%             pause(1);
            [Velocity, Position, height, reward, j] = emulate_action(Velocity, Action, Position);
            
%             sequence = [sequence Action Velocity Position];
%             seq_mat = store_sequence(sequence, nElements);

%             z(t+1,:) = phi_func(sequence,features-1);
            state(:,size(state,2)+1) = [Action; Velocity; Position];
            if size(state,2) == 5
                index = true(1,size(state,2));
                index(1) = false;
                state = state(:,index);
            end
%             if (seq_time == 4) || (j == false)
%             alpha = 0.1;
            if size(state,2) >= 4
                s_old = s_new;
                s_new = state(:);
                s_new = s_new';
%                 seq_time = 0;
                D = store_to_D(s_old, Action, reward, s_new, j);
                %Store s_t & s_t+1
            
            
            
            X = fetch(D);

            if size(X) > 0;
                for update = 1:50
                    Theta_grad = zeros(size(Theta_old));
                    
                    for iteration = 1:10
                        z_t = X(iteration,1:12);
                        this_action = X(iteration,13);
                        reward = X(iteration,14);
                        z_t1 = X(iteration,15:26);
                        eval_j = X(iteration,27);

                        if eval_j == true
                            [~,Qmax] = Action_forwardprop(Theta_old, z_t1, input, hidden);
                        else
                            Qmax = 0;
                        end
                        y = reward + Qmax;
                        Qval = forwardprop(Theta_new, z_t, this_action, input, hidden);
                        grad = backprop(Theta_new, y, z_t, this_action, input, hidden);
%                         disp(y);
%                         disp(
%                         numgrad = QGradient(Theta_new, z_t, this_action, input, hidden);
                        Theta_grad = Theta_grad + (reward + gamma*Qmax - Qval)*grad;
%                         disp([grad numgrad]);
%                         pause();
                    end
%                     MeanSquare = 0.9*MeanSquare + 0.1*Theta_grad.^2;
%                     Theta_grad = Theta_grad./sqrt(MeanSquare);
                    Theta_old = Theta_new;
                    Theta_new = Theta_new - alpha./10*Theta_grad;
%                     disp(Theta_new);
%                     pause(3);
                end
            end
            end

            draw_world(Position, height, time);
            
            firstAction = false;
%         end
        
    end
    
end

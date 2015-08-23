% psotv1
% script to test and run the PSO for swarm trajectories
clear
clf
addpath('PSO')
addpath('UAV')
addpath('SWARM')

% Particles count
N_Particles = 13;

% Agent count (Physical count of robots, each particle consists of 
% N_Agent agents)
N_Agents = 3;

% Starting point and Goal points moved to individual functions for clarity
Path.Start = createPathStartingPoints(N_Agents);
Path.Goal = createPathGoals(N_Agents);

PlotStartingPointandGoals(N_Agents, Path);

%% Initialize the Swarm and PSO
s = SWARM();
for k = 1:N_Agents
    s.AddAgent(UAV(Path.Start.state(:, k)));
end

% Initialize PSO 
p = PSO(s, N_Particles, Path.Goal, @CostFcn);

%% Iterate PSO

    p.Iterate();
    drawnow update
    %%
for k = 1:150
    p.Iterate();
    drawnow update
end
%p.Particle(1).Fitness



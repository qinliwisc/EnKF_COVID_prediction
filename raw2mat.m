% This code generate .mat from .csv and .txt data
clear
addpath('./data/data_raw/')
%% Epidemic Info

% Numbers of reported cases
I_true = readmatrix('/data/data_raw/time_series_19-covid-Confirmed_fromMar1_toMar20.csv');
I_true = I_true(2:end,3:end);

% Number of days we need to analyze
T = size(I_true,2)-1;  

% Save
save('data/Itrue.mat','I_true','T');


%% Geographic Info

% State Names
state_name = readcell('data_raw/top_states_51.csv');
state_name = state_name(2:end,3);

% State Total Populations
N = readmatrix('data_raw/top_states_51.csv');
N = N(:,4);

% Traffic Data
Name = readcell('data_raw/state_odmatrix_column.txt');
Name = strcat(Name(:,1),Name(:,2));
traffic = readmatrix('data_raw/state_odmatrix_column.txt');
traffic = traffic(:,3);

n_state = size(state_name,1); 
n_tr = zeros(n_state,n_state); % data n_tr(i,j) is the flow from state j to state i
for i = 1:n_state
    for j = 1:n_state
        Name_ij = strcat(state_name(j),state_name(i));
        index = find(strcmp(Name,Name_ij));
        if isempty(index)
            n_tr(i,j) = 0;
        else
            n_tr(i,j) = traffic(index);
        end
    end
end
n_tr = n_tr - diag(diag(n_tr));  % No diagonal elements
n_tr = n_tr/30; % Daily data (the data set is of 30 days)


% Save
% load total population N; traffic matrix n_tr; names of states
save('data/states.mat','N','n_tr','state_name'); 


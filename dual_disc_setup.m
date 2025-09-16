%% Motorcycle Braking Performance – Stock vs Custom Dual Disc
% Author: Praveen Kumar V
% Bike: KTM RC390 (2016)
% Project: Custom Dual-Disc Conversion

clc; clear; close all;

%% Constants
g = 9.81;               % gravity [m/s^2]
bike_mass = 172;        % dry weight [kg]
rider_mass = 70;        % avg rider [kg]
total_mass = bike_mass + rider_mass;

wheel_radius = 0.30;    % m (approx effective radius of wheel)
mu_tyre = 1.1;          % friction coefficient (sport tyre)

%% Stock Setup (Single Disc)
disc_dia_stock = 0.320;   % 320 mm
master_dia_stock = 0.014; % 14 mm master cylinder
n_pistons_stock = 4;      % 4 piston caliper
piston_dia_stock = 0.030; % 30 mm caliper pistons

%% Custom Setup (Dual Disc)
disc_dia_mod = 0.320;     % still 320 mm
master_dia_mod = 0.017;   % 17 mm master cylinder
n_pistons_mod = 8;        % dual calipers = 8 pistons
piston_dia_mod = 0.030;   % assume same piston dia

%% Hydraulic Calculations
% Areas
A_master_stock = pi*(master_dia_stock/2)^2;
A_master_mod   = pi*(master_dia_mod/2)^2;

A_caliper_stock = n_pistons_stock * pi*(piston_dia_stock/2)^2;
A_caliper_mod   = n_pistons_mod * pi*(piston_dia_mod/2)^2;

% Hydraulic ratio
HR_stock = A_caliper_stock / A_master_stock;
HR_mod   = A_caliper_mod   / A_master_mod;

%% Assume rider applies same lever force
lever_force = 200; % N (hard braking)

% Line pressure (neglecting losses)
P_line_stock = lever_force / A_master_stock;
P_line_mod   = lever_force / A_master_mod;

% Clamp force (per caliper setup)
F_clamp_stock = P_line_stock * A_caliper_stock;
F_clamp_mod   = P_line_mod   * A_caliper_mod;

%% Braking Torque
radius_eff = disc_dia_stock/2 * 0.9; % effective radius (90%)
mu_pad = 0.4; % pad-disc friction

T_stock = F_clamp_stock * mu_pad * radius_eff;
T_mod   = F_clamp_mod   * mu_pad * radius_eff;

%% Max Braking Force @ tyre
F_brake_stock = T_stock / wheel_radius;
F_brake_mod   = T_mod   / wheel_radius;

% Limit by tyre-road grip
F_max = mu_tyre * total_mass * g;
F_brake_stock = min(F_brake_stock, F_max);
F_brake_mod   = min(F_brake_mod, F_max);

%% Stopping Distance from 100 km/h
v0 = 100/3.6; % m/s

a_stock = F_brake_stock / total_mass;
a_mod   = F_brake_mod   / total_mass;

d_stock = v0^2 / (2*a_stock);
d_mod   = v0^2 / (2*a_mod);

%% Display Results
fprintf('=== Braking Performance (100 km/h to 0) ===\n');
fprintf('Stock setup: Decel = %.2f m/s^2, Stopping distance = %.2f m\n', a_stock, d_stock);
fprintf('Custom setup: Decel = %.2f m/s^2, Stopping distance = %.2f m\n', a_mod, d_mod);

%% Plot Comparison
labels = {'Stock (Single Disc)', 'Custom (Dual Disc)'};
stopping_dist = [d_stock d_mod];
brake_force   = [F_brake_stock F_brake_mod];

figure;
subplot(1,2,1)
bar(stopping_dist)
set(gca,'xticklabel',labels)
ylabel('Stopping Distance (m)')
title('Stopping Distance Comparison')

subplot(1,2,2)
bar(brake_force)
set(gca,'xticklabel',labels)
ylabel('Braking Force (N)')
title('Braking Force Comparison')

sgtitle('Motorcycle Braking Upgrade: Stock vs Dual-Disc Custom')

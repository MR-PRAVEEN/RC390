# Motorcycle Braking Performance: Stock vs Custom Dual-Disc Conversion

**Author:** Praveen Kumar V  
**Bike:** KTM RC390 (2016)  
**Project:** Custom Dual-Disc Conversion  

---

## Overview

This project analyzes the braking performance improvements achieved by upgrading a KTM RC390’s stock single-disc front brake to a custom dual-disc setup. Using MATLAB simulations, we compare hydraulic and mechanical braking characteristics, maximum deceleration, and stopping distances from 100 km/h.  

The goal is to quantify the performance gains from increasing caliper piston count and master cylinder size while keeping the disc diameter unchanged, providing insights into the effectiveness of a dual-disc conversion for street and track use.

---

## Bike & Braking Setup

**Stock Setup (Single Disc)**  
- Disc diameter: 320 mm  
- Master cylinder: 14 mm  
- Caliper: 4 pistons  

**Custom Setup (Dual Disc)**  
- Disc diameter: 320 mm (per disc)  
- Master cylinder: 17 mm  
- Caliper: 8 pistons (dual setup)  

**Constants & Assumptions:**  
- Bike mass: 172 kg (dry)  
- Rider mass: 70 kg  
- Wheel radius: 0.30 m  
- Tyre-road friction: 1.1 (sport tyre)  
- Rider lever force: 200 N  
- Pad-disc friction: 0.4  

---

## Methodology

1. Compute master cylinder and caliper piston areas.  
2. Calculate hydraulic ratios for stock vs custom setups.  
3. Estimate line pressure and clamp force assuming the same lever input.  
4. Determine braking torque using effective disc radius and pad friction.  
5. Convert torque to wheel braking force, limited by tyre-road grip.  
6. Estimate stopping distance from 100 km/h using the calculated deceleration.  

---

## Results

| Setup                  | Deceleration (m/s²) | Stopping Distance (m) |
|------------------------|-------------------|---------------------|
| Stock (Single Disc)     | `a_stock`         | `d_stock`           |
| Custom (Dual Disc)      | `a_mod`           | `d_mod`             |

**Insights:**  
- Dual-disc conversion significantly increases braking torque and clamp force.  
- Stopping distance is reduced due to higher hydraulic leverage and piston area.  
- Tyre-road friction remains the limiting factor for maximum braking performance.  

---

## Visualization

**Stopping Distance Comparison**  
![Stopping Distance](./images/stopping_distance.png)  

**Braking Force Comparison**  
![Braking Force](./images/braking_force.png)  

*Note: Replace placeholders with your MATLAB-generated plots.*

---

## MATLAB Simulation

The repository includes a fully annotated MATLAB script:  

```matlab
% File: braking_simulation.m
% Calculates braking torque, force, and stopping distance for stock and custom setups
clc; clear; close all;
% Constants and parameters
% ... [rest of your MATLAB code]

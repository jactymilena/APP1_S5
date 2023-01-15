%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

% Runner les sections individuellement

%% Exercice 1 (proc 1, ex 3)

% Phase 1 
dt = 0.01;
val_t1 = 18.87;
val_t2 = 71.125;

t1 = [0:dt:val_t1-dt]';
t2 = [val_t1:dt:val_t1+val_t2-dt]';
t3 = [val_t1+val_t2:dt:val_t1+val_t2+val_t1]';

a_max = 5.886;
v_max = 111.1;
val_d1 = 1048.71;
val_d2 = 7902.5;

% Déplacement
d1 = a_max*((t1.^2)/2);
d2 = v_max*(t2-val_t1) + val_d1;
d3 = -(a_max/2)*(t3-val_t1-val_t2).^2 + v_max*(t3-val_t1-val_t2) + val_d1 + val_d2;

figure
plot(t1, d1)
hold on
plot(t2, d2)
plot(t3, d3)
xlabel('Temps (s)')
ylabel('Déplacement')
hold off

% Vitesse
l = size(t2);

v1 = a_max*t1;
v2 = v_max*ones(size(t2));
v3 = -a_max*(t3-val_t1-val_t2)+v_max;

figure
plot(t1, v1)
hold on
plot(t2, v2)
plot(t3, v3)
xlabel('Temps (s)')
ylabel('Vitesse')
hold off

%% Exercice 2 (proc 1, ex 4)

dteta = 0.01;
teta = [0:dteta:2*pi]';
OmegaOB = 2*pi;
val_OB = 0.1;
val_AB = 0.45;

sin_beta = (val_OB/val_AB)*(1 + cos(teta));
cos_beta = sqrt(1-sin_beta.^2);

OmegaAB = -(val_OB * OmegaOB * sin(teta)) ./ (val_AB * cos_beta);
VAx = - (val_OB*OmegaOB.*cos(teta)) + (val_AB*OmegaAB.*sin_beta);

AlphaAB = (-val_OB*(OmegaOB.^2).*cos(teta) + val_AB*(OmegaAB.^2).*sin_beta) ./ (val_AB*cos_beta);
AAx = val_OB.*(OmegaOB.^2).*sin(teta) + val_AB.*(OmegaAB.^2).*cos_beta + val_AB.*AlphaAB.*sin_beta;

figure
plot(VAx)
xlabel('Temps (s)')
ylabel('Vitesse linéaire (m/s)')
title('Vitesse linéaire de la lame en fonction de teta')

figure
plot(teta, OmegaAB)
xlabel('Temps (s)')
ylabel('Vitesse angulaire (rad/s)')
title('Vitesse angulaire de la barre AB en fonction de teta')

figure
plot(AAx)
xlabel('Temps (s)')
ylabel('Accélération linéaire (m/s^2)')
title('Accélération linéaire de la lame en fonction de teta')

figure
plot(teta, AlphaAB)
xlabel('Temps (s)')
ylabel('Accélération angulaire (rad/s^2)')
title('Accélération angulaire de la barre AB en fonction de teta')

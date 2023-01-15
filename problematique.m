%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Cinématique - Préparation
omega_ob = 25;       % rad/s
l = 0.25;            % m

dteta = 0.01;
teta = [0:dteta:(pi/3)]';

%% Cinématique - Mouvement horizonral 

% Vecteur position x_a
x_ha = 2 * l .* cos(teta);

subplot(3, 1, 1)
plot(teta, x_ha)
xlabel('Temps (s)')
ylabel('Déplacement x_a (m)')
title('Déplacement horizontal de A en fonction de thêta')

% Vitesse v_a
v_ha = -2 * l * omega_ob .* sin(teta);

subplot(3, 1, 2)
plot(teta, v_ha)
xlabel('Temps (s)')
ylabel('Vitesse v_a (m/s)')
title('Vitesse de A en fonction de thêta')

% Accélération acc_a
acc_ha = -2 * l * (omega_ob^2) .* cos(teta);

subplot(3, 1, 3)
plot(teta, acc_ha)
xlabel('Temps (s)')
ylabel('Accélération acc_a (m/s)')
title('Accélération de A en fonction de thêta')

%% Cinématique - Mouvement vertical

sin_teta = -sqtr(1 - cos(teta).^2)
cos_teta = -sqtr(1 - sin(teta).^2)

% Vecteur position x_a
x_ha = 2*l.*cos(teta);.

subplot(3, 1, 1)
plot(teta, x_ha)
xlabel('Temps (s)')
ylabel('Déplacement x_a (m)')
title('Déplacement horizontal de A en fonction de thêta')

% Vitesse v_a
v_ha = -2*l*omega_ob.*sin(teta);

subplot(3, 1, 2)
plot(teta, v_ha)
xlabel('Temps (s)')
ylabel('Vitesse v_a (m/s)')
title('Vitesse de A en fonction de thêta')



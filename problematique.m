%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Partie 1 - Cinématique - Préparation
omega_ob = 25;       % rad/s
l = 0.25;            % m

dteta = 0.01;
teta = [0:dteta:(pi/3)]';

%% Partie 1 - Cinématique - Mouvement horizontal 

% Vecteur position x_a
phi = -teta;
phiPrime = -omega_ob.*cos(teta)./cos(phi);
phiPrimePrime = ((omega_ob.^2).*sin(teta)+(phiPrime).^2.*sin(phi))./cos(phi);

x_ha = l*(cos(teta) + cos (phi));

figure
subplot(3, 1, 1)
plot(teta, x_ha)
ylabel('Déplacement x_a (m)')
xlabel('Angle \theta: 0 \leq \theta \leq \pi/3')
title('Déplacement horizontal de A en fonction de \theta')


% Vitesse v_a
v_ha = l*(-omega_ob.*sin(teta)-sin(phi).*phiPrime);

subplot(3, 1, 2)
plot(teta, v_ha)
xlabel('Angle \theta: 0 \leq \theta \leq \pi/3')
ylabel('Vitesse v_a (m/s)')
title('Vitesse de A en fonction de thêta')

% Accélération acc_a
acc_ha = l*((-omega_ob.^2).*cos(teta)-phiPrime.*cos(phi)+phiPrimePrime.*sin(phi));

subplot(3, 1, 3)
plot(teta, acc_ha)
xlabel('Angle \theta: 0 \leq \theta \leq \pi/3')
ylabel('Accélération \gamma (m/s)')
title('Accélération de A en fonction de thêta')

%% Partie 1 - Cinématique - Mouvement vertical

% Vecteur position y_va
y_va = l*(sin(teta) - sqrt(2.*cos(teta)-(cos(teta)).^2));
%y_va = l.*( sin(teta) + ( (cos(teta).^2) - (2.*cos(teta)) ).^(1/2) );  

figure
subplot(2, 1, 1)
plot(teta, y_va)
xlabel('Angle \theta: 0 \leq \theta \leq \pi/3')
ylabel('Déplacement y_a (m)')
title('Déplacement vertical de A en fonction de \theta')

% Vitesse v_va
%v_va1 = l*omega_ob.*( cos(teta) + ( (sin(2.*teta)-(2.*sin(teta)) / 2*(2 - (cos(teta)).^2 + 2*cos(teta)).^(1/2)) ));
num1 = sin(2.*teta) - 2.*sin(teta);
denum1 = 2 .* (( 2.*cos(teta) - cos(teta).^2 ).^(1/2));
fraction1 = (num1) ./ (denum1);

v_va1 = l*omega_ob.*( cos(teta) - fraction1 );

subplot(2, 1, 2)
plot(teta, v_va1)
xlabel('Angle \theta: 0 \leq \theta \leq \pi/3')
ylabel('Vitesse v_a (m/s)')
title('Vitesse verticale de A en fonction de \theta')

%% Partie 2 - Préparation

dphi = 0.01;
phi = [-(pi/3):dphi:(pi/3)]';
l0 = 0.5;
l = 0.25;
m_a = 0.1;
m_ba = 1;
alpha_ba = 5;
g = 9.8;

%% Partie 2 - Statique et dynamique

% Statique

C_Bs = l*g.*cos(phi).*(m_a+(m_ba/2));
figure
subplot(2, 1, 1)
plot(phi, C_Bs)
%axis([(-pi/3) (pi/3) -1 -0.4])
xlabel('Angle \theta: -\pi/3 \leq \phi \leq \pi/3')
ylabel('Couple Cb en statique (N*m)')
title('Couple Cb en fonction de \phi en statique')

% Dynamique

I = m_a*l.^2 + (m_ba*l.^2)/3;
C_Bd = I*alpha_ba + g*l.*cos(phi).*((m_ba/2) + m_a);

subplot(2, 1, 2)
plot(phi, C_Bd)
%axis([(-pi/3) (pi/3) -700 -100])
xlabel('Angle \theta: -\pi/3 \leq \phi \leq \pi/3')
ylabel('Couple Cb en dynamique (N*m)')
title('Couple Cb en fonction de \phi en dynamique')


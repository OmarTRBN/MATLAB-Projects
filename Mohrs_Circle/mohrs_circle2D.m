sigma_x = input("Enter the value for sigma_x: ");
sigma_y = input("Enter the value for sigma_y: ");
tao = input("Enter the value for tao: ");

% % Testing values
% sigma_x = 67;
% sigma_y = 12;
% tao = -54;

% Mohr circle parameters
sigma_avg = (sigma_x + sigma_y)/2;
radius = sqrt(((sigma_x - sigma_y)/2)^2 + tao^2);
center = [sigma_avg, 0];
extension_length = 10;

% Main x and y axes data points
x_axis = linspace(0, sigma_avg + radius + extension_length);
y_axis = linspace(-(radius + extension_length), radius + extension_length);

% Generate the coordinates for the circle
theta = linspace(0, 2*pi, 100);
x_circle = center(1) + radius * cos(theta);
y_circle = center(2) + radius * sin(theta);

close all;  % Close all open figures

% Draw main x and y axes
line([min(x_axis), max(x_axis)], [0, 0], ...
'Color', 'k', 'LineWidth', 1); % x-axis (black line)
line([0, 0], [min(y_axis), max(y_axis)], ...
'Color', 'k', 'LineWidth', 1); % y-axis (black line)

hold on;

% Plot the circle
plot(x_circle, y_circle,'Color','b','LineWidth',2);

% Plot circle x and y axes
% The 'line' function: line([x1,x2],[y1,y2]) then connects the coordinates;
line([center(1) - radius, center(1) + radius], [center(2), center(2)], ...
'Color', 'k', 'LineWidth', 1,'LineStyle','--');  % Circle x-axis
line([center(1), center(1)], [center(2) - radius, center(2) + radius], ...
'Color', 'k', 'LineWidth', 1,'LineStyle','--');  % Circle y-axis
title("Mohr's Circle");

% Plot angle of rotation
angle_of_rotation = rad2deg(0.5 * atan(2 * tao/(sigma_x - sigma_y)));
line([center(1), sigma_x], [0, -tao], ...
'Color', 'g', 'LineWidth', 2);

hold on;

% Plot certain points
plot(sigma_x, -tao, 'ro', 'MarkerFaceColor', 'r');

title("Mohr's Circle");
axis equal;
grid on;                
hold off;

sigma_curve = (sigma_x + sigma_y)/2 + 0.5*(sigma_x - sigma_y)*cos(2*theta) + tao*sin(2*theta);
tao_curve = -0.5*(sigma_x - sigma_y)*sin(2*theta) + tao*cos(2*theta);

% Print important values
fprintf("################################################\n")
fprintf("Angle of rotation (theta_p) = %d\n", angle_of_rotation);
fprintf("Angle of the plane on which" + ...
    " the maximum shear stress acts (theta_s) = %d\n", angle_of_rotation-45);
fprintf("Radius of circle = %d\n", radius)

% Plot sigma and tao curves
figure;
plot(theta.*(180/pi), sigma_curve);
hold on;
plot(theta.*(180/pi), tao_curve);

grid on;
legend("Sigma Curve", "Tao Curve");
xlabel('Angle in Degrees');
ylabel('Values for sigma and tao');
title("Sigma and Tao curves");

% Calculate sigma' and tao' for desired orientation
theta_d = input("Enter the value for the desired angle in degrees: ");
sigma_x_d = sigma_avg + 0.5*(sigma_x - sigma_y)*cos(2*deg2rad(theta_d)) + tao*sin(2*deg2rad(theta_d))
sigma_y_d = sigma_avg + 0.5*(sigma_x - sigma_y)*cos(2*deg2rad(theta_d+90)) + tao*sin(2*deg2rad(theta_d+90))
tao_d = -0.5*(sigma_x - sigma_y)*sin(2*deg2rad(theta_d)) + tao*cos(2*deg2rad(theta_d))





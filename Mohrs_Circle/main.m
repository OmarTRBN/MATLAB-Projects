% Stress values
sigma_x = input("Enter the value for sigma_x: ");
sigma_y = input("Enter the value for sigma_y: ");
tao = input("Enter the value for tao: ");

% Mohr circle parameters
sigma_avg = (sigma_x + sigma_y)/2;
radius = sqrt(((sigma_x - sigma_y)/2)^2 + tao^2);
center = [sigma_avg, 0];
extension_length = 10;

% Main x and y axes data points
x_axis = linspace(0, sigma_avg + radius + extension_length);
y_axis = linspace(-(radius + extension_length), radius + extension_length);

% Generate the coordinates for the circle
theta_circle = linspace(0, 2*pi, 100);
x_circle = center(1) + radius * cos(theta_circle);
y_circle = center(2) + radius * sin(theta_circle);

hold off;
hold on;

% Draw main x and y axes
line([min(x_axis), max(x_axis)], [0, 0], ...
    'Color', 'k', 'LineWidth', 2); % x-axis (black line)
line([0, 0], [min(y_axis), max(y_axis)], ...
    'Color', 'k', 'LineWidth', 2); % y-axis (black line)

% Plot the circle
plot(x_circle, y_circle,'Color','b','LineWidth',2);

% Plot circle x and y axes
% The 'line' function: line([x1,x2],[y1,y2]) then connects the coordinates;
line([center(1) - radius, center(1) + radius], [center(2), center(2)], ...
    'Color', 'k', 'LineWidth', 1,'LineStyle','--');  % Circle x-axis
line([center(1), center(1)], [center(2) - radius, center(2) + radius], ...
    'Color', 'k', 'LineWidth', 1,'LineStyle','--');  % Circle y-axis

% Plot angle of rotation
theta = 0.5 * atan(2 * tao/(sigma_x - sigma_y));
line([center(1), sigma_avg + sigma_x/2 - sigma_y/2], [0, -tao], ...
    'Color', 'g', 'LineWidth', 2);

axis equal;
grid on;
hold off;
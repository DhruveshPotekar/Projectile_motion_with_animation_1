clear all 
close all
clc

%inputs 
Vel = 35;
angle = 45;
g = 9.81;
Boundry = 75; 

%to_convert_from_degree_to_radians
theta = unitsratio('rad','deg')*angle; 

%velocity_components
u = Vel*cos(theta);
v = Vel*sin(theta);

%to_determine_time_of_flight
time_of_flight = (2*v)/g ;
t = linspace(0,time_of_flight,100);

%displacement_in_x_and_y_directions
x = u*t;
y = v*t - 0.5*g*t.^2;

%animation
%'for'_is_used_to_plot_about_everypoint
for i = 1:length(x) 
    
    plot(x(i),y(i),'o','MarkerSize',10,'color','g');
    hold on
    pause(0.05)
    xlabel('distance in X direction in meter')
    ylabel('distance in Y direction in meter')
    
end



%to_find_maximum_height_reached
max_height_y = max(y);
maxpoint_index = find(y == max(y));

%to_show_the_max_point
plot(x(maxpoint_index),y(maxpoint_index),'r*','MarkerSize',12);

%to_determine_whether_its_a_six
six = max(x);

if six > Boundry
    disp('its a six')
else 
    disp('its not a six')
end     

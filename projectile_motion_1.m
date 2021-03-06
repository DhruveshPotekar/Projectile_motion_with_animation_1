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
    
    figure(1)
    plot(x(i),y(i),'o','MarkerSize',5,'color','g');
    hold on
    pause(0.05)
    xlabel('distance in X direction in meter','FontSize',12,'FontWeight','bold')
    ylabel('distance in Y direction in meter','FontSize',12,'FontWeight','bold')
    
    F(i) = getframe(gcf); 
  
end

%to write video data to an AVI file with Motion JPEG compression
video = VideoWriter('projectile_motion.avi','Uncompressed AVI');
video.FrameRate = 60;

open(video)
%to write data from an array to the video file associated with video
writeVideo(video,F);
close(video)

%to_find_maximum_height_reached
max_height_y = max(y);
maxpoint_index = find(y == max(y));

%to_show_the_max_point
plot(x(maxpoint_index),y(maxpoint_index),'r*','MarkerSize',15);

%to_determine_whether_its_a_six
six = max(x);

if six > Boundry
    disp('its a six')
else 
    disp('its not a six')
end     

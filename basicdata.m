clc ; clear ; close all;


      global tg g cir dt mycircle mypolygone pol ;
    
         a=1;    vel=1;
tg=-90;                                               % angle giving direction to gravity
g_m=6;                                                % gravilty magnitude
g=g_m*[cosd(tg) sind(tg)];                            % garvity vector
cir=0;                                                % for counting no of circle 
pol=0;                                                % for countig number of objects or polygon
dt=.01;                                               % time intervall    
%% structure variable

mycircle=struct('han',{},'linehan',{},'anchor',{},'mass',{},...
    'weight',{},'vel',{},'collision',{});

mypolygone=struct('han',{},'slope',{},'theta',{},'cons',{},'collision',{});

poscir_save=struct('position',{},'x',{},'y',{});

poly_save=struct('x_data',{},'y_data',{});
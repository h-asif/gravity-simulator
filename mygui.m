%% Basic GUI functionality file
function mygui()
global axis_h1 fig stop_gui drag_gui run_gui circle_gui  polygone_gui mhold pause_gui;
%% axis and figure
mhold=0;
fig = figure('name', 'PHYSICS ILLUSTRATOR','menubar','none');
scrsz = get(0,'ScreenSize');
set(fig,'Position',[0 0 scrsz(3) scrsz(4)])
% sse=imread('sselogo.jpg');
%  imresize(80,scrsz(4)-90,sse)
% % imshow(sse)
axis_h1 = axes('Units','pixels','Position',[80,30,scrsz(3)-80,scrsz(4)-100],'xtick',[],'ytick',[]);
set(axis_h1,'xlim',[0 100],'ylim',[0 51.9454])
hold(axis_h1);
 

%% gui componenets handles

tex=uicontrol('Style','text','String','PHYSICS ILLUSTRATOR  CS-100/SSE/LUMS','Position',[310,700,840,50],'fontsize',30,'fontweight','bold');
align(tex,'distributed','center')
help_gui=uicontrol('Style','pushbutton','String','HELP','units', 'pixels', 'Position',[0 668 80 30],'fontweight','bold','fontsize',10);
run_gui= uicontrol('Style','pushbutton','String','RUN','units', 'pixels', 'Position',[0,588,80,80],'fontsize',15,'fontweight','bold');
pause_gui= uicontrol('Style','pushbutton','String','PAUSE','units', 'pixels', 'Position',[0,558,80,30],'fontweight','bold','fontsize',10);
stop_gui= uicontrol('Style','pushbutton','String','STOP','units', 'pixels', 'Position',[0,528,80,30],'fontweight','bold','fontsize',11);
reset_gui=uicontrol('Style','pushbutton','String','RESET','units', 'pixels', 'Position',[0,498,80,30],'fontweight','bold','fontsize',10);
save_gui= uicontrol('Style','pushbutton','String','SAVE','units', 'pixels', 'Position',[0,468,80,30],'fontweight','bold','fontsize',10);
load_gui= uicontrol('Style','pushbutton','String','LOAD','units', 'pixels', 'Position',[0,438,80,30],'fontweight','bold','fontsize',10);

circle_gui = uicontrol('Style','pushbutton','String','circle','units', 'pixels', 'Position',[0,408,80,30],'fontweight','bold','fontsize',10);
uicontrol('Style','text','String','POLYGON','Position',[0,380,80,18],'fontsize',8,'fontweight','bold');

polygone_gui=uicontrol('Style','popupmenu','String',{'3-SIDED','4-SIDED','5-SIDED','6-SIDED','7-SIDED',...
    '8-SIDED','9-SIDED','10-SIDED'},'Position',[0,355,80,25],'fontweight','bold','fontsize',8);

%% gui components function
%  set(stop_gui,'callback','mydraw');
set(help_gui,'callback',@myhelp);
set(drag_gui,'callback','mydrag');
set(run_gui,'callback','myrun');
set(circle_gui,'callback','drawcircle');
set(polygone_gui,'callback',@mychoice);
 set(save_gui,'callback','mysave');
 set(load_gui,'callback','myload');
 set(reset_gui,'callback','physicsillustrator');
 set(pause_gui,'callback','mypause')
    
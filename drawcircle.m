function  drawcircle()
%DRAWCIRCLE Draw a circle
%   Detailed explanation goes here

cx=[]; cy=[];   markerc=[];  circle=[];global cir mycircle g;
 gui_offon(0)
for t=1:2
    [cx(t) cy(t)]=ginput(1);
    markerc(t)=rectangle('position',[[cx(t) cy(t)]-.1/2 .1 .1],...
        'facecolor','r','curvature',[1 1]);
end
delete(markerc);
cir=cir+1;
rad=norm([cx(1) cy(1)]-[cx(2) cy(2)]);
circle.han=rectangle('position',[[cx(1) cy(1)]-rad rad*[2 2]],...
    'curvature',[1 1],'linewidth',1,'facecolor',[.811 .811 .811]);
% circle.linehan=line([cx(1) cx(2)],[cy(1) cy(2)],'linewidth',1);
circle.linehan=0;
%% ancher
body=menu('mobility','anchor','moveable');
if body==1
    circle.anchor=1;
    set(circle.han,'facecolor',[1 0.92 0.70])
else
    circle.anchor=0;
end

circle.mass=100*pi*rad^2;
circle.weight=circle.mass*g;
circle.vel=[0 0];
circle.collision=0;
mycircle(cir)=circle;

hcmenu = uicontextmenu;
item1 = uimenu(hcmenu, 'Label', 'start drag', 'Callback','mydrag2');
item2 = uimenu(hcmenu, 'Label', 'velocity', 'Callback','my_velocity');

set(circle.han,'uicontextmenu',hcmenu)
 gui_offon(1)
end


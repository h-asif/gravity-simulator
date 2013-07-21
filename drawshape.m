function  drawshape(i)
%DRAWshape draw a polygone of i sides  
global mypolygone pol;
 gui_offon(0)
x_h=zeros(1,i); y_h=zeros(1,i); markerc=zeros(1,i);  shape=[]; pol=pol+1;
%% initial point taking processes
for t=1:i
[x_h(t) y_h(t)]=ginput(1);
  markerc(t)=rectangle('position',[[x_h(t) y_h(t)]-.1/2 .1 .1],...
      'facecolor','r','curvature',[1 1]);
end
delete(markerc); 
%% handle
shape.han=fill([x_h x_h(1)],[y_h y_h(1)],[1 0.92 0.70]);

%% slope and constant and collision value for each line
xdata_h=[x_h x_h(1)]; ydata_h=[y_h y_h(1)]; 
for r=1:i;
shape.slope(r)=(ydata_h(r)-ydata_h(r+1))/(xdata_h(r)-xdata_h(r+1));
shape.theta(r)=atand(shape.slope(r));
shape.cons(r)=-ydata_h(r)+shape.slope(r)*xdata_h(r);
shape.collision(r)=0;
end
mypolygone(pol)=shape;


% hcmenu = uicontextmenu;
% item1 = uimenu(hcmenu, 'Label', 'start drag', 'Callback','mydrag2');
% set(shape.han,'uicontextmenu',hcmenu)
gui_offon(1)
end


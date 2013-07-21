function myhelp(src,evt )
%MYHELP Summary of this function goes here
%   Detailed explanation goes here
clc
fig2 = figure('name', 'MY HELP','menubar','none');
scrsz = get(0,'ScreenSize');
set(fig2,'Position',[0 0 scrsz(3) scrsz(4)])
axis_h1 = axes('Units','pixels','Position',[0,0,scrsz(3),scrsz(4)],'xtick',[],'ytick',[]);
set(axis_h1,'xlim',[0 100],'ylim',[0 51.9454])
close_gui= uicontrol('Style','pushbutton','String','CLOSE','units', 'pixels', 'Position',[420,10,200,80],'fontsize',15,'fontweight','bold');
set(close_gui,'callback',{@myclose fig2})
text(15,46,'PHYSICS ILLUSTRATOR  CS-100/SSE/LUMS','fontname','Lucida Handwriting','fontsize',30,'fontweight','bold');
text(5,40,'DRAWCIRCLE:Draws a circle with two points first determine the centre and second radius','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,38,'as soon as the circle is created a menu pops up with two options anchor and moveable The anchor property makes','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
 text(5,36,'the circle fixed on the figure while the moveable property makes the circle a moveable object','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,34,'POLYGON:This button allows the user to choose from three to a maximum of ten points on the figure which','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,32,'will define the vertices of the closed polygon which is drawn starting from the first point and up until the last point','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,30,'which is rejoined with the first point','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,28,'SAVE:Any figure that the user has created can be saved to the hard disk in the current folder by pressing the save button','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,26,'LOAD:Any previously saved figure can be opened using the load button','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,24,'NOTE: A few premade examples are included in the examples folder','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,22,'RUN:The run functionality causes the simulation to run with the moveable objects acting under the force of gravity','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,20,'PAUSE:This button pause the running simulation To resume the simulation press the spacebar','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,18,'STOP: This button stops the simulation and returns the system to the state at the time of running the simulation','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)
text(5,16,'RSET:By clicking on this button the system will go back to the initial state that was at the time of running of program','fontweight','bold','fontname','Lucida Handwriting','fontsize',12)

end


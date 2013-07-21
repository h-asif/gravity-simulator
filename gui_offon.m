function  gui_offon(a)
%GUI_OFFON  Can off and on gui controll and buttons
%   Detailed explanation goes here
global  run_gui circle_gui  polygone_gui;
if a
    
set(run_gui,'callback','myrun');
set(circle_gui,'callback','drawcircle');
set(polygone_gui,'callback',@mychoice);
elseif ~a
  
set(run_gui,'callback','');
set(circle_gui,'callback','');
set(polygone_gui,'callback','');
end


end


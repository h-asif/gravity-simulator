function  mychoice(scr,evt)
%MYCHOICE decide no of sides of polygon

global polygone_gui

% option for the choic of shapes of polygon
switch get(polygone_gui,'value')
    case 1; drawshape(3);
    case 2; drawshape(4);
    case 3; drawshape(5);
    case 4; drawshape(6);
    case 5; drawshape(7);
    case 6; drawshape(8);
    case 7; drawshape(9);
    case 8; drawshape(10);
end

end




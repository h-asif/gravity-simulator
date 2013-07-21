function [a b] = efc_range( pc,pl,ml,x_r,y_r)
%efc_range pc is vector containing coordinates of centre and dia of circle
%pl is the point having slope ml x_r is range of x
% and y_r is the range of y
%   calculate the effective range for the collision check of circle with a
%   line
if ml==0;
    n=-inf;
elseif ml==inf || ml==-inf
    n=0;
else
    n=-1/ml;    % slope of line perpendicular to the touching line passing through centre
end
x=det([1 n*pc(1)-pc(2);1 ml*pl(1)-pl(2)])/det([-n 1;-ml 1]);
y=-det([-n n*pc(1)-pc(2);-ml ml*pl(1)-pl(2)])/det([-n 1;-ml 1]);
t=abs(atand(n));
if ~isempty(x_r)
    if ml==inf || ml==-inf
        x_nlr=min(x_r)-pc(3)/2;
        x_nur=max(x_r)+pc(3)/2;
        a=[x_nlr x_nur];
    elseif ml==0
        x_nlr=min(x_r);x_nur=max(x_r);
        a=[x_nlr x_nur];
    else
        x_nlr=min(x_r)-abs(pc(3)/2*cosd(t)-abs(min(x_r)-x));
        x_nur=max(x_r)+abs(pc(3)/2*cosd(t)-abs(max(x_r)-x));
        a=[x_nlr x_nur];
    end
else
    a=[];
end
if ~isempty(y_r)
    if ml==inf || ml==-inf
        y_nlr=min(y_r);  y_nur=max(y_r);
        b=[y_nlr y_nur];
    elseif ml==0
        y_nlr=min(y_r)-pc(3)/2;
        y_nur=max(y_r)+pc(3)/2;
        b=[y_nlr y_nur];
    else
        y_nlr=min(y_r)-abs(pc(3)/2*sind(t)-abs(min(y_r)-y));
        y_nur=max(y_r)+abs(pc(3)/2*sind(t)-abs(max(y_r)-y));
        b=[y_nlr y_nur];
    end
else
    b=[];
end


end



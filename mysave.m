%% save the basic data for files that can be run latter
% For cirlce
if cir
    for i=1:cir
        hanc(i).pos=get(mycircle(i).han,'position');
        hanc(i).color=get(mycircle(i).han,'facecolor');
    end
end

% For objects
    if pol
        for i=1:pol
            hano(i).x=get(mypolygone(i).han,'xdata');
            hano(i).y=get(mypolygone(i).han,'ydata');
            hano(i).color=get(mypolygone(i).han,'facecolor');
        end
    end
uisave
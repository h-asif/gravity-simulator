%% load saved files
uiopen
if pol
    for i=1:pol
        mypolygone(i).han=fill(hano(i).x,hano(i).y,hano(i).color);
    end
end
if cir
    for i=1:cir
        mycircle(i).han=rectangle('position',hanc(i).pos,'facecolor',hanc(i).color,'curvature',[1 1]);
        
    end
end


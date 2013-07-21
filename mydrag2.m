%% Drag the objects
global fig;
f_test=uint8('patch'); r_test=uint8('rectangle'); mouseLoc=zeros(2,3);
rm=get(gca,'CurrentPoint');
set(gcf, 'WindowButtonMotionFcn', ...
    'mouseLoc = get(gca, ''CurrentPoint'');');
a=1;d=0;
set(fig,'WindowButtonUpFcn','a=0')

if isequal(r_test,uint8(get(gco,'type')))
    x=get(gco,'position');
    mouseLoc(1,[1 2])=x([1 2]);
    while (a)
        set(gcf,'ButtonDownFcn','d=1')
        if(d)
            a=0;
        end
        posc=get(gco,'position');
        inv=mouseLoc(1,[1 2])-posc([1 2]);
        posc([1 2])=posc([1 2])+inv;
        set(gco,'position', posc);
        pause(.01)
    end
elseif isequal(f_test,uint8(get(gco,'type')))
    mouseLoc(1,[1 2])=rm([1 2]);
    while a
        set(gcf,'ButtonDownFcn','d=1')
        if(d)
            a=0;
        end
        x_l=get(gco,'xdata'); y_l=get(gco,'ydata');
        inv=mouseLoc(1,[1 2])-[mean(x_l(1:end-1)) mean(y_l(1:end-1))];
        x_l=x_l+inv(1);  y_l=y_l+inv(2);
        set(gco,'xdata',x_l,'ydata',y_l);
        pause(.01)
    end
end
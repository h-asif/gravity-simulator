%% getting position data of graphical handles
global stop_gui;
gui_offon(0)
stop_gui= uicontrol('Style','pushbutton','String','STOP','units', 'pixels', 'Position',[0,528,80,30],...
    'fontweight','bold','fontsize',11);
%% set circles properties
hcmenu = uicontextmenu;
item1 = uimenu(hcmenu, 'Label', 'start drag', 'Callback','mydrag2');
item2 = uimenu(hcmenu, 'Label', 'velocity', 'Callback','my_velocity');


%%
if cir
    for i=1:cir
        set(mycircle(i).han,'uicontextmenu',hcmenu)
        poscir_save(i).position=get(mycircle(i).han,'position');
        
    end
    
    
    %% saving data
    save('poscir_save');
    
    save test.mat;
    
    %% start motion
    vel=0;
    a=1;
    set(stop_gui,'callback','vel=1')
    while a
        
        
        if vel
            break
        end
        
        tic
        ballscollisioncheck;
        
        for t=1:cir
            if mycircle(t).anchor==1
                continue
                
            end
            collisiondetection(t);
            
            if mycircle(t).collision==0
                freefallcir(t)
            elseif mycircle(t).collision==1
                inclinemotion(t)
            end
        end
        
        pause(.01-toc)
    end
end
mydraw
 gui_offon(1)
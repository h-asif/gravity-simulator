function  collisiondetection(i)
%GIVEDISTANCEOFBALL detect the collision of the circle with object (line) and
%assign collision value to circle as well as objects'lines

global mypolygone mycircle cir pol; circle=[]; a=1; dis=100*ones(1,50);
%% Here it takes cicles one by one
if pol                                                                          % condition for file to execute further
    %     for i=1:cir;
    
    pos=get(mycircle(i).han,'position');                              % get cicle's centre's position
    pos([1 2])=pos([1 2])+(pos(3))/2;
    
    %% here it takes objects
    for t=1:pol
        
        xdata_obj=get(mypolygone(t).han,'xdata'); ydata_obj=get(mypolygone(t).han,'ydata');      % get x and y data of object
        
        %% here it takes objects'lines
        
        for s=1:length(xdata_obj)-1;
            
            %%%
%             mypolygone(t).theta(s)=(ydata_obj(s)-ydata_obj(1+s))/(xdata_obj(s)-xdata_obj(1+s));
% mypolygone(t).theta(s)=atand(mypolygone(t).theta(s));
% mypolygone(t).cons(s)=-ydata_obj(s)+mypolygone(t).theta(s)*xdata_obj(s);
%             %%%
            %% coner collison check
            
            cor=0;
            cor_v=[xdata_obj(s) ydata_obj(s)]-pos([1 2]);        %vector from point to centre of circle
            
            if norm(cor_v) <= pos(3)/2                           % collision condition
                cor=1; dis(s)=norm(cor_v);
                theta=atand(-cor_v(1)/cor_v(2));                           % angle for line perpendicular to line b/w circle's centre and point
                
            elseif(((pos(1))<max(xdata_obj([s s+1]))+pos(3)) && pos(1)>min(xdata_obj([s s+1]))-pos(3)) &&...
                    ((pos(2))<max(ydata_obj([s s+1])+pos(3)) && pos(2)>min(ydata_obj([s s+1]))-pos(3));
                
                dis(s)=abs(-(mypolygone(t).slope(s))*(pos(1))+pos(2)+mypolygone(t).cons(s))/...
                    (sqrt((mypolygone(t).slope(s))^2+1));
                if dis(s)<=pos(3)/2
                    
                    
                    if (abs(xdata_obj(s)-xdata_obj(s+1)) <= pos(3)) && (abs(ydata_obj(s)-ydata_obj(s+1)) <=pos(3))
                        
                        [xr yr]=efc_range(pos([1 2 3]),[xdata_obj(s) ydata_obj(s)],...     % if dy and dx are less than radius
                            mypolygone(t).slope(s),[xdata_obj(s) xdata_obj(s+1)],[ydata_obj(s) ydata_obj(s+1)]);
                        if   ((pos(1)>=xr(1) && (pos(1)<=xr(2))) && ((pos(2)>=yr(1) && (pos(2)<=yr(2)))))
                            
                            
                        else
                            dis(s)=100;
                        end
                    elseif   abs(xdata_obj(s)-xdata_obj(s+1)) <= pos(3)/2
                        
                        [xr yr]=efc_range(pos([1 2 3]),[xdata_obj(s) ydata_obj(s)],...     % if dx is less than radius
                            mypolygone(t).slope(s),[xdata_obj(s) xdata_obj(s+1)],[]);
                        
                        if ((pos(1)>=xr(1) && (pos(1)<=xr(2))) && ((pos(2))<max(ydata_obj([s s+1])) &&...
                                pos(2)>min(ydata_obj([s s+1]))))
                            
                        else
                            dis(s)=100;
                        end
                        
                    elseif (abs(ydata_obj(s)-ydata_obj(s+1)) <=pos(3)/2)
                        
                        [xr yr]=efc_range(pos([1 2 3]),[xdata_obj(s) ydata_obj(s)],...     % if dy is less than radius
                            mypolygone(t).slope(s),[],[ydata_obj(s) ydata_obj(s+1)]);
                        if ((pos(1)>=min(xdata_obj([s s+1])) && (pos(1)<=max(xdata_obj([s s+1])))) &&...
                                ((pos(2))<=yr(2) && pos(2)>=yr(1)))
                            
                            
                        else
                            dis(s)=100;
                        end
                    elseif  (((pos(1))<max(xdata_obj([s s+1]))+pos(3)/2) && pos(1)>min(xdata_obj([s s+1]))-pos(3)/2 &&...
                            ((pos(2))<max(ydata_obj([s s+1]))+pos(3)/2 && pos(2)>min(ydata_obj([s s+1]))-pos(3)/2))
                        
                        
                        [xr yr]=efc_range(pos([1 2 3]),[xdata_obj(s) ydata_obj(s)],...     % if dy is less than radius
                            mypolygone(t).slope(s),[xdata_obj(s) xdata_obj(s+1)],[ydata_obj(s) ydata_obj(s+1)]);
                        if   ((pos(1)>=xr(1) && (pos(1)<=xr(2))) && ((pos(2)>=yr(1) && (pos(2)<=yr(2)))))
                        else
                            dis(s)=100;
                        end
                        
                    else
                        
                        dis(s)=100;
                        
                        
                    end
                end
            end
            if dis(s)>(pos(3))/2
                mypolygone(t).collision(s)=0;
            end
            if dis(s)<=(pos(3))/2
                
                mypolygone(t).collision(s)=1;
                
                tv=atand(mycircle(i).vel(2)/mycircle(i).vel(1));
                if mycircle(i).vel(2)>0 && mycircle(i).vel(1)<0
                    tv=180+tv;
                elseif mycircle(i).vel(2)<0 && mycircle(i).vel(1)<0
                    tv=tv-180;
                end
                vel_m=norm(mycircle(i).vel);
                if (cor)
                    alpha=tv-theta;
                elseif (~cor)
                    alpha=tv-mypolygone(t).theta(s);
                end
                %                     alpha=90-+tv+mypolygone(t).theta(s);
                %                     mycircle(i).vel(2)=vel_m*(-cosd(alpha)*cosd(mypolygone(t).theta(s))+sind(alpha)*sind(mypolygone(t).theta(s)));
                %                     mycircle(i).vel(1)=vel_m*(cosd(alpha)*sind(mypolygone(t).theta(s))+sind(alpha)*cosd(mypolygone(t).theta(s)));
                
                mycircle(i).vel(2)=vel_m*(-sind(alpha)*cosd(mypolygone(t).theta(s))+cosd(alpha)*sind(mypolygone(t).theta(s)));
                mycircle(i).vel(1)=vel_m*(sind(alpha)*sind(mypolygone(t).theta(s))+cosd(alpha)*cosd(mypolygone(t).theta(s)));
                
                
            end
            if mypolygone(t).collision(s)==1
                break
            end
        end
        if sum(mypolygone(t).collision)
            mycircle(i).collision=1;
            break
        end
    end
    
    
    %     end
end

end
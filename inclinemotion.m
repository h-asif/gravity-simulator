function  inclinemotion( i)
%INCLINEMOTION give motion to a circle on inclind palne

global  mycircle mypolygone cir pol dt;

if cir
    % for i=1:cir
    
    %     if mycircle(i).collision==0
    %         freefallcir
    %     elseif mycircle(i).collision==1
    d_cir=[0 0];
    
    pos=get(mycircle(i).han,'position');
    pos([1 2])=pos([1 2])+(pos(3))/2;
    
    if pol
       
        for p=1:pol
%             ydata_h=get(mypolygone(p).han,'ydata'); xdata_h=get(mypolygone(p).han,'xdata');
            for l=1:length(mypolygone(p).theta)
                if mypolygone(p).collision(l)==0
                    continue
                end
%               mypolygone(p).theta(l)=(ydata_h(l)-ydata_h(l+1))/(xdata_h(l)-xdata_h(l+1));
% mypolygone(p).theta(l)=atand(mypolygone(p).theta(l));
% mypolygone(p).cons(l)=-ydata_h(l)+mypolygone(p).theta(l)*xdata_h(l);
                    
                
                nor_v=norm(mycircle(i).weight)*cosd(mypolygone(p).theta(l))*[sind(mypolygone(p).theta(l)) cosd(mypolygone(p).theta(l))];
                net_a=(mycircle(i).weight+nor_v)/(mycircle(i).mass);
                
                mycircle(i).vel=mycircle(i).vel+net_a*dt;
                d_cir=d_cir+mycircle(i).vel*dt;
                
                set(mycircle(i).han,'position',[[pos(1)+d_cir(1)...
                    pos(2)+d_cir(2)]-pos(3)/2 pos([3 4])]);
                mypolygone(p).collision(l)=0;
            end
        end
    end
    
    mycircle(i).collision=0;
end
% end
end


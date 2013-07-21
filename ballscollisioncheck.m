function ballscollisioncheck(  )
%BALLSCOLLISIONCHECK check colllision among the balls
%   Detailed explanation goes here
global mycircle cir;
for i=1:cir
    
    pos=get(mycircle(i).han,'position');
    r(i,1)=pos(3)/2;
    X(i,1)=pos(1)+pos(3)/2; X(i,2)=pos(2)+pos(3)/2;
end


for j=1:cir;
    for i=1:j;
        if (sqrt((X(j,1)-X(i,1))^2+(X(j,2)-X(i,2))^2) <= r(i,1)+r(j,1) && (sqrt((X(j,1)-X(i,1))^2+(X(j,2)-X(i,2))^2)) ~=0)
            
            vel_colballn(i,j)
            
        end;
        
    end;
    
    
end


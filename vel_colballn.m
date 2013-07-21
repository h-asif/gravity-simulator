function vel_colballn(i,j)
%VEL_COLBALL Summary of this function goes here
global mycircle;

for t=[i j]
    cir(t).pos=get(mycircle(t).han,'position');
    cir(t).pos([1 2])=cir(t).pos([1 2])+cir(t).pos(3)/2;
end

unv=[cir(i).pos(1)-cir(j).pos(1) cir(i).pos(2)-cir(j).pos(2)]/norm([cir(i).pos(1)-cir(j).pos(1) cir(i).pos(2)-cir(j).pos(2)]);
utv=[-unv(2) unv(1)];

if mycircle(i).anchor==1  || mycircle(j).anchor==1
    
    for t=[i j]
        
        if mycircle(t).anchor==0
            
            v1n=dot(unv,mycircle(t).vel); v1t=dot(utv,mycircle(t).vel);
            v1n=-v1n*unv; v1t=v1t*utv;
            mycircle(t).vel=v1n+v1t;
        end
        
    end
    
else
    
    v1n=dot(unv,mycircle(i).vel); v1t=dot(utv,mycircle(i).vel);
    v2n=dot(unv,mycircle(j).vel); v2t=dot(utv,mycircle(j).vel);
    
    v1nf=((mycircle(i).mass-mycircle(j).mass)*v1n+2*mycircle(j).mass*v2n)/...
        (mycircle(i).mass+mycircle(j).mass);
    v2nf=((mycircle(j).mass-mycircle(i).mass)*v2n+2*mycircle(i).mass*v1n)/...
        (mycircle(i).mass+mycircle(j).mass);
    v1nf=v1nf*unv; v1tf=v1t*utv;
    v2nf=v2nf*unv; v2tf=v2t*utv;
    mycircle(i).vel=v1nf+v1tf;  mycircle(j).vel=v2nf+v2tf;
    
end
end
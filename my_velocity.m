global mycircle cir
r_test=uint8('rectangle');

if isequal(r_test,uint8(get(gco,'type')))
    for i=1:cir
        if mycircle(i).han==gco
            pos=get(gco,'position');
            g1=ginput(1);
            
            mycircle(i).vel=(g1-([pos([1 2])+pos(3)/2]))/2;
        end
    end
end
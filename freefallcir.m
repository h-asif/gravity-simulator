function  freefallcir(i)
%FREEFALLCIR Make cicle fall freely under gravity
global cir g dt mycircle
% for i=1:cir;
   
    d_cir=[0 0];  
    
    pos_cir=get(mycircle(i).han,'position');
    pos_cir([1 2])=pos_cir([1 2])+pos_cir(3)/2;
    
    mycircle(i).vel=mycircle(i).vel+g*dt;
    d_cir=d_cir+mycircle(i).vel*dt;
    
    set(mycircle(i).han,'position',[[pos_cir(1)+d_cir(1) pos_cir(2)+d_cir(2)]-pos_cir(3)/2 pos_cir([3 4])]);
    
%     xdata_line=get(mycircle(i).linehan,'xdata');
%     ydata_line=get(mycircle(i).linehan,'ydata');
%     set(mycircle(i).linehan,'xdata',xdata_line,'ydata',ydata_line+y_cir);
% end
end
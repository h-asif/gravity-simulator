%% Whe prees draw buuton brings us to the initial condition;
 gui_offon(1)

if cir
load('poscir_save');

load test.mat;


for i=1:cir
    mycircle(i).vel=[0 0];
    set(mycircle(i).han,'position',poscir_save(i).position);
end

end
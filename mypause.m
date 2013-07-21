global mhold fig;
if mhold==0
    mhold=1;
    pause();
    scrsz = get(0,'ScreenSize');
set(fig,'Position',[0 0 scrsz(3) scrsz(4)])
else
    mhold=0;
end
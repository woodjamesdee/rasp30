//**************************** NMIRROR *********************************
if (blk_name{bl} =='nmirror') then
    for ss=1:scs_m.objs(bl).model.ipar(1)
        mputl("# nmirror "+string(bl)+" "+string(scs_m.objs(bl).model.ipar(2))+" "+string(ss),fd_w);
        nmirror_str= ".subckt nmirror in[0]=net"+string(blk(blk_objs(bl),2))+'_'+string(ss)+" out[0]=net"+ string(blk(blk_objs(bl),2+numofip))+'_' +string(ss);
        mputl(nmirror_str,fd_w);
        mputl("  ",fd_w);
        if scs_m.objs(bl).model.rpar(scs_m.objs(bl).model.ipar(1)*(1-1)+1) == 1 then
            plcvpr = %t;
            plcloc=[plcloc;'net'+string(blk(blk_objs(bl),2+numofip))+'_'+string(ss),string(scs_m.objs(bl).model.rpar(scs_m.objs(bl).model.ipar(1)*(1-1)+1+2*ss-1))+' '+string(scs_m.objs(bl).model.rpar(scs_m.objs(bl).model.ipar(1)*(1-1)+1+2*ss))+' 0'];
        end
    end
end

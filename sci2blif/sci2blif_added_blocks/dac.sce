//****************************** DAC ************************************
if(blk_name{bl}=='dac')  then
    Signal_DAC_check=1;
    dc{}=[]
    // DEDICATED PADS code
    fd_io= mopen(fname+'.pads','a+')
    for ss=1:scs_m.objs(bl).model.ipar(1)
        dac_loc_idx = dac_loc_idx +1;
        dc(1,1){1,ss}= strtod(dac_loc(loc_num,dac_loc_idx){2});
        //dac_net(blk(blk_objs(bl),2+numofip),1){}=dac_loc(dac_loc_idx,3){};
        mputl('net'+ string(blk(blk_objs(bl),2+numofip)) + "_"+ string(ss)+' ' + dac_loc(loc_num,dac_loc_idx){1},fd_io);
    end
    mclose(fd_io);
    dc_dac = dc(1,1){1,:};
    exec("~/rasp30/prog_assembly/libs/scilab_code/dc_compile.sce",-1);
    dc_compile(scs_m.objs(bl).model.opar(1),scs_m.objs(bl).model.rpar(1)',dc_dac);
end

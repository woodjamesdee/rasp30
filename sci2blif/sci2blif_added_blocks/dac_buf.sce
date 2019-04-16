//**************************** BUF DAC *********************************
if(blk_name{bl}=='dac_buf')  then
    dac_buf_loc_idx = dac_buf_loc_idx +1;
    fd_io= mopen (fname+'.pads','a+');  // DEDICATED PADS code
    mputl('net'+ string(blk(blk_objs(bl),2+numofip)) + ' ' + dac_buf_loc(loc_num,dac_buf_loc_idx){1},fd_io);
    mclose(fd_io);
end

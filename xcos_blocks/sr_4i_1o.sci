function [x,y,typ]=sr_4i_1o(job,arg1,arg2)
    // Copyright INRIA
    x=[];y=[];typ=[];
    select job
    case 'plot' then
        standard_draw(arg1)
    case 'getinputs' then
        [x,y,typ]=standard_inputs(arg1)
    case 'getoutputs' then
        [x,y,typ]=standard_outputs(arg1)
    case 'getorigin' then
        [x,y]=standard_origin(arg1)
    case 'set' then
        x=arg1;
        graphics=arg1.graphics;exprs=graphics.exprs
        model=arg1.model;
        while %t do
            [ok,in_out_num,exprs]=getvalue('Set shift register 4 input 1 output Parameters',['Number of Inputs'],list('vec',1),exprs)

            if ~ok then break,end

            if ok then
                model.in=[1;1;1;1]
                model.out=[1;1;1;1]
                model.ipar=in_out_num
                graphics.exprs=exprs;
                x.graphics=graphics;x.model=model
                break
            end
        end
    case 'define' then
        in_out_num =4
        model=scicos_model()
        //model.sim=list('c4_func',5)
        model.in=[1;1;1;1]
        model.in2=[1;1;1;1]
        model.intyp=[-1;-1;-1;-1]
        model.out=[1;1;1;1]
        model.out2=[1;1;1;1]
        model.outtyp=[-1;-1;-1;-1]
        model.ipar=in_out_num
        model.blocktype='d'
        model.dep_ut=[%f %t]

        exprs=[sci2exp(in_out_num)]
        gr_i=['txt=''sr_4i_1o '';';'xstringb(orig(1),orig(2),txt,sz(1),sz(2),''fill'')']
        x=standard_define([10 4],model,exprs,gr_i)
    end
endfunction

function fin_cat = junc(junc_num)
    global cat_num jlist

    jtmp1 = jlist(junc_num,1){}
    if jtmp1 ~= [] then
        cat_num(1,1){}=cat(2, cat_num(1,1){},jtmp1)
        jlist(junc_num,1){} = []
        junc(jtmp1)
    else
        fin_cat = %t
        return
    end

    jtmp2 = jlist(junc_num,2){}
    if jtmp2 ~= [] then
        cat_num(1,1){}=cat(2,cat_num(1,1){},jtmp2)
        jlist(junc_num,2){} = []
        junc(jtmp2)
        fin_cat = cat_num(1,1){}
        return
    else
        fin_cat = cat_num(1,1){}
        return
    end
//here
endfunction

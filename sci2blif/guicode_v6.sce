//Turn off the warning messages in the console
previousprot = funcprot(1) //integer with possible values 0, 1, 2 returns previous value
funcprot(0) //allows the user to specify what scilab do when such variables are redefined. 0=nothing, 1=warning, 2=error

gui=figure('figure_position',[750,200],'figure_size',[300,560],'auto_resize','on','background',[14],'figure_name','Rasp Design');
gui.color_map =  wintercolormap(32);

delmenu(gui.figure_id,gettext('File'));
delmenu(gui.figure_id,gettext('?'));
delmenu(gui.figure_id,gettext('Tools'));
delmenu(gui.figure_id,gettext('Edit'));
toolbar(gui.figure_id,'off');
handles.dummy = 0;
handles.email_box=uicontrol(gui,'unit','normalized','BackgroundColor',[0.9,0.9,0.9],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[13],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.065,0.937,0.875,0.045],'Relief','sunken','SliderStep',[0.01,0.1],'String','Enter your email ID','Style','edit','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','email_box','Callback','email_box_callback(handles)');
handles.text_box=uicontrol(gui,'unit','normalized','BackgroundColor',[0.9,0.9,0.9],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12.5],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.065,0.873,0.875,0.045],'Relief','flat','SliderStep',[0.01,0.1],'String','No File Selected','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','text_box','Callback','text_box_callback(handles)');
handles.Choose_Board=uicontrol(gui,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[5],'Min',[0],'Position',[0.065,0.795,0.4,0.055],'Relief','flat','SliderStep',[0.01,0.1],'String','Choose Board|3.0|3.0 A|3.0 N|3.0 H','Style','popupmenu','Value',[1 2 3 4 5],'VerticalAlignment','middle','Visible','on','Tag','Choose_Board','Callback','Choose_Board_callback(handles)');
handles.Choose_Chip=uicontrol(gui,'unit','normalized','BackgroundColor',[1,1,1],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.54,0.795,0.4,0.055],'Relief','sunken','SliderStep',[0.01,0.1],'String','Enter Chip Number','Style','edit','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Choose_Chip','Callback','Choose_Chip_callback(handles)'); 
handles.New_Design=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.065,0.695,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','New Design','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','New_Design','Callback','New_Design_callback(handles)');
handles.Choose_Design=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.065,0.592,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Choose Design ','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Choose_Design','Callback','Choose_Design_callback(handles)');
handles.Open_Design=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.065,0.489,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Open Design','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Open_Design','Callback','Open_Design_callback(handles)');
handles.Compile_Design=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.065,0.386,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Compile Design','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Compile_Design','Callback','Compile_Design_callback(handles)');
handles.Program_Design=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.065,0.283,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Program Design','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Program_Design','Callback','Program_Design_callback()');
handles.View_Routing=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.065,0.18,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','View Routing','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','View_Routing','Callback','View_Routing_callback(handles)');
handles.Reset_Com=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.065,0.0787,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Reset Com','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Reset_Com','Callback','Reset_Com_callback(handles)');
handles.Take_Data=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.54,0.695,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Take Data','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Take_Data','Callback','Take_Data_callback(handles)');
handles.Send_Email=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.54,0.592,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Send Email','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Send_Email','Callback','Send_Email_callback(handles)');
handles.Load_Data=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.54,0.489,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Load Remote Data','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Load_Data','Callback','Load_Data_callback(handles)');
handles.Choose_Netlist=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.54,0.386,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Choose Netlist','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Choose_Netlist','Callback','Choose_Netlist_callback(handles)');
handles.Program_Netlist=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.54,0.283,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Program Netlist','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Program_Netlist','Callback','Program_Netlist_callback(handles)');
handles.Choose_Swc_List=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.54,0.18,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Choose Switches','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Choose_Swc_List','Callback','Choose_Swc_List_callback(handles)');
handles.Program_SwcList=uicontrol(gui,'unit','normalized','BackgroundColor',[0.8,0.8,0.8],'Enable','on','FontAngle','normal','FontName','mukti narrow','FontSize',[12],'FontUnits','points','FontWeight','bold','ForegroundColor',[0,0,0],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.54,0.0787,0.4,0.08],'Relief','raised','SliderStep',[0.01,0.1],'String','Program Switches','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','Program_SwcList','Callback','Program_SwcList_callback(handles)');

exec('/home/ubuntu/rasp30/sci2blif/fpaacal_fcn.sce',-1);
exec('/home/ubuntu/rasp30/sci2blif/macroblif_gen_fcn.sce',-1);
exec('/home/ubuntu/rasp30/sci2blif/macrocab_gen_fcn.sce',-1);
exec('/home/ubuntu/rasp30/sci2blif/level1_sim_gen_fcn.sce',-1);
exec('/home/ubuntu/rasp30/sci2blif/block_doc_gen_fcn.sce',-1);
exec('/home/ubuntu/rasp30/sci2blif/send_email_ip_pw_fcn.sce',-1);
exec('/home/ubuntu/rasp30/sci2blif/dsgnmtrcs_fcn.sce',-1);
//exec("/home/ubuntu/rasp30/sci2blif/dsgnmtrcs.sce",-1);
exec('/home/ubuntu/rasp30/sci2blif/bcd_fcn.sce',-1);
exec("/home/ubuntu/rasp30/sci2blif/demo_examples/example_inputs.sce");

//Add custom menus
file_menu = uimenu("Parent", gui, "Label", gettext("Examples"),'ForegroundColor',[1,1,1]);
file19_menu = uimenu("Parent", file_menu, "Label", gettext("On chip"));
file23_menu = uimenu("Parent", file_menu, "Label", gettext("IO Pins"));
file1_menu = uimenu("Parent", file_menu, "Label", gettext("L1 Simulation"));
file31_menu = uimenu("Parent", file_menu, "Label", gettext("L2 Simulations"));

// demo_fname,com_prep_index,arb_msg_index
file20_menu = uimenu("Parent", file19_menu, "Label", gettext("DAC to ADC"), "callback", "demo_example_callback(""dac_adc_onchip"",""on"",""on"")");
file21_menu = uimenu("Parent", file19_menu, "Label", gettext("LPF"), "callback", "demo_example_callback(""lpf_onchip"",""on"",""on"")");
file22_menu = uimenu("Parent", file19_menu, "Label", gettext("C4"), "callback", "demo_example_callback(""c4_onchip"",""on"",""on"")");
file35_menu = uimenu("Parent", file19_menu, "Label", gettext("C4 with Min-Max detector"), "callback", "demo_example_callback(""c4_minmax_onchip"",""on"",""on"")");
file36_menu = uimenu("Parent", file19_menu, "Label", gettext("WTA"), "callback", "demo_example_callback(""wta_onchip"",""on"",""on"")");
file39_menu = uimenu("Parent", file19_menu, "Label", gettext("HHneuron"), "callback", "demo_example_callback(""hhn_onchip"",""on"",""on"")");
file40_menu = uimenu("Parent", file19_menu, "Label", gettext("Follower"), "callback", "demo_example_callback(""Follower"",""on"",""on"")");
file24_menu = uimenu("Parent", file23_menu, "Label", gettext("LPF"), "callback", "demo_example_callback(""lpf_offchip"",""on"",""off"")");
file25_menu = uimenu("Parent", file23_menu, "Label", gettext("Digital"), "callback", "demo_example_callback(""digital_offchip"",""on"",""off"")");
file26_menu = uimenu("Parent", file23_menu, "Label", gettext("C4"), "callback", "demo_example_callback(""c4_offchip"",""on"",""off"")"); 
file4_menu = uimenu("Parent", file1_menu, "Label", gettext("LPF"), "callback", "demo_example_callback(""lpf_l1_sim"",""off"",""on"")");
file5_menu = uimenu("Parent", file1_menu, "Label", gettext("C4"), "callback", "demo_example_callback(""c4_l1_sim"",""off"",""on"")");
file11_menu = uimenu("Parent", file1_menu, "Label", gettext("VMM+WTA"), "callback","demo_example_callback(""vmm_wta_l1_sim"",""off"",""on"")");
file32_menu = uimenu("Parent", file31_menu, "Label", gettext("nFET"), "callback", "demo_example_callback(""nmos_l2_sim"",""off"",""off"")");
file33_menu = uimenu("Parent", file31_menu, "Label", gettext("pFET"), "callback", "demo_example_callback(""pmos_l2_sim"",""off"",""off"")");
file34_menu = uimenu("Parent", file31_menu, "Label", gettext("OTA"), "callback", "demo_example_callback(""ota_l2_sim"",""off"",""off"")");
file37_menu = uimenu("Parent", file31_menu, "Label", gettext("C4"), "callback", "demo_example_callback(""c4_l2_sim"",""off"",""off"")");
file38_menu = uimenu("Parent", file31_menu, "Label", gettext("Bias generator"), "callback", "demo_example_callback(""biasgen_l2_sim"",""off"",""off"")");

update_menu = uimenu("Parent", gui, "Label", gettext("Update"),'ForegroundColor',[1,1,1]);
update1_menu = uimenu("Parent", update_menu, "Label", gettext("Update RASP Tools"), "callback", "up1_callback()");
update2_menu = uimenu("Parent", update_menu, "Label", gettext("Reset RASP Tools"), "callback", "up2_callback()");

doc_menu = uimenu("Parent", gui, "Label", gettext("Docs"), 'ForegroundColor',[1,1,1]);
doc_block_menu = uimenu("Parent", doc_menu, "Label", gettext("Open block documentation"), "callback", "doc_block_callback()");
doc_full_menu = uimenu("Parent", doc_menu, "Label", gettext("Open full documentation"), "callback", "doc_full_callback()");
doc1_menu = uimenu("Parent", doc_menu, "Label", gettext("RASP 3.0 Board"), "callback", "open_document(""30board.pdf"")");
doc2_menu = uimenu("Parent", doc_menu, "Label", gettext("RASP 3.0a Board"), "callback", "open_document(""30aboard.pdf"")");
doc3_menu = uimenu("Parent", doc_menu, "Label", gettext("VM Setup && Remote System Guide"), "callback", "open_document(""VM_FPAA_setup.pdf"")");
doc4_menu = uimenu("Parent", doc_menu, "Label", gettext("Design Simulation && Programming FPAA Guide"), "callback", "open_document(""demo_block_discussion.pdf"")");
doc5_menu = uimenu("Parent", doc_menu, "Label", gettext("Useful Websites for Blocks"), "callback", "open_document(""blockappearance.pdf"")");
doc7_menu = uimenu("Parent", doc_menu, "Label", gettext("Block Library Information"), "callback", "open_document(""./blocks_latex/block_doc.pdf"")");
doc6_menu = uimenu("Parent", doc_menu, "Label", gettext("Install Adobe Reader"), "callback", "doc6_callback()");

etc_menu = uimenu("Parent", gui, "Label", gettext("Utilities"), 'ForegroundColor',[1,1,1]);
etc7_menu = uimenu("Parent", etc_menu, "Label", gettext("Initialize Ammeter"), "callback", "etc7_callback()");
etc8_menu = uimenu("Parent", etc_menu, "Label", gettext("Create/Load CSV File"));
etc10_menu = uimenu("Parent", etc8_menu, "Label", gettext("Create .csv File"), "callback", "etc10_callback()");
etc9_menu = uimenu("Parent", etc8_menu, "Label", gettext("Load .csv File"), "callback", "etc9_callback()");
etc4_menu = uimenu("Parent", etc_menu, "Label", gettext("On/Off Programming Graphs"));
etc3_menu = uimenu("Parent", etc_menu, "Label", gettext("Close Programming Graphs"), "callback", "etc3_callback()");
etc2_menu = uimenu("Parent", etc_menu, "Label", gettext("Fine Tune Switches"), "callback", "etc2_callback()");
etc5_menu = uimenu("Parent", etc4_menu, "Label", gettext("Programming Graphs On"), "callback", "etc5_callback()");
etc6_menu = uimenu("Parent", etc4_menu, "Label", gettext("Programming Graphs Off"), "callback", "etc6_callback()");
etc1_menu = uimenu("Parent", etc_menu, "Label", gettext("Delete Hidden Folder"), "callback", "etc1_callback()");
etc11_menu = uimenu("Parent", etc_menu, "Label", gettext("On/Off Design Metrics"));
etc12_menu = uimenu("Parent", etc11_menu, "Label", gettext("Design Metrics On"), "callback", "etc12_callback()");
etc13_menu = uimenu("Parent", etc11_menu, "Label", gettext("Design Metrics Off"), "callback", "etc13_callback()");
etc14_menu = uimenu("Parent", etc_menu, "Label", gettext("Compilation Check 3.0/3.0a"), "callback", "etc14_callback()");
etc15_menu = uimenu("Parent", etc_menu, "Label", gettext("Convert to Modelica blocks"), "callback", "etc15_callback()");

gui_menu = uimenu("Parent", gui, "Label", gettext("GUIs"), 'ForegroundColor',[1,1,1]);
gui1_menu = uimenu("Parent", gui_menu, "Label", gettext("Calibration"), 'ForegroundColor',[0,0,0], "callback", "gui1_callback()");
gui7_menu = uimenu("Parent", gui_menu, "Label", gettext("Generate Macro blocks"));
gui4_menu = uimenu("Parent", gui7_menu, "Label", gettext("Generate Macro-BLIF"), 'ForegroundColor',[0,0,0], "callback", "gui4_callback()");
gui6_menu = uimenu("Parent", gui7_menu, "Label", gettext("Generate Macro-CAB"), 'ForegroundColor',[0,0,0], "callback", "gui6_callback()");
gui9_menu = uimenu("Parent", gui_menu, "Label", gettext("Block & Connection Description"), 'ForegroundColor',[0,0,0], "callback", "gui9_callback()");
gui8_menu = uimenu("Parent", gui_menu, "Label", gettext("Generate Level1 Sim."), 'ForegroundColor',[0,0,0], "callback", "gui8_callback()");
gui2_menu = uimenu("Parent", gui_menu, "Label", gettext("Generate Block Document"), 'ForegroundColor',[0,0,0], "callback", "gui2_callback()");
gui5_menu = uimenu("Parent", gui_menu, "Label", gettext("Design Metrics"), 'ForegroundColor',[0,0,0], "callback", "gui5_callback()");


//////////
// Callbacks are defined as below.
//////////
clearglobal file_name fname path extension email_name chip_num addvmm rm_results board_num showprog csvdata plcvpr pass_num cap_info show_dsgnmatrics;
global file_name fname path extension email_name chip_num addvmm rm_results board_num showprog csvdata plcvpr pass_num cap_info show_dsgnmatrics;
global Ut_sim Kappa_sim Sigma_sim;
Ut_sim=0.0256; Kappa_sim=0.7; Sigma_sim=0.001; 

showprog = 0; show_dsgnmatrics=0;

function email_box_callback(handles)
    global email_name;
    email_name = handles.email_box.string;   
endfunction

function text_box_callback(handles)
    global file_name path fname extension;
    handles.text_box.string=basename(file_name)+extension;   
endfunction

function Choose_Chip_callback(handles)
    global chip_num;
    chip_num = handles.Choose_Chip.string;   
endfunction

function Choose_Board_callback(handles)
    global board_num brdtype;
    if (handles.Choose_Board.value == 1) then board_num=1;
    elseif (handles.Choose_Board.value == 2) then board_num=2; brdtype = ''; disp('You are now using the settings for the 3.0 Board');
    elseif (handles.Choose_Board.value == 3) then board_num=3; brdtype = '_30a'; disp('You are now using the settings for the 3.0 A Board');
    elseif (handles.Choose_Board.value == 4) then board_num=4; brdtype = '_30n'; disp('You are now using the settings for the 3.0 N Board');
    elseif (handles.Choose_Board.value == 5) then board_num=5; brdtype = '_30h'; disp('You are now using the settings for the 3.0 H Board');
    else
    end
endfunction

function New_Design_callback(handles)
    xcos;
endfunction

function Choose_Design_callback(handles)
    clc;
    global file_name path fname extension dirpwd;
    file_name2 = file_name; 
    path =  pwd(); dirpwd = pwd()+'/'; file_name = uigetfile(["*.xcos*"],path, "Choose the Design to be Compiled"); [path,fname,extension]=fileparts(file_name);
    if(path ~= "") then
        if(path ~= dirpwd) then cd(path); filebrowser(); end
        clear scs_m blk_objs blk; 
        global scs_m;
        text_box_callback(handles)
    else
        if handles.text_box.string ~= 'No File Selected' then [path,fname,extension]=fileparts(file_name2); file_name=file_name2; end
    end
endfunction

function Open_Design_callback(handles)
    global file_name path fname extension;
    if(fname ~= "") then
        if(extension == '.xcos') then xcos(file_name);
        else messagebox(["You have not selected a Design (.xcos)" "Please choose one to open."], "No Design Selected", "warning");
        end
    else messagebox(["You have not selected a Design (.xcos)" "Please choose one to open."], "No Design Selected", "warning");
    end
endfunction

function Compile_Design_callback(handles)
    global file_name path fname extension;
    if(extension == '.xcos') then
        importXcosDiagram(file_name);
        clc;
        if show_dsgnmatrics == 0 then pass_num=1; cap_info = tlist('capinfo'); exec('/home/ubuntu/rasp30/sci2blif/sci2blif.sce', -1); end
        if show_dsgnmatrics == 1 then
            exec("/home/ubuntu/rasp30/sci2blif/dsgnmtrcs.sce",-1);
            pass_num=1; cap_info = tlist('capinfo'); exec('/home/ubuntu/rasp30/sci2blif/sci2blif.sce', -1);
            pass_num=2; exec('/home/ubuntu/rasp30/sci2blif/sci2blif.sce', -1);
            Board_settings();
            Design_Metrics();
        end
        filebrowser();
    else messagebox(["You have not selected a Design (.xcos)" "Please choose one to compile."], "No File Selected", "warning");
    end
endfunction

function Program_Design_callback(handles)
    global file_name path fname extension; clc;
    x = fileinfo(fname + '.swcs')
    if(x ~= []) then 
        //mm=waitbar("Program Status");
        disp('Programming...');
        [amm_opt, amm_con1] = unix_g('sudo chmod 777 /dev/rasp30');
        if amm_con1 then
            messagebox(["FPAA Board is not connected under the VM Devices tab." "Please select the board and initiate again."],"FPAA Board is not Connected via USB Devices" , "info", "modal");
            //close(mm)
            disp('Programming has stopped.');
        else
            // Count # of switches and target_fgs. 
            swc_fg_list = fscanfMat(path+fname+'.swcs');
            temp_size= size(swc_fg_list); n=temp_size(1,1);
            No_swcs=0; No_swcs_sr=0; No_target_fgs=0;
            tar_prog_offset1=0; tar_prog_offset2=0; tar_prog_offset3=0; tar_prog_offset4=0; tar_prog_offset6=0;
            for i=1:n
                if swc_fg_list(i,4) == 0 & swc_fg_list(i,3) == 0 then No_swcs=No_swcs+1; end
                if swc_fg_list(i,4) == 0 & swc_fg_list(i,3) == 1 then No_swcs_sr=No_swcs_sr+1; end
                if swc_fg_list(i,4) == 1 then No_target_fgs=No_target_fgs+1; tar_prog_offset1=20; end
                if swc_fg_list(i,4) == 2 then No_target_fgs=No_target_fgs+1; tar_prog_offset2=20; end
                if swc_fg_list(i,4) == 3 then No_target_fgs=No_target_fgs+1; tar_prog_offset3=20; end
                if swc_fg_list(i,4) == 4 then No_target_fgs=No_target_fgs+1; tar_prog_offset4=20; end
                if swc_fg_list(i,4) == 6 then No_target_fgs=No_target_fgs+1; tar_prog_offset6=20; end
            end
            tun_revtun_time=7; // Tunnel and Reverse tunnel time (s) (a value measured in scilab execution)
            swc_prog_unit=0.3; swc_prog_offset=9; // Switch program unit time (s) (a value measured in scilab execution)
            swc_prog_time=swc_prog_offset+swc_prog_unit*(No_swcs+10*No_swcs_sr);
            tar_prog_unit=20; // Target program unit time (s) (a value measured in scilab execution)
            tar_prog_time=tar_prog_offset1+tar_prog_offset2+tar_prog_offset3+tar_prog_offset4+tar_prog_offset6+tar_prog_unit*No_target_fgs
            dc_time=5 // DC setup time (s) (a value measured in scilab execution)
            
            string_tun_revtun='Tunnel & Rev. tunnel (../'+string(tun_revtun_time)+'s)';
            string_prog_swc='Program Switches (../'+string(swc_prog_time)+'s)';
            string_prog_tar='Program Target FGs (../'+string(tar_prog_time)+'s)';
            string_dc_setup='DC setup (../'+string(dc_time)+'s)';
            
            winH=progressionbar(['-> '+string_tun_revtun string_prog_swc string_prog_tar string_dc_setup]);
            tic(); realtimeinit(1); realtime(0); realtime(2);
            exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/tunnel_revtun_ver00_gui.sce', -1);
            time1=toc(); string_tun_revtun='Tunnel & Rev. tunnel ('+string(time1)+'/'+string(tun_revtun_time)+'s)';
            disp('tunnel, reverse tunnel done');
            progressionbar(winH,[string_tun_revtun '-> '+string_prog_swc string_prog_tar string_dc_setup]);
            tic(); realtimeinit(1); realtime(0); realtime(2);
            exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/switch_program_ver05_gui.sce', -1);
            time1=toc(); string_prog_swc='Program Switches ('+string(time1)+'/'+string(swc_prog_time)+'s)';
            disp('switch_program done');
            progressionbar(winH,[string_tun_revtun string_prog_swc '-> '+string_prog_tar string_dc_setup]);
            tic(); realtimeinit(1); realtime(0); realtime(2);
            exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/target_program_ver02_gui.sce', -1);
            time1=toc(); string_prog_tar='Program Target FGs ('+string(time1)+'/'+string(tar_prog_time)+'s)';
            disp('target_program done');
            b1=unix("ls "+hid_dir+"/switch_list_ble");
            if (b1==0) then
                progressionbar(winH,[string_tun_revtun string_prog_swc string_prog_tar '-> Program ble switches' string_dc_setup]);
                exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/tunnel_clb_ver00_gui.sce', -1);
                disp('tunnel , reverse tunnel for clb done');
                exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/switch_program_ble_ver00_gui.sce', -1);
                disp('switch_program for ble done');
            end
            progressionbar(winH,[string_tun_revtun string_prog_swc string_prog_tar '-> '+string_dc_setup]);
            tic(); realtimeinit(1); realtime(0); realtime(2);
//            exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/dc_setup_gui.sce', -1);
            time1=toc(); string_dc_setup='DC setup ('+string(time1)+'/'+string(dc_time)+'s)';
            disp('DC setup done');
            disp("Programming Completed...Ready to Take Data");
            close(winH);
            filebrowser();
        end
    else messagebox(["You do not have a " + fname+ ".swcs file in the current directory." "Please create one by compiling a design or netlist."], "No Switch List Detected", "warning");
    end
endfunction

function vprinfo()
    global board_num brdtype;
    select board_num 
    case 2 then arch = 'rasp3'; brdtype = ''; loc_num=1;
    case 3 then arch = 'rasp3a'; brdtype = ' -'+arch; loc_num=2;
    case 4 then arch = 'rasp3n'; brdtype = ' -'+arch; loc_num=3;
    case 5 arch = 'rasp3h'; brdtype = ' -'+arch; loc_num=4;
    else messagebox('Please select the FPAA board that you are using.', "No Selected FPAA Board", "error"); abort;
    end
endfunction

function View_Routing_callback(handles)
    global file_name path fname extension addvmm plcvpr;
    x = fileinfo(fname + '.blif');
    if(x ~= []) then 
        hid_dir=path+'.'+fname;
        unix_s('mkdir -p '+hid_dir);
        x = fileinfo(hid_dir+'/' +fname' + '.pads');
        if(x ~= []) then //pads file is in hidden dir
            vprinfo();
            unix_s('mv ' + hid_dir+'/' +fname' + '.pads '+ hid_dir+'/' +fname' + '.place '+ hid_dir+'/' +fname' + '.net '+ hid_dir+'/' +fname' + '.route '+ path); 
            //if plcvpr & addvmm then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + ' -vmm -route' + brdtype +' -v');
            if plcvpr & addvmm then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + ' -route' + brdtype +' -v');
            elseif plcvpr then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path+ ' -route' + brdtype+' -v');
            //elseif addvmm then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + ' -vmm' + brdtype+' -v');
            elseif addvmm then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + brdtype+' -v');
            else unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + brdtype+' -v');
            end
            unix_s('mv ' + fname' + '.pads ' + fname + '.place ' + fname + '.net ' + fname + '.route ' +hid_dir);
            filebrowser();
        else //pads not in hidden dir
            x = fileinfo(fname' + '.pads');
            if(x ~= []) then //pads file in current dir
                vprinfo();
                //if plcvpr & addvmm then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + ' -vmm -route' + brdtype +' -v');
                if plcvpr & addvmm then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + ' -route' + brdtype +' -v');
                elseif plcvpr then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path+ ' -route' + brdtype+' -v');
                //elseif addvmm then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + ' -vmm' + brdtype+' -v');
                elseif addvmm then unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + brdtype+' -v');
                else unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path + brdtype+' -v');
                end
                unix_s('mv ' + fname' + '.pads ' + fname + '.place ' + fname + '.net ' + fname + '.route ' +hid_dir);
                filebrowser();
            else messagebox(["You do not have a " + fname+ ".pads file in the current directory." "Please create one by compiling your design or by hand."], "Missing File", "warning");
            end
        end
    else messagebox(["You do not have a " + fname+ ".blif file in the current directory." "Please create one by compiling your design or by hand."], "Missing File", "warning");
    end
endfunction

function Take_Data_callback(handles)
    disp('Taking Data...');
    //exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/dc_setup_gui.sce', -1);
    //disp('DC setup done');
    global RAMP_ADC_check sftreg_check Signal_DAC_check GPIO_IN_check MITE_ADC_check ONchip_ADC;
    //global RAMP_ADC_check;//had to add this for ramp
    if (Signal_DAC_check==1) & (GPIO_IN_check==0) & (RAMP_ADC_check==1) then noDAC=1; exec("~/rasp30/prog_assembly/libs/scilab_code/Ramp_ADC_voltage.sce",-1);
    elseif (Signal_DAC_check==1) & (GPIO_IN_check==0) & (ONchip_ADC==1) then exec("~/rasp30/prog_assembly/libs/scilab_code/ADC_onchip.sce",-1); [Out,out_volt] = ADC(1);
    else exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/voltage_measurement_gui.sce', -1);
    end    
    disp("Data Collected ");
    filebrowser();
endfunction

function Send_Email_callback(handles)
    global email_name fname;

    if (email_name == []) then
        messagebox(["Please provide your email address in the designated location."], "No Netlist Selected", "warning");
    else
        exec('/home/ubuntu/rasp30/sci2blif/send_email_ip_pw.sce',-1);
    end
endfunction

function Load_Data_callback(handles)
    global path fname rm_results;
    disp("Loading Data...");
    unix_s('python /home/ubuntu/rasp30/sci2blif/rmunzip.py ' + path)
    exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/outhexfile2voltfile_gui.sce', -1);
    rm_results=fscanfMat(path + fname +'.data')
    figure();plot(rm_results)
    disp("Your data is loaded and saved in the variable rm_results. It can also be located in the Variable Browser.");
endfunction

function Choose_Netlist_callback(handles)
    clc; global file_name path fname extension;
    path =  pwd(); dirpwd = pwd()+'/'; file_name=uigetfile(["*.blif*"],path, "Choose the Netlist to be Compiled"); [path,fname,extension]=fileparts(file_name);
    if(path ~= "") then
        if(path ~= dirpwd) then cd(path); filebrowser(); end
        text_box_callback(handles)
    end
endfunction


function Program_Netlist_callback(handles)
    global file_name path fname extension; clc;
    [amm_opt, amm_con1] = unix_g('sudo chmod 777 /dev/rasp30');
    if amm_con1 then 
        messagebox(["FPAA Board is not connected under the VM Devices tab." "Please select the board and program again."],"FPAA Board is not Connected via USB Devices" , "info", "modal");
    else
        hid_dir=path+'.'+fname;
        if(extension == '.blif') then 
            unix_s('mkdir -p '+hid_dir);
            x = fileinfo(hid_dir+'/' +fname + '.pads')
            if(x ~= []) then //pads file is in hidden dir
                unix_s('mv ' + hid_dir+'/' +fname' + '.pads '+ path); 
                disp("Determining the Switch List...");
                unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path);
                unix_s('mv ' + fname' + '.pads ' + fname + '.place ' + fname + '.net ' + fname + '.route ' +hid_dir);
                disp("Switch List Created.");
                filebrowser();
                disp('Programming...')
                exec("~/rasp30/prog_assembly/libs/scilab_code/MakeProgramlilst_CompileAssembly.sce",-1);
                exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/tunnel_revtun_ver00_gui.sce', -1);
                disp('tunnel , reverse tunnel done');
                exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/switch_program_ver05_gui.sce', -1);
                disp('switch_program done');
                exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/target_program_ver02_gui.sce', -1);
                disp('target_program done');
                disp("Programming Completed...Ready to Take Data");
            else //pads not in hidden dir
                x = fileinfo(fname + '.pads')
                if(x ~= []) then //pads file in current dir
                    disp("Determining the Switch List...");
                    unix_s('python /home/ubuntu/rasp30/vpr2swcs/genswcs.py -c ' + path + fname + ' -d '+ path);
                    unix_s('mv ' + fname' + '.pads ' + fname + '.place ' + fname + '.net ' + fname + '.route ' +hid_dir);
                    disp("Switch List Created.");
                    filebrowser();
                    disp('Programming...')
                    exec("~/rasp30/prog_assembly/libs/scilab_code/MakeProgramlilst_CompileAssembly.sce",-1);
                    exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/tunnel_revtun_ver00_gui.sce', -1);
                    disp('tunnel , reverse tunnel done');
                    exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/switch_program_ver05_gui.sce', -1);
                    disp('switch_program done');
                    exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/target_program_ver02_gui.sce', -1);
                    disp('target_program done');
                    disp("Programming Completed...Ready to Take Data");
                else
                    messagebox(["You do not have a " + fname+ ".pads file in the current directory." "Please create one by compiling a design or doing by hand."], "Missing File", "warning");
                end
            end
        else
            messagebox(["You have not selected a Netlist (.blif)" "Please choose one to compile."], "No Netlist Selected", "warning");
        end
    end
endfunction

function Choose_Swc_List_callback(handles)
    clc; global file_name path fname extension;
    path =  pwd(); dirpwd = pwd()+'/'; file_name=uigetfile(["*.swcs*"],path, "Choose the Switch List to be Compiled"); [path,fname,extension]=fileparts(file_name);
    if(path ~= "") then
        if(path ~= dirpwd) then cd(path); filebrowser(); end
        text_box_callback(handles)
    end
endfunction

function Program_SwcList_callback(handles)
    global file_name path fname extension; clc;
    if(extension == '.swcs') then 
        unix_g('>./input_vector');
        y_input=mopen('./input_vector','wb');
        mputl('0x0001 0x000c 0x03e8 0xb238 0xFFFF',y_input);
        mclose(y_input);
        disp('Programming...');
        errcatch(-1,"pause");
        hid_dir=path+'.'+fname;
        unix_s('mkdir -p '+hid_dir);
        x = fileinfo('input_vector')
        if(x == []) then 
            fd = mopen('input_vector','wt'); mputl('0x0000 0x0000 0x03e8 0xFFFF', fd); mclose(fd); // making fake input_vector
        end
        exec("~/rasp30/prog_assembly/libs/scilab_code/MakeProgramlilst_CompileAssembly.sce",-1);
        
        // Count # of switches and target_fgs. 
        swc_fg_list = fscanfMat(path+fname+'.swcs');
        temp_size= size(swc_fg_list); n=temp_size(1,1);
        No_swcs=0; No_swcs_sr=0; No_target_fgs=0;
        tar_prog_offset1=0; tar_prog_offset2=0; tar_prog_offset3=0; tar_prog_offset4=0; tar_prog_offset6=0;
        for i=1:n
            if swc_fg_list(i,4) == 0 & swc_fg_list(i,3) == 0 then No_swcs=No_swcs+1; end
            if swc_fg_list(i,4) == 0 & swc_fg_list(i,3) == 1 then No_swcs_sr=No_swcs_sr+1; end
            if swc_fg_list(i,4) == 1 then No_target_fgs=No_target_fgs+1; tar_prog_offset1=20; end
            if swc_fg_list(i,4) == 2 then No_target_fgs=No_target_fgs+1; tar_prog_offset2=20; end
            if swc_fg_list(i,4) == 3 then No_target_fgs=No_target_fgs+1; tar_prog_offset3=20; end
            if swc_fg_list(i,4) == 4 then No_target_fgs=No_target_fgs+1; tar_prog_offset4=20; end
            if swc_fg_list(i,4) == 6 then No_target_fgs=No_target_fgs+1; tar_prog_offset6=20; end
        end
        tun_revtun_time=7; // Tunnel and Reverse tunnel time (s) (a value measured in scilab execution)
        swc_prog_unit=0.3; swc_prog_offset=9; // Switch program unit time (s) (a value measured in scilab execution)
        swc_prog_time=swc_prog_offset+swc_prog_unit*(No_swcs+10*No_swcs_sr);
        tar_prog_unit=20; // Target program unit time (s) (a value measured in scilab execution)
        tar_prog_time=tar_prog_offset1+tar_prog_offset2+tar_prog_offset3+tar_prog_offset4+tar_prog_offset6+tar_prog_unit*No_target_fgs
        dc_time=5 // DC setup time (s) (a value measured in scilab execution)
        
        string_tun_revtun='Tunnel & Rev. tunnel (../'+string(tun_revtun_time)+'s)';
        string_prog_swc='Program Switches (../'+string(swc_prog_time)+'s)';
        string_prog_tar='Program Target FGs (../'+string(tar_prog_time)+'s)';
        string_dc_setup='DC setup (../'+string(dc_time)+'s)';
        
        winH=progressionbar(['-> '+string_tun_revtun string_prog_swc string_prog_tar string_dc_setup]);
        tic(); realtimeinit(1); realtime(0); realtime(2);
       //exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/tunnel_revtun_ver00_gui.sce', -1);
        time1=toc(); string_tun_revtun='Tunnel & Rev. tunnel ('+string(time1)+'/'+string(tun_revtun_time)+'s)';
        disp('tunnel, reverse tunnel done');
        progressionbar(winH,[string_tun_revtun '-> '+string_prog_swc string_prog_tar string_dc_setup]);
        tic(); realtimeinit(1); realtime(0); realtime(2);
        exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/switch_program_ver05_gui.sce', -1);
        time1=toc(); string_prog_swc='Program Switches ('+string(time1)+'/'+string(swc_prog_time)+'s)';
        disp('switch_program done');
        progressionbar(winH,[string_tun_revtun string_prog_swc '-> '+string_prog_tar string_dc_setup]);
        tic(); realtimeinit(1); realtime(0); realtime(2);
        exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/target_program_ver02_gui.sce', -1);
        time1=toc(); string_prog_tar='Program Target FGs ('+string(time1)+'/'+string(tar_prog_time)+'s)';
        disp('target_program done');
        b1=unix("ls "+hid_dir+"/switch_list_ble");
        if (b1==0) then
            progressionbar(winH,[string_tun_revtun string_prog_swc string_prog_tar '-> Program ble switches' string_dc_setup]);
            //exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/tunnel_clb_ver00_gui.sce', -1);
            disp('tunnel , reverse tunnel for clb done');
            exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/switch_program_ble_ver00_gui.sce', -1);
            disp('switch_program for ble done');
        end
        progressionbar(winH,[string_tun_revtun string_prog_swc string_prog_tar '-> '+string_dc_setup]);
        tic(); realtimeinit(1); realtime(0); realtime(2);
        exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/dc_setup_gui.sce', -1);
        time1=toc(); string_dc_setup='DC setup ('+string(time1)+'/'+string(dc_time)+'s)';
        disp('DC setup done');
        disp("Programming Completed...Ready to Take Data");
        close(winH);
        filebrowser();
    else
        messagebox(["You have not selected a Switch List (.swcs)" "Please choose one to compile."], "No Switch List Selected", "warning");
    end
endfunction

function Reset_Com_callback(handles)
    disp('Resetting USB connections...');
    unix_s('/home/ubuntu/rasp30/sci2blif/usbreset');
    disp('Done!');
endfunction

function demo_example_callback(demo_fname,com_prep_index,arb_msg_index)
    global file_name path fname extension;
    unix_g("mkdir /home/ubuntu/RASP_Workspace/demo_examples/");
    unix_g("mkdir /home/ubuntu/RASP_Workspace/demo_examples/"+demo_fname);
    unix_s("cp /home/ubuntu/rasp30/sci2blif/demo_examples/"+demo_fname+".xcos /home/ubuntu/RASP_Workspace/demo_examples/"+demo_fname+"/");
    file_name= "/home/ubuntu/RASP_Workspace/demo_examples/"+demo_fname+"/"+demo_fname+".xcos"; disp(demo_fname); disp(file_name);
    [path,fname,extension]=fileparts(file_name);
    cd(path);
    filebrowser();
    if com_prep_index == "on" then com_prep(); end
    xcos(file_name);
    if arb_msg_index == "on" then arb_msg(); end
endfunction

function up1_callback()
    global path;
    messagebox(["Once you press OK, RASP Tools will update." "Please wait for the update confirmation message to appear."],"Update to Begin" , "info", "modal");
    if(path ~= "") then
        unix_s('cd; sudo chown ubuntu:ubuntu rasp30/ -R');
        unix_s('cd; svn update rasp30; cd '+path);
    else
        unix_s('cd; sudo chown ubuntu:ubuntu rasp30/ -R');
        unix_s('cd; svn update rasp30');
    end
    messagebox(["RASP Tools is updated to woodjamesdee repo." "Scilab will now close for the changes to take effect in RASP Tools." "Please restart RASP Tools."],"Update Complete!" , "info", "modal");
    sleep(1000);
    quit;
endfunction

function up2_callback()
    global path;   
    messagebox(["Once you press OK, RASP Tools will reset itself." "Please wait for the reset confirmation message to appear."],"Reset to Begin" , "info", "modal");
    if(path ~= "") then
        unix_s('cd; sudo chown ubuntu:ubuntu rasp30/ -R');
        unix_s('cd; rm ~/rasp30 -rf; svn co https://github.com/woodjamesdee/rasp30/trunk ~/rasp30/; cd '+path);
    else
        unix_s('cd; sudo chown ubuntu:ubuntu rasp30/ -R');
        unix_s('cd; rm ~/rasp30 -rf; svn co https://github.com/woodjamesdee/rasp30/trunk ~/rasp30/');
    end
    messagebox(["RASP Tools has been reset to woodjamesdee repo." "Scilab will now close for the changes to take effect in RASP Tools." "Please restart RASP Tools."],"Reset Complete!" , "info", "modal");
    sleep(1000);
    quit;
endfunction

function open_document(doc_name)
    [a,b]=unix_g("acroread /home/ubuntu/rasp30/sci2blif/documentation/"+doc_name+" &"); 
    if b == 1 then messagebox("Install Adobe Reader via the Documents menu. ", "Adode Reader not installed yet!", "scilab"); end
endfunction

function doc6_callback()
    global path;
    disp('Initiating Install...');
    unix_g('sudo apt-get update');
    disp('Step 1 of 3');
    unix_g('sudo apt-get -y install gdebi'); 
    unix_g('sudo apt-get -y install libgnome2-0');
    disp('Step 2 of 3');
    unix_g('cd /home/ubuntu/rasp30/sci2blif/documentation && sudo gdebi -n AdbeRdr9.5.5-1_i386linux_enu.deb');
    disp('Step 3 of 3');
    unix_s('cd '+path); 
    messagebox(['When you select a document to view, please wait for the End User Agreement window to appear and Press OK.'],'Adobe Reader is now installed!', "info");
endfunction

function gui1_callback()
    exec('/home/ubuntu/rasp30/sci2blif/fpaacal.sce',-1);
endfunction

function gui4_callback()
    exec("/home/ubuntu/rasp30/sci2blif/macroblif_gen_gui.sce");
endfunction

function gui6_callback()
    exec("/home/ubuntu/rasp30/sci2blif/macrocab_gen_gui.sce");
endfunction

function gui9_callback()
    exec("/home/ubuntu/rasp30/sci2blif/bcd_gui.sce");
endfunction

function gui8_callback()
    exec("/home/ubuntu/rasp30/sci2blif/level1_sim_gen_gui.sce");
endfunction

function gui2_callback()
    exec("/home/ubuntu/rasp30/sci2blif/block_doc_gen_gui.sce");
endfunction

function gui5_callback()
    exec("/home/ubuntu/rasp30/sci2blif/dsgnmtrcs.sce",-1);
endfunction

function etc1_callback(handles)
    global file_name path fname extension
    hid_dir=path+'.'+fname;
    if isdir(hid_dir) then
        unix_s('mv ' + hid_dir+'/' +fname + '.pads '+ path); 
        unix_s('rm -rf ' + hid_dir);
        disp('Misc. files have been deleted from your current directory.');
    else
        disp('There is no hidden folder in your current directory to delete.'); 
    end
endfunction

function etc2_callback(handles)
    global file_name path fname extension
    clc
    disp('Programming...');
    hid_dir=path+'.'+fname;
    unix_s('cp ' + hid_dir+'/input_vector '+ path); 
    exec("~/rasp30/prog_assembly/libs/scilab_code/MakeProgramlilst_CompileAssembly.sce",-1);
    exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/finetune_program_ver00_gui.sce', -1);
    exec('/home/ubuntu/rasp30/prog_assembly/libs/scilab_code/dc_setup_gui.sce', -1);
    disp('DC setup done');
    //unix_s('rm ' + path +'input_vector');
    disp("Programming Completed...Ready to Take Data"); 
endfunction

function etc3_callback(handles)
    fignums = [3 10:18 20:28 30:38 40:48 50:58 60:68 70:78 101 2 4:9]
    delfig = intersect(winsid(),fignums)
    if delfig ~= [] then
        for i = 1:length(delfig)
            xdel(delfig(i));
        end
        disp('All programming graphs are now closed.');
    else
        disp('There are no programming graphs to close.'); 
    end
endfunction

function etc5_callback(handles)
    global showprog;
    showprog = 1;
endfunction

function etc6_callback(handles)
    global showprog;
    showprog = 0;
endfunction

function etc7_callback(handles)
    [amm_opt, amm_con] = unix_g('sudo chmod 777 /dev/prologix');   
    if amm_con then
        messagebox(["Prologix GPIB-USB Controller is not connected under the VM Devices tab." "Please select Prologix and initiate again."],"Ammeter is not Connected via USB Devices" , "info", "modal");
    else
        disp("Ammeter has been initiated.")
    end
endfunction 

csvpath="/home/ubuntu/RASP_Workspace";

function etc9_callback(handles)
    global csvdata
    [filename, pathname] = uigetfile(["*.csv*"], csvpath, "Choose the CSV to Load");
    if(filename ~= "") then
        csvdata = csvRead(pathname+'/'+filename);
        csvpath = pathname;
        disp("Data has been stored in variable: csvdata")
    end
    csvpath=resume(csvpath)
endfunction 

function etc10_callback(handles)

    csvdir=uigetdir("/home/ubuntu/RASP_Workspace", "Choose a directory.")
    if ~(isempty(csvdir)) then
        csvf = x_mdialog("CSV File Setup",['Name of variable';'Name for CSV file'],['';'']);
        if ~(isempty(csvf(1))) & ~(isempty(csvf(2))) then
            csvWrite(evstr(csvf(1)),csvdir+"/"+csvf(2)+'.csv')
            disp(csvf(2)+'.csv has been created in your chosen directory.')
        end
    end
endfunction

function etc14_callback(handles)
    global file_name path fname extension board_num chip_num;
    
    path="/home/ubuntu/RASP_Workspace/compilation_check/";
    mkdir(path);
    cd(path);
    file_name=path+"compile_check.xcos";
    [path,fname,extension]=fileparts(file_name);
    extension=".xcos";
    
    // 3.0
    unix_w("rm -rf *.blif *.net *.place *.route ."+fname);
    board_num=2; chip_num="13";
    unix_w("cp /home/ubuntu/rasp30/sci2blif/xcos_ref/compilation_check/compile_check_30.xcos "++fname+extension);
    pass_num=1; cap_info = tlist('capinfo'); exec('/home/ubuntu/rasp30/sci2blif/sci2blif.sce', -1);
    disp("3.0 example are compiled successfully!");
    
    // 3.0 vmm
    unix_w("rm -rf *.blif *.net *.place *.route ."+fname);
    board_num=2; chip_num="13";
    clk_sr=[0.2 0.2]; data_sr=[0.2 0.2]; input_vmmwta=[0.2 0.2; 0.2 0.2; 0.2 0.2; 0.2 0.2;];
    unix_w("cp /home/ubuntu/rasp30/sci2blif/xcos_ref/compilation_check/compile_check_30_vmm.xcos "++fname+extension);
    pass_num=1; cap_info = tlist('capinfo'); exec('/home/ubuntu/rasp30/sci2blif/sci2blif.sce', -1);
    disp("3.0 VMM example are compiled successfully!");
    
    // 3.0a
    unix_w("rm -rf *.blif *.net *.place *.route ."+fname);
    board_num=3; chip_num="13";
    unix_w("cp /home/ubuntu/rasp30/sci2blif/xcos_ref/compilation_check/compile_check_30.xcos "++fname+extension);
    pass_num=1; cap_info = tlist('capinfo'); exec('/home/ubuntu/rasp30/sci2blif/sci2blif.sce', -1);
    disp("3.0a example are compiled successfully!");
    
    // 3.0a vmm
    unix_w("rm -rf *.blif *.net *.place *.route ."+fname);
    board_num=3; chip_num="13";
    clk_sr=[0.2 0.2]; data_sr=[0.2 0.2]; input_vmmwta=[0.2 0.2; 0.2 0.2; 0.2 0.2; 0.2 0.2;];
    unix_w("cp /home/ubuntu/rasp30/sci2blif/xcos_ref/compilation_check/compile_check_30_vmm.xcos "++fname+extension);
    pass_num=1; cap_info = tlist('capinfo'); exec('/home/ubuntu/rasp30/sci2blif/sci2blif.sce', -1);
    disp("3.0a VMM example are compiled successfully!");
endfunction

function etc15_callback(handles)
    global file_name path fname extension board_num chip_num;
    clc
    exec("/home/ubuntu/rasp30/sci2blif/convert2modelica.sce",-1);
    
    xcos()
endfunction

function arb_msg()
    usevar=messagebox(["This design contains an Arbitrary Waveform Generator Block."...
    "It requires a variable that contains the input signal(s)."...
    "You have the option to use a pre-defined variable or create your own."...
    "Will you create your own variable via the Scilab Console?"], "modal", "info", ["Yes" "No"]);
    if usevar == 1 then
        usevar=messagebox(["Do not forget to type your variable name in the Arbitrary Waveform Generator Block."],"info");
    end
endfunction

function arb_msg2()
    messagebox(["The AWG block requires a variable that contains the input signal(s)."...
    "You need to create your own variable via the Scilab Console."...
    "Do not forget to type your variable name in the Arbitrary Waveform Generator Block."], "Arbitrary Waveform Generator (AWG) Block","modal");
endfunction

function com_prep()
    clear scs_m;
    clear blk_objs;
    clear blk; 
    global scs_m;
    text_box_callback(handles)
endfunction

function etc12_callback(handles)
    global show_dsgnmatrics;
    show_dsgnmatrics = 1;
endfunction

function etc13_callback(handles)
    global show_dsgnmatrics;
    show_dsgnmatrics = 0;
endfunction

function doc_block_callback()
    global fname;
    [a,b]=unix_g('firefox /home/ubuntu/rasp30/sci2blif/documentation/block_docs/build/html/'+fname+'.html'); 
    if b == 1 then
        messagebox("Error opening documentation. ", "Unable to open firefox! ", "scilab")
    end
endfunction

function doc_full_callback()
    [a,b]=unix_g('firefox /home/ubuntu/rasp30/sci2blif/documentation/block_docs/build/html/index.html'); 
    if b == 1 then
        messagebox("Error opening documentation. ", "Unable to open firefox! ", "scilab")
    end
endfunction

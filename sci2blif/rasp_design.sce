clc; // clear the console window
previousprot = funcprot(1); //integer with possible values 0, 1, 2 returns previous value
funcprot(0); //allows the user to specify what scilab do when such variables are redefined. 0=nothing, 1=warning, 2=error
loadXcosLibs(); // Import some useful Xcos macros into Scilab.
getd('~/rasp30/xcos_blocks/') ;//Loads all .sci files (containing Scilab functions) defined in the path directory.
home_dir = '~/rasp30/xcos_blocks/';

//Create custom palette for all blocks
pal1 = xcosPal("Level 1 (System) Blocks");
pal1_1 = xcosPal("Analog computation");
pal1_2 = xcosPal("Biasing and Interfacing");
pal2 = xcosPal("Level 2 (Circuit) BLocks");
pal3 = xcosPal("Digital Blocks");
pal4 = xcosPal("I/O Pins");
//pal5 = xcosPal("Mixed Signal Blocks");
pal6 = xcosPal("Data Converting Blocks");
pal7 = xcosPal("Modelica Blocks");
pal8 = xcosPal("Macro-BLIF blocks");
pal9 = xcosPal("Vdd/Gnd/Float");
pal10 = xcosPal("Utility Blocks");
pal11 = xcosPal("Macro-CAB blocks");

// Default icon style
style= struct(); 
style.noLabel=0; 
style.align="center"; 
style.overflow="fill"; 
style.fontSize=16;

file_list=listfiles("~/rasp30/sci2blif/rasp_design_added_blocks/*.sce");
size_file_list=size(file_list);
if file_list ~= [] then
    for i=1:size_file_list(1)
            exec(file_list(i),-1);
    end
end

xcosPalAdd(pal1,["FPAA"]);
xcosPalAdd(pal1_1,["FPAA" "Level 1 (System) Blocks"]);
xcosPalAdd(pal1_2,["FPAA" "Level 1 (System) Blocks"]);
//xcosPalAdd(pal1_1,["FPAA"]); // ["FPAA" "Level 1 (System) Blocks"]
//xcosPalAdd(pal1_2,["FPAA"]); // ["FPAA" "Level 1 (System) Blocks"]
xcosPalAdd(pal2,["FPAA"]);
xcosPalAdd(pal3,["FPAA"]);
xcosPalAdd(pal4,["FPAA" "Input/Output Blocks"]);
xcosPalAdd(pal6,["FPAA" "Input/Output Blocks"]);
xcosPalAdd(pal9,["FPAA" "Input/Output Blocks"]);
xcosPalAdd(pal10,["FPAA"]);
//xcosPalAdd(pal5,["FPAA"]);
xcosPalAdd(pal7,["FPAA"]);
xcosPalAdd(pal8,["FPAA" "Macro-block Generation"]);
xcosPalAdd(pal11,["FPAA" "Macro-block Generation"]);

funcprot(previousprot); //Turn the warning messages back on to be displayed in consold

// Launching the GUI
mprintf("Launching the GUI\n");
exec('~/rasp30/sci2blif/guicode_v6.sce',-1);
mprintf("Finished executing guicode_v6.sce, now launching caps4dgn.sce\n");
exec('~/rasp30/sci2blif/caps4dgn.sce',-1);
cd('~/rasp30/RASP_Workspace');
//exec('~/rasp30/work/examples/variables/allvariables.sce',-1)
//exec('~/RASP_Workspace/block_files/create_palette.sce',-1);
//getd('~/rasp30/sci2blif/blif4blks/')
//getd('~/RASP_Workspace/block_files/compile_files')

//Add modelica files' path to the variable %MODELICA_USER_LIBS
mprintf("Adding modelica file paths to the variable\n");
global %MODELICA_USER_LIBS;
%MODELICA_USER_LIBS="~/rasp30/xcos_blocks";
mprintf("Completed rasp_design.sce file\n");

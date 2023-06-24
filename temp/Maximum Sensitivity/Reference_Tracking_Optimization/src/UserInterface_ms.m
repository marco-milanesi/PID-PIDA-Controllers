function varargout = UserInterface_ms(varargin)
% USERINTERFACE_MS MATLAB code for UserInterface_ms.fig
%      USERI NTERFACE, by itself, creates a new USERINTERFACE_MS or raises the existing
%      singleton*.
%
%      H = USERINTERFACE_MS returns the handle to a new USERINTERFACE_MS or the handle to
%      the existing singleton*.
%
%      USERINTERFACE_MS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USERINTERFACE_MS.M with the given input arguments.
%
%      USERINTERFACE_MS('Property','Value',...) creates a new USERINTERFACE_MS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UserInterface_ms_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UserInterface_ms_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UserInterface_ms_OpeningFcn, ...
                   'gui_OutputFcn',  @UserInterface_ms_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before UserInterface_ms is made visible.
function UserInterface_ms_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UserInterface_ms (see VARARGIN)

% Choose default command line output for UserInterface_ms
handles.output = hObject;
global variable ;
global multi_pole; 
global alpha_fos; 
global alpha_hpz;
global time_dl;
global time_ddl;
global omegazero;
global minimum_IAE;
minimum_IAE=100;
variable = -1;     
multi_pole = [1 2 3 4 8];
alpha_fos = [0.1 0.2 0.5 1];
alpha_hpz = [0.1 0.2 0.5 1 2 5];
time_dl=[0 0.1 0.2 0.5 2 5 10];
time_ddl=[0 0.1 0.2 0.5 2 5 10];  
omegazero = [1 2 5 10];
        

% Update handles structure
guidata(hObject, handles);

function varargout = UserInterface_ms_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

% multipole
function radiobutton2_Callback(hObject, eventdata, handles)
global multi_pole;
global variable;
prompt={'select order multiple poles 1 2 3 4 8'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input));
check = 0;
for element = multi_pole
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end


variable = in;

% four order system
function radiobutton3_Callback(hObject, eventdata, handles)
global variable;
global alpha_fos;
prompt={'select param alfa 0.1 0.2 0.5 1'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = alpha_fos
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end

variable = in;

% half plane zero
function radiobutton4_Callback(hObject, eventdata, handles)
global variable;
global alpha_hpz;
prompt={'select param alfa 0.1 0.2 0.5 1 2 5'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = alpha_hpz
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

%time delay and lagh
function radiobutton5_Callback(hObject, eventdata, handles)
global variable;
global time_dl;
prompt={'select param time 0 0.1 0.2 0.5 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = time_dl
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

%time delay and double Lag
function radiobutton6_Callback(hObject, eventdata, handles)
global variable;
global time_ddl;
prompt={'select param time 0 0.1 0.2 0.5 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = time_ddl
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

%fast and slow modes
function radiobutton7_Callback(hObject, eventdata, handles)
global variable ;
variable = 1; 

% oscillatory sistem.
function radiobutton8_Callback(hObject, eventdata, handles)
global variable;
global omegazero;
prompt={'select param time 1 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = omegazero
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

%unstable pole
function radiobutton9_Callback(hObject, eventdata, handles)
global variable ;
variable = 1;  

% multi poles integral
function radiobutton10_Callback(hObject, eventdata, handles)
global multi_pole;
global variable;
prompt={'select order multiple poles 1 2 3 4 8'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input));
check = 0;
for element = multi_pole
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

% four order system integral
function radiobutton11_Callback(hObject, eventdata, handles)
global variable;
global alpha_fos;
prompt={'select param alfa 0.1 0.2 0.5 1'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = alpha_fos
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

% half plane zero integral
function radiobutton12_Callback(hObject, eventdata, handles)
global variable;
global alpha_hpz;
prompt={'select param alfa 0.1 0.2 0.5 1 2 5'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = alpha_hpz
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

% time delay and Lag integral
function radiobutton13_Callback(hObject, eventdata, handles)
global variable;
global time_dl;
prompt={'select param time 0 0.1 0.2 0.5 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = time_dl
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;

% time delay and double Lag integral
function radiobutton14_Callback(hObject, eventdata, handles)
global variable;
global time_ddl;
prompt={'select param time 0 0.1 0.2 0.5 2 5 10'};
title='inserimento sistema';
input = inputdlg(prompt, title);
sizeinput = size(input);
if (sizeinput == 0) 
    return
end
in = str2num(cell2mat(input(1,1)));
check = 0;
for element = time_ddl
       if  element == in
         check = 1;
         msgbox('Operation Correct');
       end
end
if check == 0
    msgbox('Error costant, please recreate system', 'Errore!', 'error');
    variable = -1;  
    return;
end
variable = in;


%% custom system
function radiobutton20_Callback(hObject, eventdata, handles)
global variable ;
global system;

prompt={'zero', 'poles', 'k' ,'time delay'};
title='inserimento sistema';
u_dati = inputdlg(prompt, title);

dim_m_u_dati = size(u_dati);
dim_u_dati = dim_m_u_dati(1,1);

if (dim_u_dati == 0) 
    return
end
a = eval(cell2mat(u_dati(1,1)));
b = eval(cell2mat(u_dati(2,1)));
c = eval(cell2mat(u_dati(3,1)));
t = eval(cell2mat(u_dati(4,1)));
s = tf('s');
try
    sys = zpk(a, b, c);
catch
    msgbox('Errore nella creazione del sistema inserito..', 'Errore!', 'error');
    variable = -1;  
    return;
end
create = 1;
for in = a
    create = create * (s+in + 1);
end
for in = b
    create = create / (s+in + 1);
end
    system = create *exp(-s*t);
    save 'system' ; 
variable = -1;


%% Start Simulation
function pushbutton1_Callback(hObject, eventdata, handles)
        global variable ;
        global system;
        s = tf('s');
        elementSelection = get(handles.uibuttongroup,'SelectedObject');
        global strSelection
        strSelection = get(elementSelection,'String');
        
        if variable == -1
            msgbox('Please select a system', 'Errore!', 'error');
            return;
        end

%% System Transfer Function Selection
        
        switch strSelection
            case 'Select a System'
                msgbox('Error costant, please recreate system', 'Errore!', 'error');
            case 'Multiple Equal Poles'
                G = 1/(s+1)^variable
            case 'Fourth Order System'
                G = 1/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s)
            case 'Right Half Plane Zero'
                G = (1-variable*s)/(s+1)^3
            case 'Time Delay and Lag'
                G = (1/(1+variable*s))*exp(-s)
            case 'Time Delay and Double Lag'
                G = (1/(1+variable*s)^2)*exp(-s)
            case 'Fast and Slow Modes'
                G = (100/(s+10)^2)*((1/s+1)+(0.5/s+0.05))
            case 'Oscillatory System'
                G = (variable*variable)/(s+1)/(s^2+(2*0.1*variable*s)+(variable*variable))
            case 'Unstable Pole'
                G = 1/(s^2-1)
            case 'Multiple Equal Poles Integral'
                G = 1/s/(s+1)^variable
            case 'Fourth Order System Integral'
                G = 1/s/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s)
            case 'Right Half Plane Zero Integral'
                G = (1-variable*s)/s/(s+1)^3
            case 'Time Delay and Lag Integral'
                G = (1/s/(1+variable*s))*exp(-s)
            case 'Time Delay and Double Lag Integral'
                G = (1/s/(1+variable*s)^2)*exp(-s)
            case 'Custom'
                G = system; %leggere da una matrice come esempio del profe
            otherwise
                G = [];
        end
        analized = struct;
        analized.type = variable;
        analized.name = strSelection;
        analized.systemTransferFunction = G;

        %time step
        dt = 0.0001;
        global minimum_IAE;

 %% Genetic Algorithm Paremeters
%         G = exp(-2.9e-08*s)*(-1.717e08*s + 7.18e13)/(s^2 + 2.141e05*s + 2.348e10)
%         G = 210.46/(3.52e-6*s^2+2.58e-2*s+1)2.795e19*
        G = 4.35e13/(s^2 + 1.59e05*s + 1.423e10)
        %Population Size of each Iteration
        PopSize = 1;
        MaxGeneration = 1;
        
%% PID genetic algorithm
        %rng(1,'twister') % for reproducibility
%         population = rand(PopSize,4);
        
        for k=1:PopSize
           population = [0.00179 0.063 0.75 0.042];
        end

%         %lower bounds lb
        lb_PID = [0.01 0.01 0.01 0.01];
%         %upper bounds ub 
        ub_PID = [4.1 5.46 2 50];

        clear ms_gaoutfun
        
        options = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population,'OutputFcn',@ms_gaoutfun);
        [control,IAE] = ga(@(K)ms_pidtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],options);
        record_PID = ms_gaoutfun();
        save 'ms_history_PID.mat'  record_PID ;
        K_pid = control(1)*(1 + 1/(s*control(2)) + (control(3)*s)/(1 + s*(control(3)/control(4))));        

        Loop_PID = series(K_pid,G);
        global ClosedLoop_PID;

        
        ClosedLoop_PID = feedback(Loop_PID,1);
        t = 0:dt:100;
        [y,t] = step(ClosedLoop_PID,t);
        IAE=sum(abs(1-y)*dt);
        analized.Sensitivity.pid = peakgain_research(feedback(1,Loop_PID));
        analized.Controller.pid = K_pid
        
        analized.Loop.pid = Loop_PID;
        analized.ClosedLoop.pid = ClosedLoop_PID;
        
        info = stepinfo(ClosedLoop_PID);
        analized.pid = ms_ga_info_to_struct(IAE,control,info,'pid');
        analized.time = info.SettlingTime;
        
 %% Minum Error
        minimum_IAE = 1000;       
 %% I-PD genetic algorithm      
        PopSize = 100;
        MaxGeneration = 1000;
%         rng(1,'twister') % for reproducibility
        population1 = rand(PopSize,4);

%         for k=1:PopSize
%            population1=[1.7540 2.1831e-05 6.3033 0.0089];
%         end
        
%         %lower bounds lb
%         lb_I_PD = [6.6 1.8 0.35 16];
%         %upper bounds ub 
%         ub_I_PD = [6.8 1.9 0.4 16.5];
        
        clear ms_gaoutfun
        options1 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population1,'OutputFcn',@ms_gaoutfun);
        [control1,IAE1] = ga(@(K)ms_ipdtest(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],options1);
        record_PI_D = ms_gaoutfun();       
        save 'ms_history_PI_D.mat'  record_PI_D ;        
        
        K1_ipd = control1(1)/(s*control1(2));
        K2_ipd = control1(1)*(1+(s*control1(3))/(1 + s*(control1(3)/control1(4))));
        
        ClosedLoop1_IPD = feedback(G,K2_ipd);
        Loop_IPD = series(K1_ipd,ClosedLoop1_IPD);
        global ClosedLoop_IPD;
        ClosedLoop_IPD = feedback(Loop_IPD,1);
        
        analized.Controller.ipd.K1 = K1_ipd;
        analized.Controller.ipd.K2 = K2_ipd;
        
        analized.Loop.ipd = Loop_IPD;
        analized.Sensitivity.ipd = peakgain_research(feedback(1,Loop_IPD));
        analized.ClosedLoop.ipd = ClosedLoop_IPD;
        info = stepinfo(ClosedLoop_IPD); 
        
        analized.ipd = ms_ga_info_to_struct(IAE1,control1,info,'i_pd');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
 %% Minum Error
        minimum_IAE = 1000;       
 %%   PI-D genetic algorithm 

        PopSize = 1;
        MaxGeneration = 1;
        %rng(1,'twister') % for reproducibility
        population2= rand(PopSize,4);

%         for k=1:PopSize
%            population2=[5.7979e-04 1.5492e-05 0.0861 1.3406];
%         end


%         %lower bounds lb
%         lb_PI_D = [4.4 7 0.4 36];
%         %upper bounds ub 
%         ub_PI_D = [4.5 7.2 0.5 36.2];
         
        clear ms_gaoutfun
        options2 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population2,'OutputFcn',@ms_gaoutfun);
        [control2,IAE2] = ga(@(K)ms_dpitest(G,dt,K),4,-eye(4),zeros(4,1),[],[],[],[],[],options2);
        record_I_PD = ms_gaoutfun();
        save 'ms_history_I_PD.mat'  record_I_PD ;    
        
        K1_dpi = control2(1);
        K2_dpi = control2(1)/(s*control2(2));
        K3_dpi = control2(1)*((s*control2(3))/(1+s*(control2(3)/control2(4))));
                
        global ClosedLoop_DPI;
        ClosedLoop_DPI = minreal((G*(K1_dpi+K2_dpi))/(1+(G*K3_dpi)+(G*(K1_dpi+K2_dpi))));
        
        analized.Controller.dpi.K1 = K1_dpi;
        analized.Controller.dpi.K2 = K2_dpi;
        analized.Controller.dpi.K3 = K3_dpi;
        Loop_DPI = (K1_dpi+K2_dpi)*(G/(1+(G*K3_dpi)));
        analized.Loop.dpi = Loop_DPI;
        analized.ClosedLoop.dpi = ClosedLoop_DPI;
        analized.Sensitivity.dpi = peakgain_research(feedback(1,Loop_DPI));
        info = stepinfo(ClosedLoop_DPI); 
        analized.dpi = ms_ga_info_to_struct(IAE2,control2,info,'pi_d');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
%% Minum Error
        minimum_IAE = 1000;        
%% PIDA genetic algorithm
        PopSize = 1;
        MaxGeneration = 1;
%         rng(1,'twister') % for reproducibility
%         population3 = rand(PopSize,6);
       
       for k=1:PopSize
          population3=[0.00179 0.063 0.75 2.4 0.28 0.042];       
       end

        %lower bounds lb
        lb_PIDA = [0.01 0.01 0.01 0.01 0.01 0.01];
        %upper bounds ub 
        
        
        clear ms_gaoutfun
        options3 = optimoptions(@ga,'PopulationSize',PopSize,'MaxGeneration',MaxGeneration,'InitialPopulation',population3,'OutputFcn',@ms_gaoutfun);
        [control3,IAE3] = ga(@(K)ms_pidatest(G,dt,K),6,-eye(6),zeros(6,1),[],[],[],[],[],options3);
        record_PIDA = ms_gaoutfun();
        save 'ms_history_PIDA.mat'  record_PIDA ;

        K_pida = control3(1)*(1 + 1/(s*control3(2)) + (control3(3)*s)/(1 + s*(control3(3)/control3(6))) + (control3(4)*s^2)/((1 + s*(control3(4)/control3(5)))^2)); 
       
        Loop_PIDA = series(K_pida,G);
        global ClosedLoop_PIDA;
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);
        t = 0:dt:100;
        [y1,t] = step(ClosedLoop_PIDA,t);
        IAE3=sum(abs(1-y1)*dt);
        analized.Controller.pida = K_pida
        analized.Loop.pida = Loop_PIDA;
        analized.Sensitivity.pida = peakgain_research(feedback(1,Loop_PIDA));
        analized.ClosedLoop.pida = ClosedLoop_PIDA;
        info = stepinfo(ClosedLoop_PIDA);     
        analized.pida = ms_ga_info_to_struct(IAE3,control3,info,'pida');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end       
       
%% export to Excel
        ms_print_excel(analized,strSelection,variable);
        msgbox('end simulation');
        clear all;

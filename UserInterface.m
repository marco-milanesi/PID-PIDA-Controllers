function varargout = UserInterface(varargin)
% USERINTERFACE MATLAB code for UserInterface.fig
%      USERINTERFACE, by itself, creates a new USERINTERFACE or raises the existing
%      singleton*.
%
%      H = USERINTERFACE returns the handle to a new USERINTERFACE or the handle to
%      the existing singleton*.
%
%      USERINTERFACE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USERINTERFACE.M with the given input arguments.
%
%      USERINTERFACE('Property','Value',...) creates a new USERINTERFACE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UserInterface_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UserInterface_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES



% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UserInterface_OpeningFcn, ...
                   'gui_OutputFcn',  @UserInterface_OutputFcn, ...
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

% --- Executes just before UserInterface is made visible.
function UserInterface_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UserInterface (see VARARGIN)

% Choose default command line output for UserInterface
handles.output = hObject;
global variable;
global multi_pole; 
global alpha_fos; 
global alpha_hpz;
global time_dl;
global time_ddl;
global omegazero;

global isZoom;
global startTime;
global endTime;
        
multi_pole = [1 2 3 4 8];
alpha_fos = [0.1 0.2 0.5 1];
alpha_hpz = [0.1 0.2 0.5 1 2 5];
time_dl=[0 0.1 0.2 0.5 2 5 10];
time_ddl=[0 0.1 0.2 0.5 2 5 10];
omegazero = [1 2 5 10];
        
% Update handles structure
guidata(hObject, handles);

function varargout = UserInterface_OutputFcn(hObject, eventdata, handles) 

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
    return;
end
variable = in;
%fast and slow modes
function radiobutton7_Callback(hObject, eventdata, handles)
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
    return;
end
variable = in;
%unstable pole
function radiobutton9_Callback(hObject, eventdata, handles)
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
    return;
end
variable = in;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

        global isZoom;
        isZoom = 0;
        global startTime;
        global endTime;
        analized = struct;
        global variable;

        s = tf('s');
        elementSelection = get(handles.uibuttongroup,'SelectedObject');
        global strSelection
        strSelection = get(elementSelection,'String');
        
        %System Transfer Function Selection
        switch strSelection
            case 'Select a System'
                msgbox('Error costant, please recreate system', 'Errore!', 'error');
            case 'Multiple Equal Poles'
                G = 1/(s+1)^variable;
            case 'Fourth Order System'
                G = 1/(s+1)/(1+variable*s)/(1+variable^2*s)/(1+variable^3*s);
            case 'Right Half Plane Zero'
                G = 1-0.1*s/(s+1)^3; 
            case 'Time Delay and Lag'
                G = (1/(1+0.1*s))*exp(-s);
            case 'Time Delay and Double Lag'
                G = (1/(1+0.1*s)^2)*exp(-s);
            case 'Fast and Slow Modes'
                G = (100/(s+10)^2)*((1/s+1)+(0.5/s+0.05));
            case 'Oscillatory System'
                G = 1/(s+1)/(s^2+0.2*s+1);
            case 'Unstable Pole'
                G = 1/(s^2-1);
            case 'Multiple Equal Poles Integral'
                G = 1/s/(s+1);
            case 'Fourth Order System Integral'
                G = 1/s/(s+1)/(1+0.1*s)/(1+0.1^2*s)/(1+0.1^3*s);
            case 'Right Half Plane Zero Integral'
                G = (1-0.1*s)/s/(s+1)^3; 
            case 'Time Delay and Lag Integral'
                G = (1/s/(1+0.1*s))*exp(-s);
            case 'Time Delay and Double Lag Integral'
                G = (1/s/(1+0.1*s)^2)*exp(-s);
            case 'custom'
                G =[]; %leggere da una matrice come esempio del profe
            otherwise
                G = [];
        end

        %time step
        dt = 0.001;
        %Genetic Algorithm Paremeters
        %Population Size of each Iteration
        PopSize = 5;
        options = optimoptions(@ga,'PopulationSize',PopSize,'TolFun',1e-3,'useparallel',true);

        %{
        PID genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3)= Td
        x(4)= N
        %}         
        %lower bounds lb
        lb_PID = [0.001 0.1 0.1 5];
        %upper bounds ub 
        ub_PID = [10 500 50 20];
        
        [control,IAE] = ga(@(K)pidtest(G,dt,K),4,[],[],[],[],lb_PID,ub_PID,[],options);
        
        K = control(1) + control(2)/s + (control(3)*s)/(1 + s*(control(3)/control(4)));
        
        Loop_PID = series(K,G);
        global ClosedLoop_PID;
        ClosedLoop_PID = feedback(Loop_PID,1);
        info = stepinfo(ClosedLoop_PID);
        analized.pid = ga_info_to_struct(IAE,control,info,'pid');
        analized.time = info.SettlingTime;
        
        global Disturb_PID;
        Disturb_PID = feedback(G,K);
        info = stepinfo(Disturb_PID);
        
        analized.pid_dist =  ga_info_to_struct(IAE,control,info,'pid');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        
        
        %{
        I-PD genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        %}         
        %lower bounds lb 
        lb_PID = [0.001 0.1 0.1 5];
        %upper bounds ub 
        ub_PID = [10 500 50 20];
        [control,IAE] = ga(@(K)ipdtest(G,dt,K),4,[],[],[],[],lb_PID,ub_PID,[],options);
        
        K1 = control(1)/(s*control(2));
        K2 = control(1)*(1+(s*control(2)))/(1 + s*(control(3)/control(4)));
        
        ClosedLoop1_IPD = feedback(G,K2);
        Loop_IPD = series(K1,ClosedLoop1_IPD);
        global ClosedLoop_IPD;
        ClosedLoop_IPD = feedback(Loop_IPD,1);
        info = stepinfo(ClosedLoop_IPD); 
        analized.ipd = ga_info_to_struct(IAE,control,info,'i_pd');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        global Disturb_IPD;
        Disturb_IPD = feedback(G,(K1+K2));
        info = stepinfo(Disturb_IPD);
        analized.ipd_dist =  ga_info_to_struct(IAE,control,info,'i_pd');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        
        
        %{
        PI-D genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        %}         
        %lower bounds lb 
        lb_PID = [0.001 0.1 0.1 5];
        %upper bounds ub 
        ub_PID = [10 500 50 20];
        [control,IAE] = ga(@(K)ipdtest(G,dt,K),4,[],[],[],[],lb_PID,ub_PID,[],options);
        
        K1 = control(1);
        K2 = control(1)/(s*control(2));
        K3 = control(1)*(1+((s*control(3))/(1+(control(3)*s/control(4)))));
        
        global ClosedLoop_DPI;
        ClosedLoop_DPI = (G*(K1+K2))/(1+G*(K2+K3));
        info = stepinfo(ClosedLoop_DPI); 
        analized.dpi = ga_info_to_struct(IAE,control,info,'pi_d');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        global Disturb_DPI;
        Disturb_DPI = feedback(G,K2+K3);
        info = stepinfo(Disturb_DPI); 
        analized.dpi_dist =  ga_info_to_struct(IAE,control,info,'pi_d');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end
        
        

        %{
        PIDA genetic algorithm
        x(1) = Kp
        x(2) = Ti
        x(3) = Td
        x(4) = N
        x(5) = Ta
        x(6) = alfa
        %}
                    
        %lower bounds lb 
        lb_PIDA = [0.001 0.1 0.1 5 0.1 5];
        %upper bounds ub 
        ub_PIDA = [10 500 50 20 50 20];
        
        [control,IAE] = ga(@(K)pidatest(G,dt,K),6,[],[],[],[],lb_PIDA,ub_PIDA,[],options);
        
        K = control(1) + control(2)/s + (control(3)*s)/(1 + s*(control(3)/control(4))) + (control(5)*s^2)/((1 + s*control(5)/control(6))^2); 
       
        Loop_PIDA = series(K,G);
        global ClosedLoop_PIDA;
        ClosedLoop_PIDA = feedback(Loop_PIDA,1);
        info = stepinfo(ClosedLoop_PIDA);     
        analized.pida = ga_info_to_struct(IAE,control,info,'pida');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end       
        
        global Disturb_PIDA;
        Disturb_PIDA = feedback(G,K);
        info = stepinfo(Disturb_PIDA);
        analized.pida_dist = ga_info_to_struct(IAE,control,info,'pida');
        if analized.time < info.SettlingTime
            analized.time = info.SettlingTime;
        end           
                  
        
        
        %time array simulation
        t_sim =0:dt:analized.time * 2;
        
        %reference tracking plote
        subplot(2,2,[1,2]);
        plot(t_sim,step(ClosedLoop_PID,t_sim),'r-',t_sim,step(ClosedLoop_IPD,t_sim),'b-',t_sim,step(ClosedLoop_DPI,t_sim),'k-',t_sim,step(ClosedLoop_PIDA,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
        title('reference tracking');
        xlabel('time');
        ylabel('amplitude');
        grid on;
        
        %disturbance rejection plote
        subplot(2,2,[3,4]);
        plot(t_sim,step(Disturb_PID,t_sim),'r-',t_sim,step(Disturb_IPD,t_sim),'b-',t_sim,step(Disturb_DPI,t_sim),'k-',t_sim,step(Disturb_PIDA,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
        title('disturbance rejection');
        xlabel('time');
        ylabel('amplitude');
        grid on;

        %export to Excel
        print_excel(analized,strSelection);

        
        




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global ClosedLoop_PID;
global Disturb_PID;
global ClosedLoop_IPD;
global Disturb_IPD;
global ClosedLoop_DPI;
global Disturb_DPI;
global ClosedLoop_PIDA;
global Disturb_PIDA;



prompt = {'inizio:', 'fine:'};
title = 'Inizo - fine tempo di simulazione';
in = inputdlg(prompt, title);
global startTime;
startTime = str2num(cell2mat(in(1,1)));
global endTime;
endTime = str2num(cell2mat(in(2,1)));

%time array simulation
        dt = 0.001;
        t_sim =startTime:dt:endTime;
        
        %reference tracking plote
        subplot(2,2,[1,2]);
        plot(t_sim,step(ClosedLoop_PID,t_sim),'r-',t_sim,step(ClosedLoop_IPD,t_sim),'b-',t_sim,step(ClosedLoop_DPI,t_sim),'k-',t_sim,step(ClosedLoop_PIDA,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
%         title('test');
        xlabel('time');
        ylabel('amplitude');
        grid on;
        
        %disturbance rejection plote
        subplot(2,2,[3,4]);
        plot(t_sim,step(Disturb_PID,t_sim),'r-',t_sim,step(Disturb_IPD,t_sim),'b-',t_sim,step(Disturb_DPI,t_sim),'k-',t_sim,step(Disturb_PIDA,t_sim),'m-');
        legend('PID','I-PD','PI-D','PIDA');
%         title('disturbance rejection');
        xlabel('time');
        ylabel('amplitude');
        grid on;

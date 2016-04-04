function varargout = main_gui2(varargin)


% MAIN_GUI2 MATLAB code for main_gui2.fig
%      MAIN_GUI2, by itself, creates a new MAIN_GUI2 or raises the existing
%      singleton*.
%
%      H = MAIN_GUI2 returns the handle to a new MAIN_GUI2 or the handle to
%      the existing singleton*.
%
%      MAIN_GUI2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_GUI2.M with the given input arguments.
%
%      MAIN_GUI2('Property','Value',...) creates a new MAIN_GUI2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_gui2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_gui2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_gui2

% Last Modified by GUIDE v2.5 26-Sep-2011 13:30:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_gui2_OpeningFcn, ...
                   'gui_OutputFcn',  @main_gui2_OutputFcn, ...
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


% --- Executes just before main_gui2 is made visible.
function main_gui2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_gui2 (see VARARGIN)
axes(handles.logo);
imshow('spectrum.jpg')
% Choose default command line output for main_gui2
handles.output = hObject;
nonurse=2;
notherapy=2;
handles.nonurse=nonurse;
handles.notherapy=notherapy;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_gui2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_gui2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadCSV.
function loadCSV_Callback(hObject, eventdata, handles)
% hObject    handle to loadCSV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Get filname:
handles.fileName = uigetfile('*.csv');

%If no therapy file selected, set flag to ensure only 1 data set plotted
%later
if (ischar(handles.fileName)~=1)
    notherapy=1
    handles.notherapy=notherapy;
    guidata(hObject,handles);
    helpdlg('No therapy.csv file selected.');  
else
    %Once filename is chosen, update the plot with the data from col 1 &2
    %updatePlot(hObject, eventdata, handles)
    notherapy=0
    handles.notherapy=notherapy
    xcolumn  = 1;       %Treatment number
    ycolumn  = 2;       %TSBi    
    fileName = handles.fileName;
    [x1,y1] = readCSVdata(fileName, xcolumn, ycolumn)
    handles.x1=x1;
    handles.y1=y1;
    guidata(hObject,handles);
    helpdlg('Therapy.csv data loaded successfully.');  
end


function[x,y] = readCSVdata(fileName, xcolumn, ycolumn)
a = xlsread(fileName);
x = a(:,xcolumn); %column 1 to variable x
y = a(:,ycolumn); %column 2 to variable y

% --- Executes on button press in exitbutton.
function exitbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exitbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1)


% --- Executes on button press in nurse_button.
function nurse_button_Callback(hObject, eventdata, handles)
% hObject    handle to nurse_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Get filname:
handles.fileName = uigetfile('*.csv');

%If no therapy file selected, set flag to ensure only 1 data set plotted
%later
if (ischar(handles.fileName)~=1)
    nonurse=1
    handles.nonurse=nonurse;
    guidata(hObject,handles);
    helpdlg('No nurse.csv file selected.');  
else
    %Get treatment number and TSB values
    xcolumn  = 1;       %Treatment number
    ycolumn  = 2;       %TSBi    
    fileName = handles.fileName;
    [x2,y2] = readCSVdata(fileName, xcolumn, ycolumn)
    handles.x2=x2;
    handles.y2=y2;
    nonurse=0
    handles.nonurse=nonurse;
    guidata(hObject,handles);
    helpdlg('Nurse.csv data loaded successfully.');
end


% --- Executes on button press in plot_button.
function plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
notherapy=handles.notherapy
nonurse=handles.nonurse

%Markers 0, 1, and 2 for notherapy and no nurse indicate:
% 0: data has been added for nurse (or therapy) (so data exists for this)
% 1: uigetfile diaglog opened but exited without file being chosen (so no
% data)
% 2: uigetfile dialog never opened for that file (so no data)

%if ((notherapy==1||notherapy==2) && (nonurse==1||nonurse==2))
if ((notherapy~=0) && (nonurse~=0))
    helpdlg('No data selected to plot.');
    return
%When you have the therapy data but no nurse data
elseif ((nonurse~=0) && (notherapy==0))
    helpdlg('No nurse.csv file to plot. Plot of therapy.csv only.');
    plot(handles.axes1,handles.x1,handles.y1,handles.x1,0.*handles.y1+12,'r--');
    legend(handles.axes1,'TSB Predicted','Safe TSB Level Threshold','Location','NorthEast');
    xlabel(handles.axes1,'Number of Treatments');
    ylabel(handles.axes1,'TSB, mg/dL');
    title(handles.axes1,'Number of Treatments vs TSB');
    %hold on;  
    return
%When you have nurse data but no therapy data:
elseif ((nonurse==0) && (notherapy~=0))
    helpdlg('No therapy.csv file to plot. Plot of nurse.csv only.');
    plot(handles.axes1,handles.x2,handles.y2,handles.x2,0.*handles.y2+12,'r--');
    legend(handles.axes1,'TSB Measured','Safe TSB Level Threshold','Location','NorthEast');
    xlabel(handles.axes1,'Number of Treatments');
    ylabel(handles.axes1,'TSB, mg/dL');
    title(handles.axes1,'Number of Treatments vs TSB');
    %hold on;  
    return
else
    plot(handles.axes1,handles.x1,handles.y1,handles.x2,handles.y2,handles.x1,0.*handles.y1+12,'r--');
    legend(handles.axes1,'TSB Predicted','TSB Measured','Safe TSB Level Threshold','Location','NorthEast');
    xlabel(handles.axes1,'Number of Treatments');
    ylabel(handles.axes1,'TSB, mg/dL');
    title(handles.axes1,'Number of Treatments vs TSB');
    %hold on;
    return
end

% x1=handles.x1;
% y1=handles.y1;
% x2=handles.x2;
% y2=handles.y2;
% updatePlot(x1,y1,x2,y2, hObject, eventdata, handles)
% 
% 
% function updatePlot(x1,y1,x2,y2,hObject, eventdata, handles)
% plot(handles.axes1,x1,y1,x2,y2,handles.x1,0.*handles.y1+12,'r--');
% legend(handles.axes1,'TSB Predcited','TSB Measured','Safe TSB Level Threshold','Location','NorthEast');
% xlabel(handles.axes1,'Number of Treatments');
% ylabel(handles.axes1,'TSB, mg/dL');
% title(handles.axes1,'Number of Treatments vs TSB');
% hold on;





function varargout = user_input_gui(varargin)
% USER_INPUT_GUI M-file for user_input_gui.fig
%      USER_INPUT_GUI, by itself, creates a new USER_INPUT_GUI or raises the existing
%      singleton*.
%
%      H = USER_INPUT_GUI returns the handle to a new USER_INPUT_GUI or the handle to
%      the existing singleton*.
%
%      USER_INPUT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in USER_INPUT_GUI.M with the given input arguments.
%
%      USER_INPUT_GUI('Property','Value',...) creates a new USER_INPUT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before user_input_gui_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to user_input_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help user_input_gui

% Last Modified by GUIDE v2.5 13-Oct-2011 15:10:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @user_input_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @user_input_gui_OutputFcn, ...
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


% --- Executes just before user_input_gui is made visible.
function user_input_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to user_input_gui (see VARARGIN)
axes(handles.logo);
imshow('spectrum.jpg')

% Choose default command line output for user_input_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes user_input_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = user_input_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function TSBi_value_Callback(hObject, eventdata, handles)
% hObject    handle to TSBi_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TSBi_value as text
%        str2double(get(hObject,'String')) returns contents of TSBi_value as a double


% --- Executes during object creation, after setting all properties.
function TSBi_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TSBi_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function BW_value_Callback(hObject, eventdata, handles)
% hObject    handle to BW_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of BW_value as text
%        str2double(get(hObject,'String')) returns contents of BW_value as a double



% --- Executes during object creation, after setting all properties.
function BW_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BW_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function name_value_Callback(hObject, eventdata, handles)
% hObject    handle to name_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name_value as text
%        str2double(get(hObject,'String')) returns contents of name_value as a double


% --- Executes during object creation, after setting all properties.
function name_value_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in tsb_menu.
function tsb_menu_Callback(hObject, eventdata, handles)
% hObject    handle to tsb_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns tsb_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from tsb_menu

%gets the selected option
handles.tsb=1;
switch get(handles.tsb_menu,'Value')
    case 1
        return;
    case 2
        handles.tsb=1;
    case 3
        handles.tsb=2;
    otherwise
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function tsb_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tsb_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in weight_menu.
function weight_menu_Callback(hObject, eventdata, handles)
% hObject    handle to weight_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns weight_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from weight_menu
handles.weight=0;
switch get(handles.weight_menu,'Value')
    case 1
        return;
    case 2
        handles.weight=1;
    case 3
        handles.weight=2;
    case 4
        handles.weight=3;
    otherwise
end
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function weight_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to weight_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OKbutton.
function OKbutton_Callback(hObject, eventdata, handles)
% hObject    handle to OKbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Name=get(handles.name_value,'String')
TSBi=round(str2double(get(handles.TSBi_value,'String'))*10000000)/10000000
BW=round(str2double(get(handles.BW_value,'String'))*100000)/100000   %Get value in BW_value field, convert string to number, round to 6 dec places
tsb=handles.tsb
weight=handles.weight
    
%If the TSB units are entered in umol/L convert them to mg\dL:
    if tsb==2
        TSBi=TSBi/17.104
    else
        TSBi=TSBi  %explicit control of final option
    end

    %If the weight units are not entered in grams, convert to grams:
    if weight==2
        BW=BW*1000     %convert from kg to grams
    elseif weight==3
        BW=BW*453.59237 %covert from pounds to grams
    else
        BW=BW  %explict control of final option
    end
writeCSV(TSBi,BW,Name, tsb, weight) 

function writeCSV(TSBi,BW,babyName, tsb, weight)

    %addpath('C:\Users\Genevieve\Documents\Dropbox\SunshineJaundiceProject\ComputerInterface');
    delete('nurse.csv');
    delete('treatment.csv');
    delete('patient.csv');
    fid = fopen('patient.csv','w+');
  

    
     %Error testing  
    if (BW<800) 
        fclose(fid);
        errordlg('Birth weight too low. Treat in hospital. Please exit program.');
        return;
    elseif (isnan(BW)==1)
        fclose(fid);
        warndlg('Birth weight in incorrect format. Please re-enter value.');
        return;
    elseif (length(babyName)>16)
        fclose(fid);
        warndlg('Name too long. Please enter shorter name.');
        return;
    elseif (TSBi>22)        
        fclose(fid);
        errordlg('TSB too high. Treat in hospital. Please exit program.');
        return;
     elseif (isnan(TSBi)==1)      
        fclose(fid);
        warndlg('TSB in incorrect format. Please re-enter value.');
        return;
    elseif (TSBi==0 || TSBi<0)      
        fclose(fid);
        errordlg('TSB is zero or negative. Please enter non-zero, positive value.');
        return;        
    else
        fprintf(fid,'TSBi:,%f\nBW:,%f\nName:,%s\n',TSBi,BW,babyName);
        fclose(fid);
        helpdlg('Patient file written successfully. Please exit program.');
    end



% --- Executes on button press in exit_button.
function exit_button_Callback(hObject, eventdata, handles)
% hObject    handle to exit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1)





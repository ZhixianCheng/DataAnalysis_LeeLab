function varargout = AnalysisHub_Version2(varargin)
% ANALYSISHUB_VERSION2 MATLAB code for AnalysisHub_Version2.fig
%      ANALYSISHUB_VERSION2, by itself, creates a new ANALYSISHUB_VERSION2 or raises the existing
%      singleton*.
%
%      H = ANALYSISHUB_VERSION2 returns the handle to a new ANALYSISHUB_VERSION2 or the handle to
%      the existing singleton*.
%
%      ANALYSISHUB_VERSION2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANALYSISHUB_VERSION2.M with the given input arguments.
%
%      ANALYSISHUB_VERSION2('Property','Value',...) creates a new ANALYSISHUB_VERSION2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AnalysisHub_Version2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AnalysisHub_Version2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AnalysisHub_Version2

% Last Modified by GUIDE v2.5 21-Nov-2017 11:10:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AnalysisHub_Version2_OpeningFcn, ...
                   'gui_OutputFcn',  @AnalysisHub_Version2_OutputFcn, ...
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


% --- Executes just before AnalysisHub_Version2 is made visible.
function AnalysisHub_Version2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AnalysisHub_Version2 (see VARARGIN)

% Choose default command line output for AnalysisHub_Version2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AnalysisHub_Version2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AnalysisHub_Version2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in OpenPush.
function OpenPush_Callback(hObject, eventdata, handles)
% hObject    handle to OpenPush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir; % czx 20171118
set(handles.edit1,'string',folder_name); %czx 20171118


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SavePush.
function SavePush_Callback(hObject, eventdata, handles)
% hObject    handle to SavePush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[save_name,save_path] = uiputfile; % czx 20171118



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AnalyzePush.
function AnalyzePush_Callback(hObject, eventdata, handles) % final executation of the analysis,czx
% hObject    handle to AnalyzePush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(handles.listbox1,'String')); % czx 20171118
select_analysis = contents{get(handles.listbox1,'Value')} ;% czx 20171118
fpath = get(handles.edit1,'string');% czx 20171118
fname = get(handles.edit2,'string');% czx 20171118
dailyBeha = get(handles.edit4,'string'); %czx 20171121
if strcmp(select_analysis,'psBehaAnalysisBatch')% czx 20171118
    psBehaAnalysisBatch(fpath,fname)% czx 20171118
elseif strcmp(select_analysis,'psDailyBeha')% czx 20171118
    psDailyBeha([fpath '\' dailyBeha],fname) % czx 20171121 analyzing the behavior data for every individual session
    % fpath in this case contains the direction and name of the analyzed
    % data czx 20171121
elseif strcmp(select_analysis,'ITGSingleNeuron')
   
    
else 
    TestMyGui;
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles) % select the analysis script and feed it into 'AnalyzePush', czx
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
set(handles.listbox1,'string',{'psBehaAnalysisBatch','psDailyBeha','ITGSingleNeuron','Test'}); % czx 20171118


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles) % to turn on matlab plot czx20171118
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles) % choose the file to analyze
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fileName = uigetfile; %czx 20171121
set(handles.edit4,'string',fileName); %czx 20171121



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

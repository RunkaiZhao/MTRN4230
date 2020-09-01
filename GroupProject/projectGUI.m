
function varargout = projectGUI(varargin)
% PROJECTGUI MATLAB code for projectGUI.fig
%      PROJECTGUI, by itself, creates a new PROJECTGUI or raises the existing
%      singleton*.
%
%      H = PROJECTGUI returns the handle to a new PROJECTGUI or the handle to
%      the existing singleton*.
%
%      PROJECTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTGUI.M with the given input arguments.
%
%      PROJECTGUI('Property','Value',...) creates a new PROJECTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projectGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projectGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projectGUI

% Last Modified by GUIDE v2.5 26-Aug-2020 15:09:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projectGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @projectGUI_OutputFcn, ...
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


% --- Executes just before projectGUI is made visible.
function projectGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projectGUI (see VARARGIN)

% Choose default command line output for projectGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes projectGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = projectGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function redSq_Callback(hObject, eventdata, handles)
% hObject    handle to redSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of redSq as text
%        str2double(get(hObject,'String')) returns contents of redSq as a double


% --- Executes during object creation, after setting all properties.
function redSq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function redCyl_Callback(hObject, eventdata, handles)
% hObject    handle to redCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of redCyl as text
%        str2double(get(hObject,'String')) returns contents of redCyl as a double


% --- Executes during object creation, after setting all properties.
function redCyl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function redPoly_Callback(hObject, eventdata, handles)
% hObject    handle to redPoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of redPoly as text
%        str2double(get(hObject,'String')) returns contents of redPoly as a double


% --- Executes during object creation, after setting all properties.
function redPoly_CreateFcn(hObject, eventdata, handles)
% hObject    handle to redPoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function customerMsg = pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%     numRedSq = str2double(get(handles.redSq, 'string'));
%     numRedRec = str2double(get(handles.redPoly, 'string'));
%     numRedCyl = str2double(get(handles.redCyl, 'string'));
%     
%     numBlackSq = str2double(get(handles.blackSq, 'string'));
%     numBlackRec = str2double(get(handles.blackRec, 'string'));
%     numBlackCyl = str2double(get(handles.blackCyl, 'string'));
%     
%     numGreenSq = str2double(get(handles.greenSq, 'string'));
%     numGreenRec = str2double(get(handles.greenRec, 'string'));
%     numGreenCyl = str2double(get(handles.greenCyl, 'string'));
%     
%     numYellowSq = str2double(get(handles.yellowSq, 'string'));
%     numYellowRec = str2double(get(handles.yellowRec, 'string'));
%     numYellowCyl = str2double(get(handles.yellowCyl, 'string'));
%     
%     customerMsg.red.square = numRedSq;
%     customerMsg.red.rectangle = numRedRec;
%     customerMsg.red.cylinder = numRedCyl;
%     
%     customerMsg.black.square = numBlackSq;
%     customerMsg.black.rectangle = numBlackRec;
%     customerMsg.black.cylinder = numBlackCyl;
%     
%     customerMsg.green.square = numGreenSq;
%     customerMsg.green.rectangle = numGreenRec;
%     customerMsg.green.cylinder = numGreenCyl;
%     
%     customerMsg.yellow.square = numYellowSq;
%     customerMsg.yellow.rectangle = numYellowRec;
%     customerMsg.yellow.cylinder = numYellowCyl;
%     
%     assignin('base', 'customerMsg', customerMsg)

    num = str2double(get(handles.num, 'string')); assignin('base', 'num', num);
    %request.shape = zeros(1, num);
    %request.color = zeros(1, num);
    %assignin('base', 'request', request);
    
    customerMsg = get(handles.redSq, 'value'); assignin('base', 'redSq', customerMsg);
    
    customerMsg = get(handles.redPoly, 'value'); assignin('base', 'redPoly', customerMsg);
    
    customerMsg = get(handles.redCyl, 'value'); assignin('base', 'redCyl', customerMsg);
    
    customerMsg = get(handles.blackSq, 'value'); assignin('base', 'blackSq', customerMsg);
    
    customerMsg = get(handles.blackPoly, 'value'); assignin('base', 'blackPoly', customerMsg);
    
    customerMsg = get(handles.blackCyl, 'value'); assignin('base', 'blackCyl', customerMsg);
    
    customerMsg = get(handles.greenSq, 'value'); assignin('base', 'greenSq', customerMsg);
    
    customerMsg = get(handles.greenPoly, 'value'); assignin('base', 'greenPoly', customerMsg);
    
    customerMsg = get(handles.greenCyl, 'value'); assignin('base', 'greenCyl', customerMsg);
    
    customerMsg = get(handles.yellowSq, 'value'); assignin('base', 'yellowSq', customerMsg);
    
    customerMsg = get(handles.yellowPoly, 'value'); assignin('base', 'yellowPoly', customerMsg);
    
    customerMsg = get(handles.yellowCyl, 'value'); assignin('base', 'yellowCyl', customerMsg);
    
    return
   
    
    
    



function blackSq_Callback(hObject, eventdata, handles)
% hObject    handle to blackSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blackSq as text
%        str2double(get(hObject,'String')) returns contents of blackSq as a double


% --- Executes during object creation, after setting all properties.
function blackSq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blackSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blackCyl_Callback(hObject, eventdata, handles)
% hObject    handle to blackCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blackCyl as text
%        str2double(get(hObject,'String')) returns contents of blackCyl as a double


% --- Executes during object creation, after setting all properties.
function blackCyl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blackCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blackRec_Callback(hObject, eventdata, handles)
% hObject    handle to blackRec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blackRec as text
%        str2double(get(hObject,'String')) returns contents of blackRec as a double


% --- Executes during object creation, after setting all properties.
function blackRec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blackRec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function greenSq_Callback(hObject, eventdata, handles)
% hObject    handle to greenSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of greenSq as text
%        str2double(get(hObject,'String')) returns contents of greenSq as a double


% --- Executes during object creation, after setting all properties.
function greenSq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function greenCyl_Callback(hObject, eventdata, handles)
% hObject    handle to greenCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of greenCyl as text
%        str2double(get(hObject,'String')) returns contents of greenCyl as a double


% --- Executes during object creation, after setting all properties.
function greenCyl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function greenRec_Callback(hObject, eventdata, handles)
% hObject    handle to greenRec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of greenRec as text
%        str2double(get(hObject,'String')) returns contents of greenRec as a double


% --- Executes during object creation, after setting all properties.
function greenRec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to greenRec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yellowSq_Callback(hObject, eventdata, handles)
% hObject    handle to yellowSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yellowSq as text
%        str2double(get(hObject,'String')) returns contents of yellowSq as a double


% --- Executes during object creation, after setting all properties.
function yellowSq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yellowSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yellowCyl_Callback(hObject, eventdata, handles)
% hObject    handle to yellowCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yellowCyl as text
%        str2double(get(hObject,'String')) returns contents of yellowCyl as a double


% --- Executes during object creation, after setting all properties.
function yellowCyl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yellowCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yellowRec_Callback(hObject, eventdata, handles)
% hObject    handle to yellowRec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yellowRec as text
%        str2double(get(hObject,'String')) returns contents of yellowRec as a double


% --- Executes during object creation, after setting all properties.
function yellowRec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yellowRec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in redCyl.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to redCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of redCyl


% --- Executes on button press in blackSq.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to blackSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of blackSq


% --- Executes on button press in blackPoly.
function blackPoly_Callback(hObject, eventdata, handles)
% hObject    handle to blackPoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of blackPoly


% --- Executes on button press in blackCyl.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to blackCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of blackCyl


% --- Executes on button press in greenSq.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to greenSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of greenSq


% --- Executes on button press in greenPoly.
function greenPoly_Callback(hObject, eventdata, handles)
% hObject    handle to greenPoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of greenPoly


% --- Executes on button press in greenCyl.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to greenCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of greenCyl


% --- Executes on button press in yellowSq.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to yellowSq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yellowSq


% --- Executes on button press in yellowPoly.
function yellowPoly_Callback(hObject, eventdata, handles)
% hObject    handle to yellowPoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yellowPoly


% --- Executes on button press in yellowCyl.
function radiobutton13_Callback(hObject, eventdata, handles)
% hObject    handle to yellowCyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yellowCyl



function num_Callback(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num as text
%        str2double(get(hObject,'String')) returns contents of num as a double


% --- Executes during object creation, after setting all properties.
function num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

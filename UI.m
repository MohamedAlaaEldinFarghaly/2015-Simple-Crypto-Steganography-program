function varargout = UI(varargin)
% UI MATLAB code for UI.fig
%      UI, by itself, creates a new UI or raises the existing
%      singleton*.
%
%      H = UI returns the handle to a new UI or the handle to
%      the existing singleton*.
%
%      UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UI.M with the given input arguments.
%
%      UI('Property','Value',...) creates a new UI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UI

% Last Modified by GUIDE v2.5 01-Jan-2015 21:11:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UI_OpeningFcn, ...
                   'gui_OutputFcn',  @UI_OutputFcn, ...
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


% --- Executes just before UI is made visible.
function UI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UI (see VARARGIN)

% Choose default command line output for UI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%this Button is Encryption button input the text in edit1(vmessage) and the
%original image loaded (x) to the functions of encryption (coding,embedcode
%and show the output image (new)in axes1 figure
global x new 

if isempty(x)
    msgbox('you do not load an image 1','Error','error');
    return
end
vmessage=get(handles.edit1,'string');
if isempty(vmessage)
   choice= questdlg('Sorry \n You did not type any text, Do you want to continue','Empty text','No','continue','continue');
   switch choice
    case 'No'
        return
    case 'continue'
        
   end
end

final=coding(vmessage);
source=im2uint16(x);   %converting the image to unsigned 16bit integers type
new=embedcode(final,source);
axes(handles.axes2)
imshow(new);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%this Button is Decryption button input the embedded code image (new) and the
%original image loaded (x) to the functions of decryption
%(getcode,getmessage)and show the text in static text box

global x new

if isempty(x)
    msgbox('you do not load an image 1','Error','error');
    return
end
if isempty(new)
    msgbox('you do not load an image 2','Error','error');
    return
end
source=im2uint16(x);  %converting the image to unsigned 16bit integers type

final=getcode(new,source);
txtmassage=getmassage(final);

%add '>' in the last character 
if txtmassage(length(txtmassage))~='>'
    txtmassage(length(txtmassage)+1)='>';
end
set(handles.text1,'string',txtmassage)



% --- Executes on button press in clearbutton1.
function clearbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to clearbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Clear the editbox  
set(handles.edit1,'string',[])

% --- Executes on button press in clearbutton2.
function clearbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to clearbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%CLear the static text box
set(handles.text1,'string',[])



% --- Executes on button press in loadbutton3.
function loadbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to loadbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This button is for  loading the image 2 which has embedded code for
%decryption

global new
[image cancel]=imgetfile();
if cancel
    msgbox('look out, you cancelled','Error','error');
    return
end

axes(handles.axes2);
new=imread(image);
imshow(new);


% --- Executes on button press in savebutton1.
function savebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Save button to write the embedded code image( new )

global new
[FileName,PathName,FilterIndex] = uiputfile({'*.jpg','*.png'},'Save image as','new')
file = fullfile(PathName, FileName);

imwrite(new,file);










% --- Executes on button press in loadbutton.
function loadbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loadbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%This button is for  loading the image 1 the original one  encryption

global x
[image cancel]=imgetfile();
if cancel
    msgbox('you cancelled','Error','error');
    return
end

axes(handles.axes1);
x=imread(image);
imshow(x);













% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%The reset button will clear the axes figures and the loaded images
clear global

cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
set(handles.axes1,'Visible','off')
set(handles.axes2,'Visible','off')






% --- Executes on button press in copybutton.
function copybutton_Callback(hObject, eventdata, handles)
% hObject    handle to copybutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%COPY button to copy the text in the static text as needed
copy=get(handles.text1,'string');
clipboard('copy',copy);

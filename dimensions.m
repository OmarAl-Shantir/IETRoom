function varargout = dimensions(varargin)
% DIMENSIONS MATLAB code for dimensions.fig
%      DIMENSIONS, by itself, creates a new DIMENSIONS or raises the existing
%      singleton*.
%      
%      dek=pi*half/sqrt(3);
% 
%      H = DIMENSIONS returns the handle to a new DIMENSIONS or the handle to
%      the existing singleton*.
%
%      DIMENSIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIMENSIONS.M with the given input arguments.
%
%      DIMENSIONS('Property','Value',...) creates a new DIMENSIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dimensions_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dimensions_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dimensions

% Last Modified by GUIDE v2.5 26-Nov-2019 12:54:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dimensions_OpeningFcn, ...
                   'gui_OutputFcn',  @dimensions_OutputFcn, ...
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


% --- Executes just before dimensions is made visible.
function dimensions_OpeningFcn(hObject, eventdata, handles, varargin)
global SData pHandles
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dimensions (see VARARGIN)

% Choose default command line output for dimensions
SData=varargin{1};
pHandles=varargin{2};

loadAll(hObject,eventdata, handles,SData);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dimensions wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dimensions_OutputFcn(hObject, eventdata, handles)
global SData
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = SData;

function loadAll(hObject, eventdata, handles, SData)
global pHandles
if ~isempty(SData)
    set(handles.edit32,'String',SData.SampleName);
    load(SData.m,handles.edit31);
    if SData.shape=='c'
        set(handles.radiobutton1,'Value',0);
        set(handles.radiobutton2,'Value',1);
        
        load(SData.SampleDim.l(1),handles.edit1);
        load(SData.SampleDim.l(2),handles.edit2);
        load(SData.SampleDim.l(3),handles.edit3);
        load(SData.SampleDim.l(4),handles.edit4);
        load(SData.SampleDim.l(5),handles.edit5);
        load(SData.SampleDim.l(6),handles.edit6);
        load(SData.SampleDim.l(7),handles.edit7);
        load(SData.SampleDim.l(8),handles.edit8);
        load(SData.SampleDim.l(9),handles.edit9);
        load(SData.SampleDim.l(10),handles.edit10);
        
        load(SData.SampleDim.d(1),handles.edit11);
        load(SData.SampleDim.d(2),handles.edit12);
        load(SData.SampleDim.d(3),handles.edit13);
        load(SData.SampleDim.d(4),handles.edit14);
        load(SData.SampleDim.d(5),handles.edit15);
        load(SData.SampleDim.d(6),handles.edit16);
        load(SData.SampleDim.d(7),handles.edit17);
        load(SData.SampleDim.d(8),handles.edit18);
        load(SData.SampleDim.d(9),handles.edit19);
        load(SData.SampleDim.d(10),handles.edit20);

        set(handles.text13,'String','d [mm]');
        set(handles.text14,'Visible','off');
    
        set(handles.edit21,'Visible','off');
        set(handles.edit22,'Visible','off');
        set(handles.edit23,'Visible','off');
        set(handles.edit24,'Visible','off');
        set(handles.edit25,'Visible','off');
        set(handles.edit26,'Visible','off');
        set(handles.edit27,'Visible','off');
        set(handles.edit28,'Visible','off');
        set(handles.edit29,'Visible','off');
        set(handles.edit30,'Visible','off');
   
        circle = imread('img/c.jpg');
        set(handles.axes1,'Units','pixels');
        axes(handles.axes1);
        imshow(circle);
    else
        set(handles.radiobutton1,'Value',1);
        set(handles.radiobutton2,'Value',0);
        
        load(SData.SampleDim.l(1),handles.edit1);
        load(SData.SampleDim.l(2),handles.edit2);
        load(SData.SampleDim.l(3),handles.edit3);
        load(SData.SampleDim.l(4),handles.edit4);
        load(SData.SampleDim.l(5),handles.edit5);
        load(SData.SampleDim.l(6),handles.edit6);
        load(SData.SampleDim.l(7),handles.edit7);
        load(SData.SampleDim.l(8),handles.edit8);
        load(SData.SampleDim.l(9),handles.edit9);
        load(SData.SampleDim.l(10),handles.edit10);
        
        load(SData.SampleDim.a(1),handles.edit11);
        load(SData.SampleDim.a(2),handles.edit12);
        load(SData.SampleDim.a(3),handles.edit13);
        load(SData.SampleDim.a(4),handles.edit14);
        load(SData.SampleDim.a(5),handles.edit15);
        load(SData.SampleDim.a(6),handles.edit16);
        load(SData.SampleDim.a(7),handles.edit17);
        load(SData.SampleDim.a(8),handles.edit18);
        load(SData.SampleDim.a(9),handles.edit19);
        load(SData.SampleDim.a(10),handles.edit20);
        
        load(SData.SampleDim.b(1),handles.edit21);
        load(SData.SampleDim.b(2),handles.edit22);
        load(SData.SampleDim.b(3),handles.edit23);
        load(SData.SampleDim.b(4),handles.edit24);
        load(SData.SampleDim.b(5),handles.edit25);
        load(SData.SampleDim.b(6),handles.edit26);
        load(SData.SampleDim.b(7),handles.edit27);
        load(SData.SampleDim.b(8),handles.edit28);
        load(SData.SampleDim.b(9),handles.edit29);
        load(SData.SampleDim.b(10),handles.edit30);

        set(handles.text13,'String','a [mm]');
        set(handles.text14,'Visible','on');
    
        set(handles.edit21,'Visible','on');
        set(handles.edit22,'Visible','on');
        set(handles.edit23,'Visible','on');
        set(handles.edit24,'Visible','on');
        set(handles.edit25,'Visible','on');
        set(handles.edit26,'Visible','on');
        set(handles.edit27,'Visible','on');
        set(handles.edit28,'Visible','on');
        set(handles.edit29,'Visible','on');
        set(handles.edit30,'Visible','on');
    
        if (isequal(get(pHandles.radiobutton1,'Value'),1))
            rectangle = imread('img/ra.jpg');
        end
        if (isequal(get(pHandles.radiobutton2,'Value'),1))
            rectangle = imread('img/rb.jpg');
        end
        set(handles.axes1,'Units','pixels');
        axes(handles.axes1);
        imshow(rectangle);
    end
end

function load(data, edit)

if (isnan(data))
    set(edit,'String','');
else
    set(edit,'String',num2str(data));
end


function data=save(data, edit)

if (or(isequal(get(edit,'String'),''),isempty(get(edit,'String'))))
    data=NaN;
else
    if (all(ismember(get(edit,'String'), '0123456789+-.eEdD')))
        data=str2num(get(edit,'String'));
    else
        set(edit,'String',strrep(get(edit,'String'),',','.'));
        if (all(ismember(get(edit,'String'), '0123456789+-.eEdD')))
            data=str2num(get(edit,'String'));
        else
            load(data,edit);
        end
    end
end
    

function recalculate(hObject, eventdata, handles)
global SData
    SData.SampleDim.l(1)=save(SData.SampleDim.l(1),handles.edit1);
    SData.SampleDim.l(2)=save(SData.SampleDim.l(2),handles.edit2);
    SData.SampleDim.l(3)=save(SData.SampleDim.l(3),handles.edit3);
    SData.SampleDim.l(4)=save(SData.SampleDim.l(4),handles.edit4);
    SData.SampleDim.l(5)=save(SData.SampleDim.l(5),handles.edit5);
    SData.SampleDim.l(6)=save(SData.SampleDim.l(6),handles.edit6);
    SData.SampleDim.l(7)=save(SData.SampleDim.l(7),handles.edit7);
    SData.SampleDim.l(8)=save(SData.SampleDim.l(8),handles.edit8);
    SData.SampleDim.l(9)=save(SData.SampleDim.l(9),handles.edit9);
    SData.SampleDim.l(10)=save(SData.SampleDim.l(10),handles.edit10);
    
if (isequal(SData.shape,'c'))    
    SData.SampleDim.d(1)=save(SData.SampleDim.d(1),handles.edit11);
    SData.SampleDim.d(2)=save(SData.SampleDim.d(2),handles.edit12);
    SData.SampleDim.d(3)=save(SData.SampleDim.d(3),handles.edit13);
    SData.SampleDim.d(4)=save(SData.SampleDim.d(4),handles.edit14);
    SData.SampleDim.d(5)=save(SData.SampleDim.d(5),handles.edit15);
    SData.SampleDim.d(6)=save(SData.SampleDim.d(6),handles.edit16);
    SData.SampleDim.d(7)=save(SData.SampleDim.d(7),handles.edit17);
    SData.SampleDim.d(8)=save(SData.SampleDim.d(8),handles.edit18);
    SData.SampleDim.d(9)=save(SData.SampleDim.d(9),handles.edit19);
    SData.SampleDim.d(10)=save(SData.SampleDim.d(10),handles.edit20);
else
    SData.SampleDim.a(1)=save(SData.SampleDim.a(1),handles.edit11);
    SData.SampleDim.a(2)=save(SData.SampleDim.a(2),handles.edit12);
    SData.SampleDim.a(3)=save(SData.SampleDim.a(3),handles.edit13);
    SData.SampleDim.a(4)=save(SData.SampleDim.a(4),handles.edit14);
    SData.SampleDim.a(5)=save(SData.SampleDim.a(5),handles.edit15);
    SData.SampleDim.a(6)=save(SData.SampleDim.a(6),handles.edit16);
    SData.SampleDim.a(7)=save(SData.SampleDim.a(7),handles.edit17);
    SData.SampleDim.a(8)=save(SData.SampleDim.a(8),handles.edit18);
    SData.SampleDim.a(9)=save(SData.SampleDim.a(9),handles.edit19);
    SData.SampleDim.a(10)=save(SData.SampleDim.a(10),handles.edit20);
    
    
    SData.SampleDim.b(1)=save(SData.SampleDim.b(1),handles.edit21);
    SData.SampleDim.b(2)=save(SData.SampleDim.b(2),handles.edit22);
    SData.SampleDim.b(3)=save(SData.SampleDim.b(3),handles.edit23);
    SData.SampleDim.b(4)=save(SData.SampleDim.b(4),handles.edit24);
    SData.SampleDim.b(5)=save(SData.SampleDim.b(5),handles.edit25);
    SData.SampleDim.b(6)=save(SData.SampleDim.b(6),handles.edit26);
    SData.SampleDim.b(7)=save(SData.SampleDim.b(7),handles.edit27);
    SData.SampleDim.b(8)=save(SData.SampleDim.b(8),handles.edit28);
    SData.SampleDim.b(9)=save(SData.SampleDim.b(9),handles.edit29);
    SData.SampleDim.b(10)=save(SData.SampleDim.b(10),handles.edit30);
    
end
SData.SampleName=get(handles.edit32,'String');
SData.m=save(SData.m,handles.edit31);

SData=recalculateData(SData);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
recalculate(hObject, eventdata, handles)

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
recalculate(hObject, eventdata, handles);

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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
recalculate(hObject, eventdata, handles);

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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit17_Callback(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit17 as text
%        str2double(get(hObject,'String')) returns contents of edit17 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit28_Callback(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit28 as text
%        str2double(get(hObject,'String')) returns contents of edit28 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit29_Callback(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit29 as text
%        str2double(get(hObject,'String')) returns contents of edit29 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit30_Callback(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit30 as text
%        str2double(get(hObject,'String')) returns contents of edit30 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit30_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit31_Callback(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit31 as text
%        str2double(get(hObject,'String')) returns contents of edit31 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function edit32_Callback(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit32 as text
%        str2double(get(hObject,'String')) returns contents of edit32 as a double
recalculate(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function edit32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
global SData pHandles
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(get(get(handles.uibuttongroup1,'SelectedObject'),'String'),'Circle')
    set(handles.text13,'String','d [mm]');
    set(handles.text14,'Visible','off');
    
    set(handles.edit21,'Visible','off');
    set(handles.edit22,'Visible','off');
    set(handles.edit23,'Visible','off');
    set(handles.edit24,'Visible','off');
    set(handles.edit25,'Visible','off');
    set(handles.edit26,'Visible','off');
    set(handles.edit27,'Visible','off');
    set(handles.edit28,'Visible','off');
    set(handles.edit29,'Visible','off');
    set(handles.edit30,'Visible','off');
   
    circle = imread('img/c.jpg');
    set(handles.axes1,'Units','pixels');
    axes(handles.axes1);
    imshow(circle);
    SData.shape='c';
    set(pHandles.uibuttongroup1,'Visible','off');
    showTable(pHandles,[SData.SampleDim.fd' SData.SampleDim.dekd']);
else
    set(handles.text13,'String','a [mm]');
    set(handles.text14,'Visible','on');
    
    set(handles.edit21,'Visible','on');
    set(handles.edit22,'Visible','on');
    set(handles.edit23,'Visible','on');
    set(handles.edit24,'Visible','on');
    set(handles.edit25,'Visible','on');
    set(handles.edit26,'Visible','on');
    set(handles.edit27,'Visible','on');
    set(handles.edit28,'Visible','on');
    set(handles.edit29,'Visible','on');
    set(handles.edit30,'Visible','on');
    
    if (isequal(get(pHandles.radiobutton1,'Value'),1))
        rectangle = imread('img/ra.jpg');
    end
    if (isequal(get(pHandles.radiobutton2,'Value'),1))
        rectangle = imread('img/rb.jpg');
    end
    set(handles.axes1,'Units','pixels');
    axes(handles.axes1);
    imshow(rectangle);
    SData.shape='r';
    set(pHandles.uibuttongroup1,'Visible','on');
    if (isequal(get(pHandles.radiobutton1,'Value'),1))
        showTable(pHandles,[SData.SampleDim.fa' SData.SampleDim.deka']);
    end
    if (isequal(get(pHandles.radiobutton2,'Value'),1))
        showTable(pHandles,[SData.SampleDim.fb' SData.SampleDim.dekb']);
    end
end
loadAll(hObject, eventdata, handles, SData);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global SData
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SData=struct(...
    'SampleName','',...
    'u',0.25',...
    'fa',0,'fau',0,...
    'deka',0,'dekau',0,...
    'fb',0,'fbu',0,...
    'dekb',0,'dekbu',0,...
    'fd',0,'fdu',0,...
    'dekd',0,'dekdu',0,...
    'm',NaN,...
    'mu',0.01,...
    'comm','',...
    'l',0,'lu',0,...
    'd',0,'du',0,...
    'a',0,'au',0,...
    'b',0,'bu',0,...
    'density',0,'uDensity',0, ...
    'Ea',0,'Eau',0,...
    'Eb',0,'Ebu',0,...
    'Ed',0,'Edu',0,...
    'row',0,...
    'shape','r',...
    'SampleDim',struct(...
        'l',NaN(1,10,'single'),...
        'd',NaN(1,10,'single'),...
        'a',NaN(1,10,'single'),...
        'b',NaN(1,10,'single'),...
        'fa',NaN(1,10,'single'),...
        'deka',NaN(1,10,'single'),...
        'fb',NaN(1,10,'single'),...
        'dekb',NaN(1,10,'single'),...
        'fd',NaN(1,10,'single'),...
        'dekd',NaN(1,10,'single')...
        )...
    );
loadAll(hObject,eventdata, handles,SData);

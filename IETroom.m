function varargout = IETroom(varargin)
% IETROOM MATLAB code for IETroom.fig
%      IETROOM, by itself, creates a new IETROOM or raises the existing
%      singleton*.
%
%      H = IETROOM returns the handle to a new IETROOM or the handle to
%      the existing singleton*.
%
%      IETROOM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IETROOM.M with the given input arguments.
%
%      IETROOM('Property','Value',...) creates a new IETROOM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IETroom_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IETroom_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IETroom

% Last Modified by GUIDE v2.5 28-Nov-2019 08:38:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IETroom_OpeningFcn, ...
                   'gui_OutputFcn',  @IETroom_OutputFcn, ...
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


% --- Executes just before IETroom is made visible.
function IETroom_OpeningFcn(hObject, eventdata, handles, varargin)
global SData
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

    logo = imread('img/logoM.jpg');
    set(handles.axes3,'Units','pixels');
    axes(handles.axes3);
    imshow(logo);
    
    set(hObject, ...
    'WindowButtonDownFcn',   @mouseDownCallback, ...
    'WindowButtonUpFcn',     @mouseUpCallback,   ...
    'WindowButtonMotionFcn', @mouseMotionCallback);

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IETroom (see VARARGIN)

% Choose default command line output for IETroom
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes IETroom wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function mouseDownCallback(figHandle,varargin)
    % get the handles structure
    handles = guidata(figHandle);
    % get the position where the mouse button was pressed (not released)
    % within the GUI
    currentPoint = get(figHandle, 'CurrentPoint');
    x            = currentPoint(1,1);
    y            = currentPoint(1,2);
    % get the position of the axes within the GUI
    axesPos = get(handles.axes1,'Position');
    minx    = axesPos(1);
    miny    = axesPos(2);
    maxx    = minx + axesPos(3);
    maxy    = miny + axesPos(4);
    % is the mouse down event within the axes?
    if x>=minx && x<=maxx && y>=miny && y<=maxy 
        % do we have graphics objects?
        if isfield(handles,'plotHandles')
            % get the position of the mouse down event within the axes
            currentPoint = get(handles.axes1, 'CurrentPoint');
            x            = currentPoint(2,1);
            y            = currentPoint(2,2);
            % we are going to use the x and y data for each graphic object
            % and determine which one is closest to the mouse down event
            minDist      = Inf;
            minHndl      = 0;
           for k=1:length(handles.plotHandles)
               xData = get(handles.plotHandles(k),'XData');
               yData = get(handles.plotHandles(k),'YData');
               dist  = min((xData-x).^2+(yData-y).^2); 
               if dist<minDist
                   minHndl = handles.plotHandles(k);
                   minDist = dist;
               end
           end
           % if we have a graphics handle that is close to the mouse down
           % event/position, then save the data
           if minHndl~=0
               handles.mouseIsDown     = true;
               handles.movingPlotHndle = minHndl;
               handles.prevPoint       = [x y];
               guidata(figHandle,handles);
           end
        end
    end
    
    function mouseUpCallback(figHandle,varargin)
    % get the handles structure
    handles = guidata(figHandle);
    if isfield(handles,'mouseIsDown')
        if handles.mouseIsDown
            % reset all moving graphic fields
            handles.mouseIsDown     = false;
            handles.movingPlotHndle = [];
            handles.prevPoint       = [];
            % save the data
            guidata(figHandle,handles);
        end
    end
    
    
 function mouseMotionCallback(figHandle,varargin)
    % get the handles structure
    handles = guidata(figHandle);
    if isfield(handles,'mouseIsDown')
        if handles.mouseIsDown
            currentPoint = get(handles.axes1, 'CurrentPoint');
            x            = currentPoint(2,1);
            y            = currentPoint(2,2);
            % compute the displacement from previous position to current
            xDiff = x - handles.prevPoint(1);
            yDiff = y - handles.prevPoint(2);
            % adjust this for the data corresponding to movingPlotHndle
            xData = get(handles.movingPlotHndle,'XData');
            yData = get(handles.movingPlotHndle,'YData');
            set(handles.movingPlotHndle,'YData',yData+yDiff,'XData',xData+xDiff);
            handles.prevPoint = [x y];
            % save the data
            guidata(figHandle,handles);
        end
    end
    
    


% --- Outputs from this function are returned to the command line.
function varargout = IETroom_OutputFcn(hObject, eventdata, handles) 
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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global fr ld y
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs=str2num(get(handles.edit1,'String'));
recTime=str2num(get(handles.edit2,'String'));
treshold=str2num(get(handles.edit3,'String'));
rec = audiorecorder(Fs,16,1,1);
y=0;
while(max(y)<treshold)
    figure(handles.figure1);
    set(handles.pushbutton1,'BackgroundColor',[.94 .2 .2]);
    set(handles.pushbutton1,'ForegroundColor',[1 1 1]);
    set(handles.pushbutton1,'String','Stop');
    recordblocking(rec, recTime);
    y = getaudiodata(rec);
    stop_state = get(handles.pushbutton1,'Value');
    if ~stop_state
        break;
    end
end
set(handles.pushbutton1,'Value',0);
set(handles.pushbutton1,'BackgroundColor',[.94 .94 .94]);
set(handles.pushbutton1,'ForegroundColor',[0 0 0]);
set(handles.pushbutton1,'String','Start');

if max(y)>treshold
    hold off;
    x = linspace(0,recTime,size(y,1));
    axes(handles.axes1);
    plot(x,y);
    xlabel('Time (s)')
    ylabel('Amplitude (V)')
    
    x1lim=str2num(get(handles.edit4,'String'));
    x2lim=str2num(get(handles.edit5,'String'));
    [f fftR fr afr ld]=recalculateFFT(y,Fs,x1lim,x2lim);
    axes(handles.axes2);
    plot(f,fftR./afr);
    xlabel('Frequency (Hz)')
    ylabel('Amplitude')
    xlim([x1lim x2lim])
    ylim([0 1.1])
    hold all;
%     [pks,locs,widths,proms] = findpeaks(fftR,f,'SortStr','descend','NPeaks',1);
    scatter(fr,1,'v');
    if (fr>0)
        set(handles.pushbutton3,'BackgroundColor',[.2 .94 .2]);
        set(handles.pushbutton3,'ForegroundColor',[0 0 0]);
    else
        set(handles.pushbutton3,'BackgroundColor',[.94 .94 .94]);
        set(handles.pushbutton3,'ForegroundColor',[0 0 0]);
    end
end



function edit4_Callback(hObject, eventdata, handles)
global y
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
axes(handles.axes2);
x1lim=str2num(get(handles.edit4,'String'));
x2lim=str2num(get(handles.edit5,'String'));
xlim([x1lim x2lim])
Fs=str2num(get(handles.edit1,'String'));
[f fftR fr afr ld]=recalculateFFT(y,Fs,x1lim,x2lim);
axes(handles.axes2);
hold off;
plot(f,fftR./afr);
xlabel('Frequency (Hz)')
ylabel('Amplitude')
xlim([x1lim x2lim])
ylim([0 1.1])
hold all;
scatter(fr,1,'v');

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
axes(handles.axes2);
x1lim=str2num(get(handles.edit4,'String'));
x2lim=str2num(get(handles.edit5,'String'));
xlim([x1lim x2lim])

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

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global SData
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SData=dimensions(SData,handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global SData fr ld
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (fr>0)
    if(isequal(SData.shape,'r'))
        if (isequal(get(handles.radiobutton1,'Value'),1))
            SData.SampleDim.fa(find(isnan(SData.SampleDim.fa), 1))=round(fr,0);
            SData.SampleDim.deka(find(isnan(SData.SampleDim.deka), 1))=round(ld,3,'significant');
            showTable(handles,[SData.SampleDim.fa' SData.SampleDim.deka']);
        end
        if (isequal(get(handles.radiobutton2,'Value'),1))
            SData.SampleDim.fb(find(isnan(SData.SampleDim.fb), 1))=round(fr,0);
            SData.SampleDim.dekb(find(isnan(SData.SampleDim.dekb), 1))=round(ld,3,'significant');
            showTable(handles,[SData.SampleDim.fb' SData.SampleDim.dekb']);
        end
        
    else
        SData.SampleDim.fd(find(isnan(SData.SampleDim.fd), 1))=round(fr,0);
        SData.SampleDim.dekd(find(isnan(SData.SampleDim.dekd), 1))=round(ld,3,'significant');
        showTable(handles,[SData.SampleDim.fd' SData.SampleDim.dekd']);
    end
    fr=0;
    set(handles.pushbutton3,'BackgroundColor',[.94 .94 .94]);
    set(handles.pushbutton3,'ForegroundColor',[0 0 0]);
end
% if (fr>0)
%     set(handles.pushbutton3,'BackgroundColor',[.2 .94 .2]);
%     set(handles.pushbutton3,'ForegroundColor',[0 0 0]);
% else
%     set(handles.pushbutton3,'BackgroundColor',[.94 .94 .94]);
%     set(handles.pushbutton3,'ForegroundColor',[0 0 0]);
% end

SData=recalculateData(SData);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global SData
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
formatOut = 'yyyy-mm-dd';
cdate=datestr(now,formatOut);
fformatOut = 'dd.mm.yyyy';
fdate=datestr(now,fformatOut);
dir='results/';
dirDetail='results/detail/';
name=[dir cdate '_' SData.SampleName '.dat'];
fi = fopen(name,'wt');
nameD=[dirDetail cdate '_' SData.SampleName '.dat'];
fid = fopen(name,'wt');

fprintf(fi, '# Sample name: %s\n',SData.SampleName);
fprintf(fi, '# Date: %s\n',fdate);
fprintf(fi, '# Poisson ratio: %.2f\n',SData.u);
if isequal(SData.shape,'r')
    fprintf(fi, '# Cross section: rectangle\n');
    fprintf(fi, 'm = (%.3f ± %.3f) g\n',SData.m,SData.mu);
    fprintf(fi, 'l = (%.3f ± %.3f) mm\n',SData.l,SData.lu);
    fprintf(fi, 'a = (%.3f ± %.3f) mm\n',SData.a,SData.au);
    fprintf(fi, 'b = (%.3f ± %.3f) mm\n',SData.b,SData.bu);
    fprintf(fi, 'Bulk density = (%.3f ± %.3f) g/cm^3\n',SData.density,SData.uDensity);
    fprintf(fi, 'E_a = (%.2f ± %.2f) GPa\n',SData.Ea,SData.Eau);
    fprintf(fi, 'E_b = (%.2f ± %.2f) GPa\n',SData.Eb,SData.Ebu);
    fprintf(fi, 'Log. dek_a = %.4f ± %.4f\n',SData.deka,SData.dekau);
    fprintf(fi, 'Log. dek_b = %.4f ± %.4f',SData.dekb,SData.dekbu);
else
    fprintf(fi, '# Cross section: circle\n');
    fprintf(fi, 'm = (%.3f ± %.3f) g\n',SData.m,SData.mu);
    fprintf(fi, 'l = (%.3f ± %.3f) mm\n',SData.l,SData.lu);
    fprintf(fi, 'd = (%.3f ± %.3f) mm\n',SData.d,SData.du);
    fprintf(fi, 'Bulk density = (%.3f ± %.3f) g/cm^3\n',SData.density,SData.uDensity);
    fprintf(fi, 'E = (%.2f ± %.2f) GPa\n',SData.Ed,SData.Edu);
    fprintf(fi, 'Log dek. = %.4f ± %.4f',SData.dekd,SData.dekdu);
end
fclose(fi);

% fprintf(fid, '# Sample name: %s\n',SData.SampleName);
% fprintf(fid, '# Date: %s\n',fdate);
% fprintf(fid, '# Poisson ratio: %.2f\n',SData.u);
% if isequal(SData.shape,'r')
%     fprintf(fid, '# Cross section: rectangle\n');
%     fprintf(fid, 'm = (%.3f ± %.3f) g\n\n',SData.m,SData.mu);
%     fprintf(fid, '',SData.l,SData.lu);
%     for r=1:10
%         fprintf(fid, 'l = (%.3f ± %.3f) mm\n',SData.l,SData.lu);
%     end
%     fprintf(fid, 'l = (%.3f ± %.3f) mm\n',SData.l,SData.lu);
%     fprintf(fid, 'a = (%.3f ± %.3f) mm\n',SData.a,SData.au);
%     fprintf(fid, 'b = (%.3f ± %.3f) mm\n',SData.b,SData.bu);
%     fprintf(fid, 'Bulk density = (%.3f ± %.3f) g/cm^3\n',SData.density,SData.uDensity);
%     fprintf(fid, 'E_a = (%.2f ± %.2f) GPa\n',SData.Ea,SData.Eau);
%     fprintf(fid, 'E_b = (%.2f ± %.2f) GPa\n',SData.Eb,SData.Ebu);
%     fprintf(fid, 'Log. dek_a = %.4f ± %.4f\n',SData.deka,SData.dekau);
%     fprintf(fid, 'Log. dek_b = %.4f ± %.4f',SData.dekb,SData.dekbu);
% else
%     fprintf(fid, '# Cross section: circle\n');
%     fprintf(fid, 'm = (%.3f ± %.3f) g\n',SData.m,SData.mu);
%     fprintf(fid, 'l = (%.3f ± %.3f) mm\n',SData.l,SData.lu);
%     fprintf(fid, 'd = (%.3f ± %.3f) mm\n',SData.d,SData.du);
%     fprintf(fid, 'Bulk density = (%.3f ± %.3f) g/cm^3\n',SData.density,SData.uDensity);
%     fprintf(fid, 'E = (%.2f ± %.2f) GPa\n',SData.Ed,SData.Edu);
%     fprintf(fid, 'Log dek. = %.4f ± %.4f',SData.dekd,SData.dekdu);
% end
% fclose(fid);

% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
global SData
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (isequal(get(handles.radiobutton1,'Value'),1))
    showTable(handles,[SData.SampleDim.fa' SData.SampleDim.deka']);
end
if (isequal(get(handles.radiobutton2,'Value'),1))
    showTable(handles,[SData.SampleDim.fb' SData.SampleDim.dekb']);
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global SData
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    if(isequal(SData.shape,'r'))
        if (isequal(get(handles.radiobutton1,'Value'),1))
            if find(isnan(SData.SampleDim.fa), 1)>1
                SData.SampleDim.fa((find(isnan(SData.SampleDim.fa), 1))-1)=NaN;
                SData.SampleDim.deka((find(isnan(SData.SampleDim.deka), 1))-1)=NaN;
                showTable(handles,[SData.SampleDim.fa' SData.SampleDim.deka']);
            end
        end
        if (isequal(get(handles.radiobutton2,'Value'),1))
            if find(isnan(SData.SampleDim.fb), 1)>1
                SData.SampleDim.fb((find(isnan(SData.SampleDim.fb), 1))-1)=NaN;
                SData.SampleDim.dekb((find(isnan(SData.SampleDim.dekb), 1))-1)=NaN;
                showTable(handles,[SData.SampleDim.fb' SData.SampleDim.dekb']);
            end
        end
        
    else
        if find(isnan(SData.SampleDim.fd), 1)>1
            SData.SampleDim.fd((find(isnan(SData.SampleDim.fd), 1))-1)=NaN;
            SData.SampleDim.dekd((find(isnan(SData.SampleDim.dekd), 1))-1)=NaN;
            showTable(handles,[SData.SampleDim.fd' SData.SampleDim.dekd']);
        end
    end

function varargout = StatisticalTool(varargin)
% STATISTICALTOOL MATLAB code for StatisticalTool.fig
%      STATISTICALTOOL, by itself, creates a new STATISTICALTOOL or raises the existing
%      singleton*.
%
%      H = STATISTICALTOOL returns the handle to a new STATISTICALTOOL or the handle to
%      the existing singleton*.
%
%      STATISTICALTOOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STATISTICALTOOL.M with the given input arguments.
%
%      STATISTICALTOOL('Property','Value',...) creates a new STATISTICALTOOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StatisticalTool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StatisticalTool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StatisticalTool

% Last Modified by GUIDE v2.5 18-Apr-2014 12:28:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @StatisticalTool_OpeningFcn, ...
                   'gui_OutputFcn',  @StatisticalTool_OutputFcn, ...
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


% --- Executes just before StatisticalTool is made visible.
function StatisticalTool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StatisticalTool (see VARARGIN)

% Choose default command line output for StatisticalTool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes StatisticalTool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = StatisticalTool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


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


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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
moveItem(handles.listbox1,handles.listbox2);
getTotalNumber(handles);

function moveItem(hListOut,hListIn)
listOut = get(hListOut,'String');
if isempty(listOut)
    return
end
if ~iscell(listOut)
    listOut = {listOut};
end
listIn = get(hListIn,'String');
index = get(hListOut,'Value');
item = listOut{index};

listOut(index) = [];
if ~iscell(listIn)&&~isempty(listIn)
    listIn = {listIn};
end
set(hListIn,'String',[listIn;item]);
set(hListOut,'String',listOut);
if (index>1)
    index = index-1;
end
set(hListOut,'Value',index);

function getTotalNumber(handles)
list = get(handles.listbox2,'String');
if(isempty(list))
    set(handles.edit7,'String','0');
end
if ~iscell(list)
    list = {list};
end
count = 0;
for i = 1:length(list)
    str = list{i};
    index = find(str=='-');
    count = count + str2double(str(index(end)+1:end));
end
set(handles.edit7,'String',num2str(count));
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moveItem(handles.listbox2,handles.listbox1);
getTotalNumber(handles)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
list1 = get(handles.listbox1,'String');
list2 = get(handles.listbox2,'String');
if (~iscell(list1)&&~isempty(list1))
    list1 = {list1};
end
list = [list1; list2];
set(handles.listbox2,'String',list);
set(handles.listbox1,'String',[]);
getTotalNumber(handles)
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
path = uigetdir;
if(path==0)
    return
end
if(~exist([path '\info.mat'],'file'))
    return
end
load([path '\info.mat']);
set(handles.edit1,'String',path);
list = dataNames; %#ok<USENS>
listCount = length(dataNames);
for i = 1:listCount
    if(~exist([path '\data\' dataNames{i} 'correctedEvents.mat'],'file'))
        list{i} = [dataNames{i} '-0'];
        continue
    end
    load([path '\data\' dataNames{i} 'correctedEvents.mat']);
    list{i} = [dataNames{i} '-' num2str(length(correctedEvents))];
end
set(handles.listbox1,'String',list);
set(handles.listbox2,'String',[]);
% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles) %#ok<*INUSL>
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
if (get(hObject,'Value') == 0)
    set(handles.edit5,'Enable','on');
    set(handles.edit6,'Enable','on');
else
    set(handles.edit5,'Enable','off')
    set(handles.edit6,'Enable','off')
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%events(:,1) are current data;
%events(:,2) are time data;

events = getEvents(handles);
if(isempty(events))
    return
end
bw = str2double(get(handles.edit2,'String'));
h=figure;
hold on
if(get(handles.checkbox1,'Value') ~= 1)
    x1 = str2double(get(handles.edit5,'String'));
    x2 = str2double(get(handles.edit6,'String'));
    x = x1:bw:x2;
end
if (get(handles.popupmenu1,'Value') == 1)
        data1 = events(:,2);
        if(get(handles.checkbox1,'Value') == 1)
            x1 = min(data1);
            x2 = max(data1);
            x = x1:bw:x2;
        end
          [c1,x1] = hist(data1,x);
        bar(x1,c1,'EdgeColor','none','BarWidth',1,'FaceColor','b');
    xlabel('t/ms','FontSize',16)
else
        data1 = events(:,1);
        if(get(handles.checkbox1,'Value') == 1)
            x1 = min(data1);
            x2 = max(data1);
            x = x1:bw:x2;
        end
        [c1,x1] = hist(data1,x);
        bar(x1,c1,'EdgeColor','none','BarWidth',1,'FaceColor','b');
    xlabel('I/pA','FontSize',16);
end

ylabel('count','FontSize',16);
ch = get(h,'CurrentAxes');
set(ch,'FontSize',12);
if(get(handles.checkbox1,'Value') ~= 1)
    x1 = str2double(get(handles.edit5,'String'));
    x2 = str2double(get(handles.edit6,'String'));
    xlim([x1 x2]);
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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
if (get(hObject,'Value') == 1)
    set(handles.text5,'String','ms')
else
    set(handles.text5,'String','pA')
end
% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
events = getEvents(handles);
figure;
hold on
    if(get(handles.checkbox2,'Value')==0)
        scatter(events(:,1),events(:,2),'.');
        xlabel('I/pA')
        ylabel('t/ms')
    else
        scatter(events(:,2),events(:,1),'.');
        ylabel('I/pA')
        xlabel('t/ms')
    end
hold off

function events = getEvents(handles)
path = get(handles.edit1,'String');
dataList = get(handles.listbox2,'String');

if (isempty(dataList))
    return
end
if ~iscell(dataList)
    dataList = {dataList};
end
dataCount = length(dataList);
eventCount = str2double(get(handles.edit7,'String'));
events = zeros(eventCount,4);
eventIndex = 0;

err = [];
err2=[];
for i = 1:dataCount
    str = dataList{i};
    index = find(str=='-');
    eventNumber = str2double(str(index(end)+1:end));
    if(eventNumber == 0)
        continue;
    end
    try
        load([path '\data\' str(1:index(end)-1) 'correctedEvents.mat']);
    catch
        continue
    end

    for j = 1:length(correctedEvents)
        eventIndex = eventIndex+1;
        if isempty(correctedEvents(j).dc)
           continue 
        end
        events(eventIndex,1) = correctedEvents(j).dccc;
        events(eventIndex,2) = correctedEvents(j).t;
    end
end
% assignin('base','dccc',err);
% assignin('base','dc',err2);



% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


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


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uiputfile({'*.xls','excel (*.xls)';});
    if(filename==0)
        return 
    end
    
    if(exist([pathname filename],'file'))
        d = questdlg('The file is already exist, would you like to replace it?','Warning','Yes','No','No');
        if(strcmp(d,'No'))
           return 
        end
        delete([pathname filename]);        
    end

events = getEvents(handles);
xlswrite([pathname filename],events);
    
    
    
    
    


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

events = getEvents(handles);
assignin('base','events',events);

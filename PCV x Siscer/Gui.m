function varargout = Gui(varargin)
% GUI MATLAB code for Gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gui

% Last Modified by GUIDE v2.5 17-Dec-2021 22:12:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gui_OpeningFcn, ...
                   'gui_OutputFcn',  @Gui_OutputFcn, ...
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


% --- Executes just before Gui is made visible.
function Gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gui (see VARARGIN)

% Choose default command line output for Gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
movegui(hObject, 'center');
% UIWAIT makes Gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% memanggil menu "pencarian file"
[nama_file, nama_folder] = uigetfile('*.jpg');

% jika ada nama file yg dipilih maka akan mengeksekusi perintah di bawah
% ini
if ~isequal(nama_file,0)
    % membaca file rgb
    Img = imread(fullfile(nama_folder, nama_file));
    % menampilkan citra rgb pada axes
    axes(handles.axes1)
    imshow(Img)
    title('Citra RGB')
    % menampilkan nama file pada edit text
    set(handles.edit1,'String', nama_file)
    
    % menyimpan variable img pada lokasi handles agar dapat dipanggil oleh
    % puhsbutton yang lain
    handles.Img = Img;
    guidata(hObject, handles)   
    else
%     jika tidak ada nama file yg dipilih maka akan kembali
    return
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% mereset tampilan GUI
set(handles.edit1, 'String', [])
set(handles.edit2, 'String', [])

axes(handles.axes1)
cla reset
set(gca, 'XTick', [])
set(gca, 'YTick', [])

axes(handles.axes2)
cla reset
set(gca, 'XTick', [])
set(gca, 'YTick', [])

axes(handles.axes3)
cla reset
set(gca, 'XTick', [])
set(gca, 'YTick', [])

axes(handles.axes4)
cla reset
set(gca, 'XTick', [])
set(gca, 'YTick', [])

set(handles.uitable1, 'Data',[])

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% memanggil variable Img yang ada di lokasi handles
Img = handles.Img;

    % rgb to grayscale
    Img_gray = rgb2gray(Img);
    % menampilkan citra biner pada axes
    axes(handles.axes2)
    imshow(Img_gray)
    title('Citra Grayscale')
    
    % grayscale to biner
    bw = imbinarize(Img_gray);

    % operasi komplemen
    bw = imcomplement(bw);

    % menampilkan citra biner pada axes
    axes(handles.axes3)
    imshow(bw)
    title('Citra komplemen')
    
    % morfologi filling holes
    bw = imfill(bw,'holes');
    % menampilkan citra biner pada axes
    axes(handles.axes4)
    imshow(bw)
    title('Citra Morfologi')
    
    handles.bw = bw;
    guidata(hObject, handles) 
 

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


% --- Executes on button press in pushbutton5.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Img = handles.Img;
bw = handles.bw;

% ekstraksi ciri
    
    %RGB to HSV
    HSV = rgb2hsv(Img);
%     figure, imshow(HSV)

    % ekstrak H S V
    H = HSV(:,:,1);
    S = HSV(:,:,2);
    V = HSV(:,:,3);
       
    %mengubah background menjadi 0
    H(~bw) = 0;
    S(~bw) = 0;
    V(~bw) = 0;
    
%     figure, imshow(H)
%     figure, imshow(S)
%     figure, imshow(V)
    
    %menghitung rata2 h,s,v
    Hue = sum(sum(H))/sum(sum(bw));
    Saturation = sum(sum(S))/sum(sum(bw));
    Value = sum(sum(V))/sum(sum(bw));
    
    %mengisi variable
    ciri_uji(1,1) = Hue;
    ciri_uji(1,2) = Saturation;
    ciri_uji(1,3) = Value;
    
    % menamilkan ciri hasil ekstraksi pada tabel
    ciri_tabel = cell(3,2);
    ciri_tabel{1,1} = 'Hue';
    ciri_tabel{2,1} = 'Saturation';
    ciri_tabel{3,1} = 'Value';
    ciri_tabel{1,2} = num2str(Hue);
    ciri_tabel{2,2} = num2str(Saturation);
    ciri_tabel{3,2} = num2str(Value);
    set(handles.uitable1, 'Data', ciri_tabel)
    
    % menyimpan variable ciri_uji pada lokasi handles agar dapat dipanggil oleh
    % puhsbutton yang lain
    handles.ciri_uji = ciri_uji;
    guidata(hObject, handles) 
    

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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ciri_uji = handles.ciri_uji;

% klasifikasi citra menggunakan algoritma naive bayes
load Mdl;

% membaca kelas keluaran hasil pelatihan
hasil_uji = predict(Mdl,ciri_uji);
    
% menampilkan kelas keluaran hasil pelatihan
set(handles.edit2, 'String', hasil_uji{1})
    
    
    

function varargout = Tugas3(varargin)
% TUGAS3 MATLAB code for Tugas3.fig
%      TUGAS3, by itself, creates a new TUGAS3 or raises the existing
%      singleton*.
%
%      H = TUGAS3 returns the handle to a new TUGAS3 or the handle to
%      the existing singleton*.
%
%      TUGAS3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGAS3.M with the given input arguments.
%
%      TUGAS3('Property','Value',...) creates a new TUGAS3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Tugas3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Tugas3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Tugas3

% Last Modified by GUIDE v2.5 20-Feb-2018 20:20:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Tugas3_OpeningFcn, ...
                   'gui_OutputFcn',  @Tugas3_OutputFcn, ...
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


% --- Executes just before Tugas3 is made visible.
function Tugas3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Tugas3 (see VARARGIN)

% Choose default command line output for Tugas3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Tugas3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Tugas3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnbrowse.
function btnbrowse_Callback(hObject, eventdata, handles)
% hObject    handle to btnbrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[namafile, formatfile] = uigetfile({'*.jpg','*.png'}, 'Pilih Gambar'); %memilih gambar
global image
image = imread([formatfile, namafile]); %membaca gambar
guidata(hObject, handles);
axes(handles.axes1); %memilih plotori sebagai letak gambar yang dimunculkan
imshow(image); %memunculkan gambar


% --- Executes on button press in btntambah.
function btntambah_Callback(hObject, eventdata, handles)
% hObject    handle to btntambah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
nilai = uint8(image);
baris = size(nilai,1);
kolom = size(nilai,2);
for i = 1 : baris
    for j = 1 : kolom
        temp = nilai(i,j) + 20;
        nilai(i,j) = temp;
    end
end
image = nilai;
axes(handles.axes1); %memilih plotori sebagai letak gambar yang dimunculkan
imshow(image); %memunculkan gambar


% --- Executes on button press in btnkali.
function btnkali_Callback(hObject, eventdata, handles)
% hObject    handle to btnkali (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
nilai = uint8(image);
baris = size(nilai,1);
kolom = size(nilai,2);
for i = 1 : baris
    for j = 1 : kolom
        temp = nilai(i,j) * 2;
        nilai(i,j) = temp;
    end
end
image = nilai;
axes(handles.axes1); %memilih plotori sebagai letak gambar yang dimunculkan
imshow(image); %memunculkan gambar


% --- Executes on button press in btnkurang.
function btnkurang_Callback(hObject, eventdata, handles)
% hObject    handle to btnkurang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
nilai = uint8(image);
baris = size(nilai,1);
kolom = size(nilai,2);
for i = 1 : baris
    for j = 1 : kolom
        temp = nilai(i,j) - 10;
        nilai(i,j) = temp;
    end
end
image = nilai;
axes(handles.axes1); %memilih plotori sebagai letak gambar yang dimunculkan
imshow(image); %memunculkan gambar


% --- Executes on button press in btnbagi.
function btnbagi_Callback(hObject, eventdata, handles)
% hObject    handle to btnbagi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
nilai = uint8(image);
baris = size(nilai,1);
kolom = size(nilai,2);
for i = 1 : baris
    for j = 1 : kolom
        temp = nilai(i,j) / 2;
        nilai(i,j) = temp;
    end
end
image = nilai;
axes(handles.axes1); %memilih plotori sebagai letak gambar yang dimunculkan
imshow(image); %memunculkan gambar


% --- Executes on button press in btnhorizontal.
function btnhorizontal_Callback(hObject, eventdata, handles)
% hObject    handle to btnhorizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
ind = 1; %inisialisasi index
for i = size(image,2) : -1 : 1
    new(:, ind, :) = image(:, i, :);
    ind = ind + 1;
end
image = new; %flipdim(image, 2);
axes(handles.axes1); %memilih plotori sebagai letak gambar yang dimunculkan
imshow(image); %memunculkan gambar

% --- Executes on button press in btnvertikal.
function btnvertikal_Callback(hObject, eventdata, handles)
% hObject    handle to btnvertikal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
ind = 1; %inisialisasi index
for i = size(image,1) : -1 : 1
    new(ind, :, :) = image(i, :, :);
    ind = ind + 1;
end
image = new; %flipdim(image, 1);
axes(handles.axes1); %memilih plotori sebagai letak gambar yang dimunculkan
imshow(image); %memunculkan gambar

% --- Executes on button press in crop.
function crop_Callback(hObject, eventdata, handles)
% hObject    handle to crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
x_TopLeft = 64;
y_TopLeft = 64;
x_BottomRight = 192; 
y_BottomRight = 192;

M = x_BottomRight-x_TopLeft+1;
N = y_BottomRight-y_TopLeft+1; 

for i = 1 : M
    for j = 1 : N
        B(i, j, :) = image(x_TopLeft+i, y_TopLeft+j, :);
    end
end
image = B;
axes(handles.axes1); %memilih plotori sebagai letak gambar yang dimunculkan
imshow(image); %memunculkan gambar
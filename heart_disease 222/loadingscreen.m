function varargout = loadingscreen(varargin)
% LOADINGSCREEN M-file for loadingscreen.fig
%      LOADINGSCREEN, by itself, creates a new LOADINGSCREEN or raises the existing
%      singleton*.
%
%      H = LOADINGSCREEN returns the handle to a new LOADINGSCREEN or the handle to
%      the existing singleton*.
%
%      LOADINGSCREEN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOADINGSCREEN.M with the given input arguments.
%
%      LOADINGSCREEN('Property','Value',...) creates a new LOADINGSCREEN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before loadingscreen_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to loadingscreen_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help loadingscreen

% Last Modified by GUIDE v2.5 27-Feb-2015 15:18:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @loadingscreen_OpeningFcn, ...
                   'gui_OutputFcn',  @loadingscreen_OutputFcn, ...
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


% --- Executes just before loadingscreen is made visible.
function loadingscreen_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to loadingscreen (see VARARGIN)

% Choose default command line output for loadingscreen
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes loadingscreen wait for user response (see UIRESUME)
% uiwait(handles.figure1);

axes(handles.axes4)
matlabImage = imread('logo.jpg');
image(matlabImage)
axis off
axis image

% --- Outputs from this function are returned to the command line.
function varargout = loadingscreen_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

create_network
% --- Executes during object creation, after setting all properties.
function uipanel3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


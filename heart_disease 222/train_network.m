function varargout = train_network(varargin)
% TRAIN_NETWORK M-file for train_network.fig
%      TRAIN_NETWORK, by itself, creates a new TRAIN_NETWORK or raises the existing
%      singleton*.
%
%      H = TRAIN_NETWORK returns the handle to a new TRAIN_NETWORK or the handle to
%      the existing singleton*.
%
%      TRAIN_NETWORK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAIN_NETWORK.M with the given input arguments.
%
%      TRAIN_NETWORK('Property','Value',...) creates a new TRAIN_NETWORK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before train_network_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to train_network_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help train_network

% Last Modified by GUIDE v2.5 27-Feb-2015 20:38:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @train_network_OpeningFcn, ...
    'gui_OutputFcn',  @train_network_OutputFcn, ...
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


% --- Executes just before train_network is made visible.
function train_network_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to train_network (see VARARGIN)

% Choose default command line output for train_network
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes train_network wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = train_network_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

maingui
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
maingui;



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
M = csvread('heart-statlog.csv');

% for ii=1:50
% Stockdata(ii).id=ii;
% % Stockdata(ii).date=M(ii,1);
% Stockdata(ii).stock_price_open=M(ii,2);
% Stockdata(ii).stock_price_high=M(ii,3);
% Stockdata(ii).stock_price_low=M(ii,4);
% Stockdata(ii).stock_price_close=M(ii,5);
% % Stockdata(ii).stock_volume=M(ii,6);
% % Stockdata(ii).stock_price_adj_close=M(ii,7);
% end

M=normalize_data(M);
save M;
for ii=1:length(M)
    data_to_train(ii,1)=M(ii,1);
    data_to_train(ii,2)=M(ii,2);
    data_to_train(ii,3)=M(ii,3);
    data_to_train(ii,4)=M(ii,4);
    data_to_train(ii,5)=M(ii,5);
    data_to_train(ii,6)=M(ii,6);
    data_to_train(ii,7)=M(ii,7);
    data_to_train(ii,8)=M(ii,8);
    data_to_train(ii,9)=M(ii,9);
    data_to_train(ii,10)=M(ii,10);
    data_to_train(ii,11)=M(ii,11);
    data_to_train(ii,12)=M(ii,12);
    data_to_train(ii,13)=M(ii,13);
    
end


b=data_to_train(1:length(M),1:12);
Input=b';
Output=data_to_train(1:length(M),13)';


for ii=1:1:12
    val= findminmax(Input(ii,1:length(M)));
    RS(ii,1)=val(1,1);
    RS(ii,2)=val(1,2);
end

ep = load('myfile.mat');


epchs = ep.epochs;
trn_fn = ep.transfer_fn;

if ep.layer == 3
    S=[12 10 1];
[trainV, valV, testV] = dividevec(Input, Output, 0.10, 0.10);

    net=newff(RS,S,{trn_fn,trn_fn, trn_fn});
else
    S=[12 1];
[trainV, valV, testV] = dividevec(Input, Output, 0.10);

    net=newff(RS,S,{trn_fn,trn_fn});
end

net.trainParam.epochs = epchs;
[net,tr,Y,E,Pf,Af]=train(net,Input,Output);
save net1 net
mean_error=tr.perf;
No_of_epoch=tr.epoch;

h=findobj('Type','axes','Tag','axes6');
axes(h)
% axes(handles)
for ii=2:5:length(No_of_epoch)
    epoch(ii)=No_of_epoch(ii);
    MSE(ii)=mean_error(ii);
end
plot(epoch,MSE,'-r*')


% test_data
guidata(hObject, handles);
% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3





function varargout = frmBiseccion(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @frmBiseccion_OpeningFcn, ...
    'gui_OutputFcn',  @frmBiseccion_OutputFcn, ...
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


function frmBiseccion_OpeningFcn(hObject, eventdata, handles, varargin)

movegui(gcf,'center')

handles.output = hObject;

guidata(hObject, handles);


function varargout = frmBiseccion_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)


function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)


function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)


function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)
f = get(handles.edit1,'string');
f = inline(f);
xai = str2double(get(handles.edit2,'string'));
xbi = str2double(get(handles.edit3,'string'));
tol = str2double(get(handles.edit4,'string'));
i = 1;
ea(1) = 100;

if f(xai) * f(xbi) < 0;
    xa(1) = xai;
    xb(1) = xbi;
    xr(1) = (xa(1) + xb(1))/2;
    
    set(handles.tabla,'Data',{})
    
    hold off
    cla
    set(handles.tabla,'Data',{})
    set(handles.respuesta,'string','No hay raiz');
    while abs(ea(i)) >= tol
        if f(xa(i)) * f(xr(i)) < 0
            xa(i+1) = xa(i);
            xb(i+1) = xr(i);
        end
        if f(xa(i)) * f(xr(i)) > 0
            xa(i+1) = xr(i);
            xb(i+1) = xb(i);
        end
        xr(i+1) = (xa(i+1)+xb(i+1))/2;
        ea(i+1) = abs((xr(i+1)-xr(i))/(xr(i+1))*100);
        
        % =================== Mostrara datos en tabla =====================
        newRow = {i xa(i+1) xb(i+1) xr(i+1) ea(i+1)};
        oldData = get(handles.tabla,'Data');
        newData = [oldData; newRow];
        set(handles.tabla,'Data',newData)
        
        grid on;
        plot(i,f(i),'Ok');
        hold on;
        
        i=i+1;
    end
    respuesta=sprintf('%0.6f',xr(i));
    set(handles.respuesta,'string',respuesta);
    
    %Grafica de la funcion
    fplot(handles.axes1,f,[xai xbi]);
    grid
    ezplot(f);
    grid on;
    plot(xbi,f(xbi),'*');
    zoom on
else
    set(handles.respuesta,'string','No existe la raiz en el intervalo');
    zoom on
end


function respuesta_Callback(hObject, eventdata, handles)


function respuesta_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
cla %limpiar tabla
set(handles.tabla,'Data',{})
%limpiar textboxs
set(handles.edit1,'string','');
set(handles.edit2,'string','');
set(handles.edit3,'string','');
set(handles.edit4,'string','');
set(handles.respuesta,'string','');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

close
frmFalsaPosicion

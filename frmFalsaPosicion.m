function varargout = frmFalsaPosicion(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @frmFalsaPosicion_OpeningFcn, ...
    'gui_OutputFcn',  @frmFalsaPosicion_OutputFcn, ...
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


function frmFalsaPosicion_OpeningFcn(hObject, eventdata, handles, varargin)

movegui(gcf,'center')

handles.output = hObject;

guidata(hObject, handles);


function varargout = frmFalsaPosicion_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)


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


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnCalcular.
function btnCalcular_Callback(hObject, eventdata, handles)
xai = str2double(get(handles.edit2,'string')); % valor de x1
xbi = str2double(get(handles.edit3,'string')); % valor de x2
tol = str2double(get(handles.edit4,'string')); % error
f = get(handles.edit1,'string');
f = inline(f);
i=1;
ea(1)=100;
%%%%% Metodo Falsa Posicion %%%%%%
if f(xai) * f(xbi) < 0; % Comprobando que la raiz se encuentra en este intervalo
    xa(1) = xai;
    xb(1) = xbi;
    xf(1) = xb(1)-f(xb(1))*(xa(1) - xb(1))/(f(xa(1))-f(xb(1)));
    %Limpiar tabla antes de mostrar resultado
    set(handles.tabla,'Data',{})
    % Limpiar tabla, grafico en caso de que antes se haya graficado una funcion
    hold off
    cla
    set(handles.tabla,'Data',{})
    set(handles.respuesta,'string','No hay raiz');
    while abs(ea(i)) >= tol
        if f(xa(i)) * f(xf(i)) < 0 % Condicion de cumplimiento
            xa(i+1) = xa(i);
            xb(i+1) = xf(i); % Es la raiz(xr) si se cumple condicion
        end
        if f(xa(i)) * f(xf(i)) > 0 % Condicion de cumplimiento
            xa(i+1) = xf(i); % Es la raiz(xr) si se cumple condicion
            xb(i+1) = xb(i);
        end
        xf(i+1)= xb(i+1)-f(xb(i+1))*(xa(i+1) - xb(i+1))/(f(xa(i+1))-f(xb(i+1)));
        ea(i+1)= abs((xf(i+1)-xf(i))/(xf(i+1))*100);% error absoluto
        
        % =================== Mostrara datos en tabla =====================
        
        newRow ={i xa(i+1) xb(i+1) xf(i+1) ea(i+1)};
        oldData = get(handles.tabla,'Data');
        newData=[oldData; newRow];
        set(handles.tabla,'Data',newData)
        
        grid on;
        plot(i,f(i),'Ok');
        hold on;
        
        i=i+1;
    end % Cerramos while
    % Mostrando respuesta en textbox con formato coma flotante a 6 cifras decimales
    respuesta=sprintf('%0.6f',xf(i));
    set(handles.respuesta,'string',respuesta);
    %axes1 de la funcion
    fplot(handles.axes1,f,[xai xbi]);
    %grid on;
    %hold on;
    %handles.axes1 = plot(xf(i),subs(f,respuesta),'r
    grid
    ezplot(f);
    
    grid on;
    plot(xbi,f(xbi),'+');
    zoom on
    
else
    set(handles.respuesta,'string','No existe la raiz en el intervalo');
    zoom on
end

% --- Executes on button press in btnLimpiar.
function btnLimpiar_Callback(hObject, eventdata, handles)
cla %limpiar tabla
set(handles.tabla,'Data',{})
%limpiar textboxs
set(handles.edit1,'string','');
set(handles.edit2,'string','');
set(handles.edit3,'string','');
set(handles.edit4,'string','');
set(handles.respuesta,'string','');

function respuesta_Callback(hObject, eventdata, handles)

function respuesta_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

close
frmBiseccion


function tabla_CreateFcn(hObject, eventdata, handles)

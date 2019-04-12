function eventView(haxes,handles,data,eventData)
global xScale;
global yScale;
if isempty(eventData)
    return
end
if isempty(xScale)||xScale<0
    xScale = 1;
end
if isempty(yScale)||yScale<0
    yScale = 1;
end
eventIndex = get(handles.listbox2,'Value');
event = eventData(eventIndex);
st = event.st;
ed = event.ed;
ste = event.ste;
ede = event.ede;
bl = event.bl;
dc = event.dc;
dccc = event.dccc;
xexd =ceil(xScale*(ed-st));
ymax = max(data(st-xexd:ed+xexd,2));
ymin = min(data(st-xexd:ed+xexd,2));
yexd = ceil(yScale*(ymax-ymin));
set(handles.edit1,'String',num2str(event.t));
set(handles.edit2,'String',num2str(dccc));
hold off
plot(haxes,data(st-xexd:ed+xexd,1),data(st-xexd:ed+xexd,2));
hold on
if (get(handles.checkbox2,'Value') == 1)
    plot(haxes,data(ste:ede,1),event.fd,'green:','LineWidth',1.2);
end
if (get(handles.checkbox3,'Value') == 1)
    plot(haxes,[data(ed,1) data(ed,1) data(st,1) data(st,1)],[bl bl-dccc bl-dccc bl],'r','LineWidth',2);
end
if (get(handles.checkbox1,'Value') == 1)
    plot(haxes,[data(st,1) data(ed,1)],[bl bl],'black','LineWidth',2);
end
if (get(handles.checkbox4,'Value') == 1)
    plot(haxes,[data(ede,1) data(ede,1) data(ste,1) data(ste,1)],[bl bl-dc bl-dc bl],'r:','LineWidth',2);
end
hold off
ylim([ymin-yexd ymax+yexd]);
xlim([data(st-xexd,1) data(ed+xexd,1)]);
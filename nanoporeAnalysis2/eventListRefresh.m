function eventListRefresh(handle,events)
if(isempty(events))
    return
end
count = length(events);
list = cell(count,1);
for i = 1:count
    list{i} = [num2str(i) '. length = ' num2str(events(i).ed-events(i).st)];
end
set(handle,'String',list);
set(handle,'Value',1);
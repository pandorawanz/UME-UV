function dataReflesh(handle,index)
global data
global eventDatas
if(~exist('temps\info.mat','file'))
    return
end
load('temps\info.mat');
set(handle.lb_data,'String',dataNames);
set(handle.lb_data,'Value',index);
if(isempty(dataNames))
    return
end
load(['temps\data\' dataNames{index} '.mat']);
plot(handle.axes1,data(:,1),data(:,2));
if(~exist(['temps\\data\' dataNames{index} 'Events.mat'],'file'))
    set(handle.listbox2,'String',[]);
    return
end
try
load(['temps\data\' dataNames{index} 'Events.mat']);
eventListRefresh(handle.listbox2,correctedEvents);
eventDatas = correctedEvents;
end
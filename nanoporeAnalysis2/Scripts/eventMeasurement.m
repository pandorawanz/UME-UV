% eventMeasurement
global eventData;
eventCount = length(correctedEvents);
for i = 1:eventCount
    if dbc == 0
        correctedEvents(i).st = correctedEvents(i).ste;
        correctedEvents(i).ed = correctedEvents(i).ede;
    end
    st = correctedEvents(i).st;
    ed = correctedEvents(i).ed;
    bl = correctedEvents(i).bl;
    threshold = bl-u0/1.5;
    edata = data(st:ed,2);
    tdata = data(st:ed,1);
    odata = data(correctedEvents(i).ste:correctedEvents(i).ede,2);
    st1 = searchLowFirst(edata,threshold, 1);
    ed1 = searchLowFirst(edata,threshold, -1);
    if rc == 1
        correctedEvents(i).t = tdata(ed1)-tdata(1);
        correctedEvents(i).ed = st+ed1;
    else
        correctedEvents(i).t = tdata(end)-tdata(1);
    end
    try
    correctedEvents(i).dc = correctedEvents(i).bl - mean(edata(st1:ed1)); %#ok<*SAGROW>
    catch
        1
    end
    ft = 2*0.3321/fc;
    if (correctedEvents(i).t<ft)
        correctedEvents(i).type = 0;
        if (im == 0)
            correctedEvents(i).dccc = correctedEvents(i).dc;
            continue
        end
        if rc == 1
            endpoint = find(edata == min(edata));
            endpoint = endpoint(end);
            correctedEvents(i).ed = correctedEvents(i).st+endpoint;
            correctedEvents(i).t = tdata(endpoint)-tdata(1);
        else
            endpoint = length(edata);
        end
        dt = tdata(2)-tdata(1);
        t = correctedEvents(i).t;
        correctedEvents(i).eint = sum((edata-bl)*dt/1000);
        eint = correctedEvents(i).eint;
        dccc = abs(eint/t*10^3);
        correctedEvents(i).dccc = abs(eint/t*10^3);
    else
        correctedEvents(i).type = 1;
        correctedEvents(i).dccc = correctedEvents(i).dc;
    end
end
eventData = correctedEvents;
save(['..\temps\data\' dataName 'Events.mat'],'correctedEvents');
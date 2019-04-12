% event detection
if(~(exist('data','var')&&exist('ww','var')&&exist('u0','var')))
     return
end
if(ischar(ww))
    ww = str2double(ww);
end
if(ischar(u0))
    u0 = str2double(u0);
end
count = length(data);

if (count<=ww)
    return
end
events = [];
eventCount = 0;

baseline(1:ww) = mean(data(1:ww,2));

detected = 0;
crossPoint = 1;
i = ww+1;

while i < count
    if (detected==1)
        baseline(i) = baseline(i-1);
        if (data(i,2)>baseline(i))
            events(eventCount).ed = i;
            st = events(eventCount).st;
            th = baseline(i)-u0;
            if(sum(data(st:i,2)<th)>40)
                events(eventCount).type = 1;
            else
                events(eventCount).type = 0;
            end
            detected = 0;
            if(i+ww>=count)
                break; 
            end
            baseline(i+1:i+ww) = mean(data(i+1:i+ww,2));
            i = i+ww;
        end
    else
        baseline(i) = baseline(i-1)+(data(i,2)-data(i-ww,2))/ww;
        if((data(i,2)<baseline(i))&&(data(i-2,2)>baseline(i-2)))
            crossPoint = i-1;
        end
        if(data(i,2)<baseline(i)-u0)
            detected = 1;
            eventBreak = 0;
            eventCount = eventCount+1;
            events(eventCount).st = crossPoint;
            events(eventCount).bl = baseline(i);
        end
    end
    i = i+1;
end

eventCorrection;

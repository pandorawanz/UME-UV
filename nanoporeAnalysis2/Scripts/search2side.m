function [st, ed] = search2side(data,peaks)
m = mean(data);
count = length(peaks);
st = peaks(1);
ed = peaks(end);
for i = 1:count-1
    if(min(data(peaks(i):peaks(i+1)))<m)
    	st = peaks(i);
        break;
    end
end
for i = 1:count-1
    if(min(data(peaks(count-i):peaks(count-i+1)))<m)
    	ed = peaks(count-i+1);
        break;
    end
end
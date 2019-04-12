%% function for search all the peaks in an event
%   input data: the 2rd-differential of the signal data
%         st: the start point to search
%         direct: -1 or 1
function peaks = searchLowPeaks(data)
peaks = [];
peakCount = 0;
if(data(1)<data(2))
    peakCount = 1;
    peaks(1) = 1;
end
for i = 2:length(data)-1
    if(data(i)<data(i-1)&&data(i)<=data(i+1))
        peakCount = peakCount+1;
        peaks(peakCount) = i;
    end
end
if(data(i+1)<data(i))
    peakCount = peakCount + 1;
    peaks(peakCount) = i+1;
end
% eventCorrection

if ~(exist('eventCount','var')&&exist('events','var')&&exist('data','var'))
    disp('data missing, (eventCorrection)')
    return 
end

%\\\\\\\\ settings of the Fourier Series fitting \\\\\\
ft = fittype('fourier4');
opts = fitoptions(ft);
opts.DiffMinChange = 1.0e-8;
opts.DiffMaxChange = 0.1;
opts.MaxFunEvals = 600;
opts.MaxIter = 400;
opts.TolFun = 1.0e-6;
opts.TolX = 1.0e-6;
opts.Display = 'Off';
opts.Algorithm = 'Trust-Region';
%\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

correctedEvents = events;

for i = 1:eventCount
    st = events(i).st;
    ed = events(i).ed;
    correctedEvents(i).ste = st;
    correctedEvents(i).ede = ed;
    eventData = data(st:ed,2);
    if (correctedEvents(i).type == 1)
        x = 1:(ed-st+1);
        [xData, yData] = prepareCurveData( x', eventData );
        fitresult = fit( xData, yData, ft, opts );% fitting the data
        fittedEventData = fitresult(x);
        correctedEvents(i).fd = fittedEventData;
       continue
    else
        if (length(eventData)<11)
%              correctedEvents(i).fd = data(st:ed,2);
%             continue
            ft = fittype('fourier2');
        end
        x = 1:(ed-st+1);
        [xData, yData] = prepareCurveData( x', eventData );
        fitresult = fit( xData, yData, ft, opts );% fitting the data
        fittedEventData = fitresult(x);
        d2fitData = diff(diff(fittedEventData));
        peaks = searchLowPeaks(d2fitData);
        [st2, ed2] = search2side(yData,peaks);
        correctedEvents(i).st = st2+st;
        correctedEvents(i).ed = ed2+st;
        correctedEvents(i).fd = fittedEventData;
    end
end

eventMeasurement;

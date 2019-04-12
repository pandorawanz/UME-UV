% dataLoading
pathname='d:\';
if(exist('load_path.mat','file')==2)
    load load_path;
end
format_string={'*.txt';'*.mat'};
[filename,pathname]=uigetfile(format_string,'Please select the data','MultiSelect','off',pathname);
if(filename==0)
    return
end
save load_path pathname;
data = load([pathname filename]);
if exist('..\temps\info.mat','file')
    load('..\temps\info.mat');
else
    dataCount = 0;
    dataNames = [];
end
dataCount = dataCount + 1;
dataNames{dataCount} = filename(1:end-4);
save('..\temps\info.mat','dataCount','dataNames');

if(~exist('..\temps\data','dir'))
    mkdir('..\temps\data');
end
fn = ['..\temps\data\' dataNames{dataCount} '.mat'];
save(fn,'data');
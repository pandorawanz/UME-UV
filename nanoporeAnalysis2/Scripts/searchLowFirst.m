function result = searchLowFirst(data,threshold, direction)
count = length(data);
if (direction == -1)
   data = fliplr(data'); 
end
flag = find(data<threshold);
if (isempty(flag))
    if(direction == 1)
        result = 0;
    else
        result = 1;
    end
   return 
end
flag = flag(1);
if (flag == count)
    result = flag;
    return
end
while (data(flag+1)<data(flag))
   flag = flag+1; 
   if(flag == count)
    break
   end
end

if (direction == -1)
    result = count - flag+1;
else
    result = flag;
end
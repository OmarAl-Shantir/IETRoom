function showTable( handles,data);
    showData=[];
    nan=~isnan(data);
    for i = 1:size(data,1)
        if nan(i,1)
            showData=[showData;data(i,:)];
        end
    end
    set(handles.uitable1, 'Data', showData);
end


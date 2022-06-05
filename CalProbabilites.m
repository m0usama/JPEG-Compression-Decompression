% funtion to get the probabilites of pixel values in each block
function [KeyList, Probabilites] = CalProbabilites(lists, n)
    Probabilites = cell(1, length(lists));
    KeyList = cell(1, length(lists));
    for idx=1:length(lists)
        lists{idx}(lists{idx}==-1000) = 0;
        KeyList{idx} = unique(lists{idx});
        for i=1:length(KeyList{idx})
            Probabilites{idx}(i) = double(sum(lists{idx}==KeyList{idx}(i), 'all'))/(n*n);
        end
        Probabilites{idx}(KeyList{idx}==0) = Probabilites{idx}(KeyList{idx}==0) + double((n*n)-length(lists{idx}))/(n*n);
    end
end
function Values = CalValues(Tree, String)
    Values = [];
    idx = 1;
    temp_Tree = Tree;
    while ~isempty(String)
        if String(1) == 0
            Tree = Tree{1};
        else
            Tree = Tree{2};
        end
        String(1) = [];
        if isa(Tree, 'cell')
            continue
        else
            Values(idx) = Tree;
            idx=idx+1;
            Tree = temp_Tree;
        end
    end
end
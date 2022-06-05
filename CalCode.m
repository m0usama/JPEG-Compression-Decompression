function CodeScheme = CalCode(Tree, String, CodeScheme)
    if isa(Tree, 'cell')
        CodeScheme = CalCode(Tree{1}, [String, 0], CodeScheme);
        CodeScheme = CalCode(Tree{2}, [String, 1], CodeScheme);
    else
        CodeScheme(Tree) = String;
    end
end
function Blocks = MoveBlock(Blocks, TermNo, InverseLvl)
    if InverseLvl==1 
        TermNo = TermNo*(-1);
    end
    for i=1:length(Blocks)
        Blocks{i} = Blocks{i} - TermNo;
    end
end

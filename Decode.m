function DecodedValues = Decode(CodeList, Trees)
    DecodedValues = cell(1, length(Trees));
    for idx=1:length(CodeList)
        Values = CalValues(Trees{idx}, CodeList{idx});
        Values(length(Values)+1) = -1000;
        DecodedValues{idx} = Values;
    end
end
function [Trees, CodeList] = Encode(Pixels, Probabilities, Lists)
    Trees = cell(1, length(Pixels));
    CodeList = cell(1, length(Pixels));
    for idx=1:length(Pixels)
       for i=1:length(Pixels{idx})
          Tree{i} = Pixels{idx}(i); 
       end
       while length(Tree)-2>0
          [Probabilities{idx}, indices] = sort(Probabilities{idx});
          Tree = Tree(indices);
          Tree{2} = {Tree{1}, Tree{2}};
          Tree(1) = [];
          Probabilities{idx}(2) = Probabilities{idx}(1)+Probabilities{idx}(2);
          Probabilities{idx}(1) = [];
       end
       Trees{idx} = Tree;
       CodeScheme = containers.Map((1000), ([1000, 2, 7]));
       CodeScheme = CalCode(Tree, [], CodeScheme);
       remove(CodeScheme, 1000);
       for i=1:length(Lists{idx})-1
            CodeList{idx} = [CodeList{idx} CodeScheme(Lists{idx}(i))];
       end
       
    end
end

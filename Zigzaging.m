function List = Zigzaging(Entropy, n)
    List = cell(1, length(Entropy));
    for k=1:length(Entropy)
        String = zeros(1, n*n, 'double');
        Index=1;
        for i=1:n
            for j=1:i
               if mod(i, 2)==1
                   String(Index) = Entropy{k}(i+1-j, j);
               else
                   String(Index) = Entropy{k}(j, i+1-j);
               end
               Index=Index+1;
            end
        end
        for i=2:n
            for j=i:n
                if mod(n-i, 2)==1
                    String(Index) = Entropy{k}(j, n+i-j);
                else
                    String(Index) = Entropy{k}(n+i-j, j);
                end
                Index=Index+1;
            end
        end
        Index = find(String, 1, 'last');
        if isempty(Index)
            Index=0;
        end
        String(Index+1) = -1000;
        List{k} = String(1:Index+1);
    end
end
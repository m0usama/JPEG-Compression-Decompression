function Entropy = ReverseZigzaging(List, n)
    Entropy = cell(1, length(List));
    for Index=1:length(List)
        Win = zeros(n, 'double');
        k=1;
        for i=1:n
            if List{Index}(k)==-1000
               break;
            end
            for j=1:i
               if mod(i, 2)==1
                   Win(i+1-j, j) = List{Index}(k);
               else
                   Win(j, i+1-j) = List{Index}(k);
               end
               k=k+1;
               if List{Index}(k)==-1000
                   break;
               end
            end
            if List{Index}(k)==-1000
               break;
            end
        end
        for i=2:n
            if List{Index}(k)==-1000
               break;
            end
            for j=i:n
                if mod(n-i, 2)==1
                    Win(j, n+i-j) = List{Index}(k);
                else
                    Win(n+i-j, j) = List{Index}(k); 
                end
                k=k+1;
                if List{Index}(k)==-1000
                   break;
                end
            end
            if List{Index}(k)==-1000
                break;
            end
        end
        Entropy{Index} = Win;
    end
end
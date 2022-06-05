function Image = CombineBlocks(Blocks, n, Size)
    Index=1;
    for i=0:Size(1)/n - 1
        for j=0:Size(2)/n - 1
            Image(i*n+1:i*n+n, j*n+1:j*n+n) = uint8(Blocks{Index});
            Index=Index+1;
        end
    end
end
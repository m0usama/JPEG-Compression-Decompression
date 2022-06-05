function Blocks = CalBlocks(GreyImage, n)
    r = size(GreyImage, 1);
    c = size(GreyImage, 2);
    Blocks = cell(1, (r/n)*(c/n));
    Index = 1;
    for i=0:size(GreyImage, 1)/n - 1
        for j=0:size(GreyImage, 2)/n - 1
            Blocks{Index} = double(GreyImage(i*n+1:i*n+n, j*n+1:j*n+n));
            Index=Index+1;
        end
    end
end
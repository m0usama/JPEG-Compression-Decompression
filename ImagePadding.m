function Image = ImagePadding(InputImage, n)
    Rows = size(InputImage, 1);
    Cols = size(InputImage, 2);
    channels = size(InputImage, 3);
    if mod(Rows, n)
        Rows_new  = Rows+(n-mod(Rows, n));
    else
        Rows_new = Rows;
    end
    if mod(Cols, n)
        Cols_new = Cols+n-mod(Cols, n);
    else
        Cols_new = Cols;
    end
    Image = zeros([Rows_new, Cols_new, channels], 'uint8');
    Image(1:Rows, 1:Cols, :) = InputImage;
end
function Window = TransformationNormalization(Window, NoOfQuantization, Inverse)
    if NoOfQuantization == 8
        % Size 8*8
        quant_table = [16, 11, 10, 16, 24, 40, 51, 61;
            12, 12, 14, 19, 26, 58, 60, 55;
            14, 13, 16, 24, 40, 57, 69, 56;
            14, 17, 22, 29, 51, 87, 80, 62;
            18, 22, 39, 56, 68, 109, 103, 77;
            24, 35, 55, 64, 81, 104, 113, 92;
            49, 64, 78, 87, 103, 121, 120, 101;
            72, 92, 95, 98, 112, 100, 103, 99];

    elseif NoOfQuantization == 7
        % Size 7*7
        quant_table = [16, 10, 16, 24, 40, 51, 61;
            14,  16, 24, 40, 57, 69, 56;
            14,  22, 29, 51, 87, 80, 62;
            18,  39, 56, 68, 109, 103, 77;
            24,  55, 64, 81, 104, 113, 92;
            49,  78, 87, 103, 121, 120, 101;
            72,  95, 98, 112, 100, 103, 99];

    elseif NoOfQuantization == 6
        % Size 6*6
        quant_table = [16,  16, 24, 40, 51, 61;
            14, 29, 51, 87, 80, 62;
            18, 56, 68, 109, 103, 77;
            24, 64, 81, 104, 113, 92;
            49, 87, 103, 121, 120, 101;
            72, 98, 112, 100, 103, 99];

    elseif NoOfQuantization == 5
        % Size 5*5
        quant_table = [16,   24, 40, 51, 61;
            14,  51, 87, 80, 62;
            24,  81, 104, 113, 92;
            49,  103, 121, 120, 101;
            72,  112, 100, 103, 99];

    elseif NoOfQuantization == 4
        % Size 4*4
        quant_table = [ 24, 40, 51, 61;
            81, 104, 113, 92;
            103, 121, 120, 101;
            112, 100, 103, 99];

    elseif NoOfQuantization == 3
        % Size 3*3
        quant_table = [76, 108, 122;
            110, 117, 168;
            130, 177, 250];

    end

    if Inverse == 0
        for i=1:length(Window)
            %         Transformation in DCT
            Window{i} = dct2(Window{i});
            %       Normalising Image
            Window{i} = round(Window{i}./quant_table);
        end
    else
        for i=1:length(Window)
            % Inverse Normalization
            Window{i} = (Window{i}.*quant_table);

            % Inverse of DCT
            Window{i} = idct2(Window{i});
        end
    end
end
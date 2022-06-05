function Main(InputPath, OutputPath, NoOfQuantization, PlotCheck, SaveCheck)
    Image = imread(InputPath);

    PaddedImage = ImagePadding(Image, NoOfQuantization);
    OutputImage = zeros(size(PaddedImage), 'uint8');

    YCBCR = rgb2ycbcr(PaddedImage);

    Y = YCBCR(:,:,1);
    Cb = YCBCR(:,:,2);
    Cr = YCBCR(:,:,3);

    for ChannelNo = 1 : size(PaddedImage, 3)
        GrayLevelImage = PaddedImage(:, :, ChannelNo);
        SizeOfGrayImg = size(GrayLevelImage);

        if ChannelNo == 1
            subplot(1,3,ChannelNo);
            imshow(Y)
            title("Channel: " + 'Y')
        elseif ChannelNo == 2
            subplot(1,3,ChannelNo);
            imshow(Cb)
            title("Channel: " + 'Cb')
        else
            subplot(1,3,ChannelNo);
            imshow(Cr)
            title("Channel: " + 'Cr')
        end

        % Compression of Image
        Window = CalBlocks(GrayLevelImage, NoOfQuantization);
        Window = MoveBlock(Window, 128, 0);
        Window = TransformationNormalization(Window, NoOfQuantization, 0);
        EntrophyList = Zigzaging(Window, NoOfQuantization);
        [Keys, Probabilities] = CalProbabilites(EntrophyList, NoOfQuantization);
        [Trees, CodeList] = Encode(Keys, Probabilities, EntrophyList);

        % Decompression of Image
        DecodesList = Decode(CodeList, Trees);
        FirstBlock = ReverseZigzaging(DecodesList, NoOfQuantization);
        Blocks = TransformationNormalization(FirstBlock, NoOfQuantization, 1);
        Blocks = MoveBlock(Blocks, 128, 1);
        OutputImage(:, :, ChannelNo) = CombineBlocks(Blocks, NoOfQuantization, SizeOfGrayImg);
    end

    % Save After Compression and Decompression
    if strcmp(SaveCheck,"On") == 1
        imwrite(OutputImage, (OutputPath + "_" + NoOfQuantization + ".png"));
    end

    if strcmp(PlotCheck,"On") == 1
        figure();
        subplot(1,2,1);
        imshow(PaddedImage);
        title('Original image');

        subplot(1,2,2);
        imshow(OutputImage);
        title("Output image with Quantization: "+ NoOfQuantization)
    end
end


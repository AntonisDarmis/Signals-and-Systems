%Σήματα και συστήματα 2020-2021
%Μέλη ομάδας: Π19183, Π19040, Π19092
%Εργασία 2 (Άσκηση Γ4).

%Based on:
%https://www.mathworks.com/matlabcentral/fileexchange/4772-image-compression

image = 'sampleimage.bmp';
num_coeff = 2000;

I = imread(image);
I = rgb2gray(I);    %grayscale version of input image
Im = double(I); %store image as double
Gc = dct2(Im);      %2dimensional dct      

sqr = (Gc).^2;              
sqr = sqr(:);
[~,ind] = sort(sqr);       

ind = flipud(ind);

compressed_dft = zeros(size(Im));   

for i = 1:num_coeff
    compressed_dft(ind(i)) = Gc(ind(i));   
end

comp_img = idct2(compressed_dft); %2d inverse dct 
comp_img = uint8(comp_img);


% Show images
subplot 121; imshow(I); title('Input');
subplot 122; imshow(comp_img); title('Compressed');

%Σήματα και συστήματα 2020-2021
%Μέλη ομάδας: Π19183, Π19040, Π19092
%Εργασία 2 (Άσκηση Γ4).

%read image
I=imread('sampleimage.bmp');
I2 = im2double(I);


Gc = discretecosinetransform(I2);  %διακριτός συνημιτονικός μετασχηματισμός
g = inversediscretecosinetransform(Gc); %αντίστροφος δσμ.
imshow(g);

subplot 131; imshow(im2gray(I)); title('Original Image');
subplot 132; imshow(Gc); title('DCT');
subplot 133; imshow(g); title('IDCT');



image = 'unipi.jpeg';

c=5;
T=10;

Input = imread(image);

K = 1/(c*T)*ones(1,c*T+1);  %κρουστική απόκριση
Blurred_image = imfilter(Input,K,'replicate');  %συνέλιξη

%imshow(image)
imshow(Blurred_image);
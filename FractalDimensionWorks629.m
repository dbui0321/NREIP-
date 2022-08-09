% Importing the image and setting parameters: axis, colormap, etc. 
I = imread('C:\Users\buida\OneDrive\Desktop\NREIP\Images\Img10.jpg')
imshow(I)
image(I)
axis square

figure
boxcount(I)
figure
boxcount(I,'slope')
%% 


c = I(1:756, 1:1008, 3);
bi = (c<80);
imagesc(bi)
colormap gray
axis image
[n,r] = boxcount(bi,'slope');

df = diff(log(n))./diff(log(r));
disp(['Fractal dimension, Df = ' num2str(mean(df(4:8))) ' +/- ' num2str(std(df(4:8)))]);


%whos I
%figure
%imhist(I)

%[n,r] = boxcount(bi,'slope');
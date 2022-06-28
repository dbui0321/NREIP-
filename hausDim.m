%=========================================================================
%
% The program will calculate the fractal dimension of a 512x512 image
% using the box counting method.
%
% The code is just for beginners for getting an idea of box-counting
% method.
%
%=========================================================================
clear;
clc;
% the image is read and first its changed to grayscale image and then to 
% black and white
%image=imread('circ1_512x512.png');
image = imread('ISIC_0000001-CannyBlue.jpg');
% inverted_image = not(image);
% image=im2double(image);
% [r,c,ch]=size(image);
% invert_image=image;
% if(ch==0)
%  for i=1:r
%     for j=1:c
%         if(invert_image(i,j)==1)
%           invert_image(i,j)=0;
%         else
%           invert_image(i,j)=1;
%         end
%     end 
% end
% end
 if ~ismatrix(image); image = rgb2gray(image); end
ukuran=size(image)
figure(1); ori=imshow(image, []);
% [tinggi1,lebar1,cols1]=size(image); 
% image2=imcomplement(image); %merubah Hitam menjadi putih atau sebaliknya
% figure(2); bw=imshow(image2, []);
% image2=rgb2gray(image); 
% min_gambar=min(min(image)); %piksel minimum gambar
% max_gambar=max(max(image)); %piksel maksimum gambar
image3=image>0; %default 190 nggak tau darimana??
% figure(3); bw=imshow(image3, [])
% initialises the varaibles for plotting the graph. scale is used to store
% the scaling factors and the count is used to store the number of boxes
% which contains parts of the image. For a given scale(1,i) value, the number
% of boxes occupied by the image will be available at count(1,i)
maxscale = floor(log2(min(ukuran(1:2))));
scale=zeros(1,maxscale+1);
count=zeros(1,maxscale+1);
[tinggi_gambar,lebar_gambar,cols]=size(image3);
% since the program is for a 512x512 image, the limit is set 
% to 9 since 2^9=512
fprintf('i\t->\t\tr=2^i\t\t->\tn(r)\n');
fprintf('i\t->\tBanyak Kotak (rxr)\t->\tBanyak Kotak yg dilewati Gambar\n');
for i=0:maxscale
   % scaling factors are taken as 2,4,8,16...,512. 
   % For each scaling factor, the total number of pieces are to be calculated,
   % and the number of pieces which contain the black dots (pixels) among them are to
   % be counted.
   % For eg, when the scaling factor is 2, it means the image is divided in to
   % half, hence we will get 4 pieces. And have to see how many of pieces
   % have the black dots. 
   i;
   r=2^i;
   banyak_kotak=r^2;
   tinggi_setiap_kotak=tinggi_gambar/r;
   lebar_setiap_kotak=lebar_gambar/r;
   
   %initially we assume, we have 0 black pieces
   banyak_kotak_hitam=0;
   
   % Now we have to iterate through each pieces to see how many pieces have the
   % black dots (pixel) in it. We will consider the collection of pieces as
   % a matrix. We are counting from 0 for the ease of calculations.
   for indeks_kotak=0:banyak_kotak-1
       % row and column indices of each pieces are calculated to estimate the
       % xy cordinates of the starting and ending of each piece.
       indeks_kotak;
       baris_kotak=idivide(int32(indeks_kotak), int32(r));
       kolom_kotak=rem(indeks_kotak,r);
       ymin=floor(kolom_kotak*tinggi_setiap_kotak)+1;
       ymax=(ymin+floor(tinggi_setiap_kotak))-1;
       xmin=floor(baris_kotak*lebar_setiap_kotak)+1;
       xmax=(xmin+floor(lebar_setiap_kotak))-1;
       
       % each piece is extracted and stored in another array for
       % convenience.
       setiap_kotak=image3(ymin:ymax,xmin:xmax);
       %each piece obtained is plotted on a plot for getting a view 
       %of the splitting of the whole image.
%        figure(4);
%   subplot(r,r,indeks_kotak+1), imshow(setiap_kotak);
       
       % now, we will check whether the piece has some black dots in it.
       % then the count of the black pieces will be incremented.
       if (min(min(setiap_kotak))== 0)
           banyak_kotak_hitam=banyak_kotak_hitam+1;
       end
   end
   
   % the count of pieces which contains the black dots for a given scaling value 
   % will be obtained here and will be stored in the respective variables.
   fprintf('%d\t->\t\t%d\t\t->\t%d\n',i, r, banyak_kotak_hitam);
   scale(1,i+1)=r;
   count(1,i+1)=banyak_kotak_hitam;
   nr(1,i+1)=r;
   nr(2,i+1)=banyak_kotak_hitam;
end
% Now the process is over, the graph is plotted and the fractal dimension
% is calculated using the 'ployfit' function.
figure(5);
plot(log(scale),log(count));
%figure(6);
fractal_dimension = polyfit(log(scale),log(count),1)
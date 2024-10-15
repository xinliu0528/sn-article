
clear
clc
% Proposed   SBSDI  PNLM  NCDF DPAD MSBTD TGV
I1=imread('E:\陈怀广-论文集\paper-CSFL-chen\CSFL_code\部分放大对比\14pr.png');
I2=double(imread('E:\陈怀广-论文集\paper-CSFL-chen\CSFL_code\部分放大对比\14pn.png'));
I3=double(imread('E:\陈怀广-论文集\paper-CSFL-chen\CSFL_code\部分放大对比\14wg.png'));
I4=double(imread('E:\陈怀广-论文集\paper-CSFL-chen\CSFL_code\部分放大对比\14fo.png'));

O_Img=imread('E:\陈怀广-论文集\paper-CSFL-chen\CSFL_code\部分放大对比\14aver.tif');
N_Img=imread('E:\陈怀广-论文集\paper-CSFL-chen\CSFL_code\部分放大对比\14no.tif');
O_Img=double(O_Img);
N_Img=double(N_Img);
E_Img=double(I1);
figure,imshow(O_Img,[])
hold on
rectangle('position',[327.0000   65.0000  291.0000  139.0000],'LineWidth',2,'EdgeColor','r');%RIO1
%rectangle('position',[567.0000  104.0000   93.0000   87.0000],'LineWidth',2,'EdgeColor','g');%RIO1
% rectangle('position',[ 139.0000  114.0000  188.0000  114.0000],'LineWidth',2,'EdgeColor','r');%RIO2
%104:104+87,567:567+93  114:114+114,139:139+188
% 119:119+83,21:21+78 (21.0000  119.0000   78.0000   83.0000)  
% 65:65+139,327:327+291 (327.0000   65.0000  291.0000  139.0000)
% 61:61+169,348:348+212(348.0000   61.0000  212.0000  169.0000)
figure,imshow(N_Img,[])
figure,imshow(I2,[])
figure,imshow(I3,[])
figure,imshow(I4,[])
figure,imshow(I1,[])
f1=I2(65:65+139,327:327+291);
f2=I3(65:65+139,327:327+291);
f3=I4(65:65+139,327:327+291);

f6=E_Img(65:65+139,327:327+291);
f8=O_Img(65:65+139,327:327+291);
f9=N_Img(65:65+139,327:327+291);

%%
f88=imresize(f8,3,'bicubic');
figure,imshow(f88,[])
imwrite( uint8(f88), 'RIOs\O2.png' );
f99=imresize(f9,3,'bicubic');
figure,imshow(f99,[])
imwrite( uint8(f99), 'RIOs\N2.png' );
f11=imresize(f1,3,'bicubic');
figure,imshow(f11,[])
imwrite( uint8(f11), 'RIOs\pnlm02.png' );
f22=imresize(f2,3,'bicubic');
figure,imshow(f22,[])
imwrite( uint8(f22), 'RIOs\wglrr2.png' );
f33=imresize(f3,3,'bicubic');
figure,imshow(f33,[])
imwrite( uint8(f33), 'RIOs\fsvs2.png' );
f66=imresize(f6,3,'bicubic');
figure,imshow(f66,[])
imwrite( uint8(f66), 'RIOs\pr02.png' );


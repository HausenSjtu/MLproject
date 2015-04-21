clear;


m = imread('ml.png');
pic1_o = imread('ml1.jpg');
pic2_o = imread('ml2.jpg');

m = rgb2gray(m);
pic1 = rgb2gray(pic1_o);
pic2 = rgb2gray(pic2_o);

[mh mw] = size(m);
[pic1h pic1w] = size(pic1);
[pic2h pic2w] = size(pic2);
i=1;
j=1;
cor1 = zeros(pic1h - mh +1,pic1w - mw +1) ;
cor2 = zeros(pic2h - mh +1,pic2w - mw +1) ;

 for i = 1 : pic1h - mh +1
     for j = 1: pic1w - mw +1
        tmp = corrcoef(double(m),double(pic1( i:i+mh-1 , j:j+mw-1 )));
        if isnan(tmp(1,2))
            tmp2 = double(pic1( i:i+mh-1 , j:j+mw-1 ));
            tmp2(1,1) = tmp2(1,1) +1;
            tmp = corrcoef(double(m),tmp2);
        end
        cor1(i,j) = tmp(1,2);
     end
 end
 
 
 for i = 1 : pic2h - mh +1
     for j = 1: pic2w - mw +1
        tmp = corrcoef(double(m),double(pic2( i:i+mh-1 , j:j+mw-1 )));
        if isnan(tmp(1,2))
            tmp2 = double(pic2( i:i+mh-1 , j:j+mw-1 ));
            tmp2(1,1) = tmp2(1,1) +1;
            tmp = corrcoef(double(m),tmp2);
        end
        cor2(i,j) = tmp(1,2);
     end
 end
 
 
 [pos_h pos_w] = find(cor1==max(abs(cor1(:))));
 figure;imshow(pic1_o);
 hold on;
 for i = [1 mw]
     for j =1:mh
        plot(pos_w+i-1,pos_h+j-1,'r.');
     end
 end
 for i = 1:mw
     for j =[1 mh]
        plot(pos_w+i-1,pos_h+j-1,'r.');
     end
 end
 
 [pos_h pos_w] = find(cor2==max(abs(cor2(:))));
 figure;imshow(pic2_o);
 hold on;
 for i = [1 mw]
     for j =1:mh
        plot(pos_w+i-1,pos_h+j-1,'r.');
     end
 end
 for i = 1:mw
     for j =[1 mh]
        plot(pos_w+i-1,pos_h+j-1,'r.');
     end
 end

disp('complete');
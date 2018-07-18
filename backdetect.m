function backdetect(a)
% a=imread('asd.jpg');
figure,imshow(a)
title('Original Image');
[row,col,o]=size(a);

% ********************BLOCK 1*************************************
I1=imcrop(a,[1 1 col/2 row/2]);
[row1,col1,o1]=size(I1);
m1=min(min(min(I1)));
M1=max(max(max(I1)));
t1=(m1+M1)/2;

for i=1:row1
    for j=1:col1
        for k=1:o1            
            if I1(i,j,k)>t1
                m1star=m1;
            else
                m1star=M1;
            end
            ki(i,j,k)=(255-m1star)./log(256);
            if I1(i,j,k)<t1 || I1(i,j,k)==t1
                tow1(i,j,k)=(ki(i,j,k)*log(double(I1(i,j,k))+1))+M1;
            else
                tow1(i,j,k)=(ki(i,j,k)*log(double(I1(i,j,k))+1))+m1;
            end
%             messi1(i,j,k)=imadd(I1(i,j,k),tow1(i,j,k));
            messi1=imadd(I1,25);
        end
    end
end


% ****************************BLOCK 2*****************************
I2=imcrop(a,[(col/2)+2 1 col row/2]);

[row2,col2,o2]=size(I2);
m2=min(min(min(I2)));
M2=max(max(max(I2)));
t2=(m2+M2)/2;

for i=1:row2
    for j=1:col2
        for k=1:o2            
            if I2(i,j,k)>t2
                m2star=m2;
            else
                m2star=M2;
            end
            ki(i,j,k)=(255-m2star)./log(256);
            if I2(i,j,k)<t2 || I2(i,j,k)==t2
                tow2(i,j,k)=(ki(i,j,k)*log(double(I2(i,j,k))+1))+M2;
            else
                tow2(i,j,k)=(ki(i,j,k)*log(double(I2(i,j,k))+1))+m2;
            end
%             messi2(i,j,k)=imadd(I2(i,j,k),tow2(i,j,k));
            messi2=imadd(I2,25);
        end
    end
end


% **************************** BLOCK 3*********************************
I3=imcrop(a,[1 (row/2)+2 col/2 row]);

[row3,col3,o3]=size(I3);
m3=min(min(min(I3)));
M3=max(max(max(I3)));
t3=(m3+M3)/2;

for i=1:row3
    for j=1:col3
        for k=1:o3            
            if I3(i,j,k)>t3
                m3star=m3;
            else
                m3star=M3;
            end
            ki(i,j,k)=(255-m3star)./log(256);
            if I3(i,j,k)<t3 || I3(i,j,k)==t3
                tow3(i,j,k)=(ki(i,j,k)*log(double(I3(i,j,k))+1))+M3;
            else
                tow3(i,j,k)=(ki(i,j,k)*log(double(I3(i,j,k))+1))+m3;
            end
%             messi3(i,j,k)=imadd(I3(i,j,k),tow3(i,j,k));
            messi3=imadd(I3,25);
        end
    end
end


% ********************************* BLOCK 4**************************
I4=imcrop(a,[(col/2)+2 (row/2)+2 col row]);

[row4,col4,o4]=size(I4);
m4=min(min(min(I4)));
M4=max(max(max(I4)));
t4=(m4+M4)/2;

for i=1:row4
    for j=1:col4
        for k=1:o4            
            if I4(i,j,k)>t4
                m4star=m4;
            else
                m4star=M4;
            end
            ki(i,j,k)=(255-m4star)./log(256);
            if I4(i,j,k)<t4 || I4(i,j,k)==t4
                tow4(i,j,k)=(ki(i,j,k)*log(double(I4(i,j,k))+1))+M4;
            else
                tow4(i,j,k)=(ki(i,j,k)*log(double(I4(i,j,k))+1))+m4;
            end
%             messi4(i,j,k)=imadd(I4(i,j,k),tow4(i,j,k));
            messi4=imadd(I4,25);
        end
    end
end


mesh=[messi1 messi2;messi3 messi4];
figure,imshow(mesh)
title('Background Detected Image');




function cropLossPercentage = cropLossCalculator(year1,year2)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
%imshowpair(year1,year2,"montage")

gy1=im2gray(year1);
gy2=im2gray(year2);
%imshowpair(gy1,gy2,"montage");

%adjy1=imadjust(gy1);
%imhist(adjy1)
%adjy2=imadjust(gy2);
%imhist(adjy2)

bw1=createMask(year1);
%imshowpair(year1,bw1,"montage")
bw2=createMask(year2);
%imshowpair(year2,bw2,"montage")

props1=regionprops("table",bw1,"Area");
areaPixels1=sum(props1.Area);
props2=regionprops("table",bw2,"Area");
areaPixels2=sum(props2.Area);

totArea=408958;
percen1=(areaPixels1/totArea)*100;
percen2=(areaPixels2/totArea)*100;

cropLossPercentage=percen2-percen1;
end
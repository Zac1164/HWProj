function f = asc_vs_desc(im,skew)
if ~isbw(im)
	im2 = imrotate(im,skew,"bilinear","loose",255);
	imbw = imcomplement(im2bw(im2,graythresh(im2)));
else
	im2 = imrotate(im,skew,"bilinear","loose",1);
	imbw = imcomplement(im2);
endif
im90 = rot90(imbw);
dist = sum(im90);
max_location = find(dist == max(dist));
subplot(1,1,1);
plot(dist);
title ("Pixel Count Histogram");
xlabel ("position on y-axis (pixels)");
ylabel ("number of black pixels");
print('ascenergy.png');
n = max_location;
n2 = columns(dist);
ascenders = dist(1:n);
descenders = dist(n:n2);
asc_sum = sum(ascenders);
desc_sum = sum(descenders);
asc_desc_ratio = asc_sum / desc_sum;
f = asc_desc_ratio;
endfunction

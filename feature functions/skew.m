function f = skew(im)
skew = -4;
skew_max = 0;
skew_location = 0;
for l = -4:0.05:4
	im2 = imrotate(im,l,"bilinear","loose",255);
	imbw = imcomplement(im2bw(im2,graythresh(im2)));
	im90 = rot90(imbw);
	dist = sum(im90);
	current = 0;
	current_max = max(dist);
	if current_max > skew_max
		skew_max = current_max;
		skew = l;
	endif
endfor
f = skew;
endfunction

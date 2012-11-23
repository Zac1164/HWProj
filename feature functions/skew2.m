function f = skew2(im)

skew = -4;
skew_max = 0;
skew_location = 0;

if ~isbw(im)
	imbw = imcomplement(im2bw(im,graythresh(im)));
else
	imbw = imcomplement(im);
endif

for l = -4:0.5:4
	im2 = imrotate(imbw,l,"bilinear","loose",0);
	im90 = rot90(im2);
	dist = sum(im90);
	current_max = max(dist);
	if current_max > skew_max
		skew_max = current_max;
		skew = l;
	endif
endfor
for l = (skew - 0.5):0.1:(skew + 0.5)
	im2 = imrotate(imbw,l,"bilinear","loose",0);
	im90 = rot90(im2);
	dist = sum(im90);
	current_max = max(dist);
	if current_max > skew_max
		skew_max = current_max;
		skew = l;
	endif
endfor
for l = (skew - 0.1):0.05:(skew + 0.1)
	im2 = imrotate(imbw,l,"bilinear","loose",0);
	im90 = rot90(im2);
	dist = sum(im90);
	current_max = max(dist);
	if current_max > skew_max
		skew_max = current_max;
		skew = l;
	endif
endfor
f = skew;

endfunction

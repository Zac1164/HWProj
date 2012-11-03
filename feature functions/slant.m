function f = slant(im)
im = im .* imcomplement(im2bw(im,graythresh(im)));
templateX = [-1,0,1;-2,0,2;-1,0,1];
templateY = [-1,-2,-1;0,0,0;1,2,1];
Gx = filter2(templateX,im);
Gy = filter2(templateY,im);
Gx2 = Gx .^2;
Gy2 = Gy .^2;
G = Gx2 + Gy2;
Gintensity = sqrt(G);
Gslant = atan(Gy ./ Gx);
Gfin = zeros(size(Gslant)(1,1),size(Gslant)(1,2));
Gintsum = 0;
for j = 1:1:size(Gslant)(1,1)
	for k = 1:1:size(Gslant)(1,2)
		if Gslant(j,k) > -10 && Gslant(j,k) < 10
			Gfin(j,k) = Gslant(j,k) * Gintensity(j,k);
			Gintsum = Gintsum + Gintensity(j,k);
		endif
	endfor
endfor
f = sum(Gfin(:))/Gintsum;
endfunction

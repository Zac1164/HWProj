function f = slant(im)
if ~isbw(im)
	im = im .* imcomplement(im2bw(im,graythresh(im)));
endif
templateX = [-1,0,1;-2,0,2;-1,0,1];
templateY = [-1,-2,-1;0,0,0;1,2,1];
Gx = filter2(templateX,im);
Gy = filter2(templateY,im);
Gx2 = Gx .^2;
Gy2 = Gy .^2;
G = Gx2 + Gy2;
Gintensity = sqrt(G);
Gslant = atan(Gy ./ Gx);
Gfin = zeros(rows(Gslant),columns(Gslant));
GfinPositive = zeros(rows(Gslant),columns(Gslant));
GfinNegative = zeros(rows(Gslant),columns(Gslant));
numPositive = 0;
numNegative = 0;
Gintsum = 0;
for j = 1:1:size(Gslant)(1,1)
	for k = 1:1:size(Gslant)(1,2)
		if Gslant(j,k) > -1.6 && Gslant(j,k) < 1.6
			Gfin(j,k) = Gslant(j,k) * Gintensity(j,k);
			Gintsum = Gintsum + Gintensity(j,k);
		endif
		if Gslant(j,k) >= 0 && Gslant(j,k) < 1.6
			GfinPositive(j,k) = Gslant(j,k) * Gintensity(j,k);
			numPositive = numPositive + 1;
		endif
		if Gslant(j,k) > -1.6 && Gslant(j,k) < 0
			GfinNegative(j,k) = Gslant(j,k) * Gintensity(j,k);
			numNegative = numNegative + 1;
		endif
	endfor
endfor
f = [sum(Gfin(:))/Gintsum,sum(GfinPositive(:))/Gintsum,sum(GfinNegative(:))/Gintsum,numPositive/(numPositive + numNegative)];
endfunction

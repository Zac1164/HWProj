function f = curvature(im,edgeLength)
if ~isbw(im)
	imbw = im2bw(im,graythresh(im));
else
	imbw = im;
endif
bounds = bwboundaries (imbw);
max_rows = 0;
border = -1;

globalMat = zeros(numel(bounds),1);
globalTotal = 0;

for k = 1:numel(bounds)
	if rows(bounds{k}) > max_rows
		max_rows = rows(bounds{k});
		border = k;
	endif
endfor

for k = 1:numel(bounds)
	if k != border
		row_size = rows(bounds{k});
		localMat = zeros(row_size - (2 * edgeLength),1);
		adjusted_row_size = row_size - (2 * edgeLength);
		if(adjusted_row_size > 0)
			globalTotal = globalTotal + adjusted_row_size;
		endif
		for(i = 1:1:adjusted_row_size)
			x1 = bounds{k}(i,1);
			y1 = bounds{k}(i,2);
			x2 = bounds{k}(i + edgeLength,1);
			y2 = bounds{k}(i + edgeLength,2);
			x3 = bounds{k}(i + (2* edgeLength),1);
			y3 = bounds{k}(i + (2* edgeLength),2);
			lA = sqrt(power((y2 - y1),2) + power((x2 - x1),2));
			lB = sqrt(power((y1 - y3),2) + power((x1 - x3),2));
			lC = sqrt(power((y3 - y2),2) + power((x3 - x2),2));
			numerator = lA * lB * lC;
			denominator = sqrt((lA + lB + lC) * (-lA + lB + lC) * (lA - lB + lC) * (lA + lB - lC));
			if(denominator > 0)
				radius = numerator/denominator;
			else
				radius = 0;
			endif
			if(radius < 1000)
				localMat(i,1) = radius;
			endif
		endfor
		globalMat(k,1) = sum(localMat);
	endif
endfor
f = sum(globalMat) / globalTotal;
endfunction

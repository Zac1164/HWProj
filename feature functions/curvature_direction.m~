function f = curvature_direction(im,edgeLength)
imbw = im2bw(im,graythresh(im));
bounds = bwboundaries (imbw);
max_rows = 0;
border = -1;

directionDistribution = zeros(1,8);

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
		for(i = 1:1:adjusted_row_size)
			x1 = bounds{k}(i,1);
			y1 = bounds{k}(i,2);
			x2 = bounds{k}(i + edgeLength,1);
			y2 = bounds{k}(i + edgeLength,2);
			x3 = bounds{k}(i + (2* edgeLength),1);
			y3 = bounds{k}(i + (2* edgeLength),2);
			# +y
			if (y2 > y1) && (y2 > y3)
				directionDistribution(1,1) = directionDistribution(1,1) + 1;
			# -y
			elseif (y2 < y1) && (y2 < y3)
				directionDistribution(1,5) = directionDistribution(1,5) + 1;
			# +x
			elseif (x2 > x1) && (x2 > x3)
				directionDistribution(1,3) = directionDistribution(1,3) + 1;
			# -x
			elseif (x2 < x1) && (x2 < x3)
				directionDistribution(1,7) = directionDistribution(1,7) + 1;
			# +x +y
			elseif (((x1 <= x2) && (x2 < x3)) || ((x1 < x2) && (x2 <= x3))) && (((y1 >= y2) && (y2 > y3)) || ((y1 > y2) && (y2 >= y3)))
				directionDistribution(1,2) = directionDistribution(1,2) + 1;
			# +x -y
			elseif (((x1 >= x2) && (x2 > x3)) || ((x1 > x2) && (x2 >= x3))) && (((y1 >= y2) && (y2 > y3)) || ((y1 > y2) && (y2 >= y3)))
				directionDistribution(1,4) = directionDistribution(1,4) + 1;
			# -x -y
			elseif (((x1 >= x2) && (x2 > x3)) || ((x1 > x2) && (x2 >= x3))) && (((y1 <= y2) && (y2 < y3)) || ((y1 < y2) && (y2 <= y3)))
				directionDistribution(1,6) = directionDistribution(1,6) + 1;
			# -x +y
			elseif (((x1 <= x2) && (x2 < x3)) || ((x1 < x2) && (x2 <= x3))) && (((y1 <= y2) && (y2 < y3)) || ((y1 < y2) && (y2 <= y3)))
				directionDistribution(1,8) = directionDistribution(1,8) + 1;
			endif
		endfor
	endif
endfor
sumDirections = sum(directionDistribution');
directionDistribution = directionDistribution ./ sumDirections(1,1);
f = directionDistribution;
endfunction

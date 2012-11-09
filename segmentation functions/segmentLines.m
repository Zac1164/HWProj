function f = segmentLines(im,folder)
imbw = imcomplement(im);
CCLabel = bwlabel(imbw,4);
#imshow(label2rgb(CCLabel));
modeMatrix = [];
for k = 1:1:columns(CCLabel)
	modeMatrix = [modeMatrix;CCLabel(:,k)];
endfor
modeMatrix;
white = mode(modeMatrix)
maxLabel = max(max(CCLabel))
compData = zeros(maxLabel,3);
for k = 1:1:maxLabel
	[r, c] = find(CCLabel == k);
	compData(k,1) = k;
	compData(k,2) = min(r);
	compData(k,3) = max(r);
	compData(k,4) = min(c);	
	compData(k,5) = max(c);	
endfor
lineQueue = [];
threshold = 0.65;
finalLineComps = [];
lines{1} = [];
lineCount = 1;
while(rows(compData) > 1)
	if(white != compData(1,1))
		lineQueue = compData(1,:);
		compData(1,:) = [];
	else
		lineQueue = compData(2,:);
		compData(2,:) = [];
	endif
	while(~isempty(lineQueue))
		iterations = rows(compData);
		count = 1;
		for k = 1:1:iterations
			if((compData(count,1) != white) && (compData(count,2) >= lineQueue(1,2)) && (compData(count,3) <= lineQueue(1,3)))
				lineQueue = [lineQueue; compData(count,:)];
				compData(count,:) = [];
			elseif((compData(count,1) != white) && (compData(count,2) <= lineQueue(1,2)) && (compData(count,3) >= lineQueue(1,3)))
				if((compData(count,3) - compData(count,2)) < (1 / threshold) * (lineQueue(1,3) - lineQueue(1,2)))
					lineQueue = [lineQueue; compData(count,:)];
					compData(count,:) = [];
				else
					count = count + 1;
				endif
			elseif((compData(count,1) != white) && (compData(count,2) <= lineQueue(1,2)) && (compData(count,3) <= lineQueue(1,3)) && (compData(count,3) >= lineQueue(1,2)))
				if(compData(count,3) - compData(count,2) != 0)			
					ratio = (lineQueue(1,2) - compData(count,3)) / (compData(count,3) - compData(count,2));
					ratio2 = (lineQueue(1,2) - compData(count,3)) / (lineQueue(1,3) - lineQueue(1,2));
					if((ratio >= threshold) || (ratio2 >= threshold))
						ratio
						ratio2
						lineQueue = [lineQueue; compData(count,:)];
						compData(count,:) = [];
					else
						count = count + 1;
					endif
				endif	
			elseif((compData(count,1) != white) && (compData(count,2) >= lineQueue(1,2)) && (compData(count,3) >= lineQueue(1,3)) && (compData(count,2) <= lineQueue(1,3)))
				if(compData(count,3) - compData(count,2) != 0)
					ratio = (compData(count,2) - lineQueue(1,3)) / (compData(count,3) - compData(count,2));
					ratio2 = (compData(count,2) - lineQueue(1,3)) / (lineQueue(1,3) - lineQueue(1,2));
					if((ratio >= threshold) || (ratio2 >= threshold))
						ratio
						ratio2
						lineQueue = [lineQueue; compData(count,:)];
						compData(count,:) = [];
					else
						count = count + 1;
					endif
				endif		
			else
				count = count + 1;
			endif
		endfor
		finalLineComps = [finalLineComps;lineQueue(1,:)];
		lineQueue(1,:) = [];
	endwhile
	lines{lineCount} = finalLineComps;
	finalLineComps = [];
	lineCount = lineCount + 1;
endwhile

imageHeight = rows(im);
imageWidth = columns(im);
spanReq = 0.5;
densityReq = 0.06;
for l = 1:1:columns(lines)
	newImage = zeros(imageHeight,imageWidth);
	lineData = lines{1,l};
	spanMax = max(lineData(:,5));
	spanMin = min(lineData(:,4));
	if (spanMax - spanMin) > (spanReq * imageWidth)
		for k = 1:1:rows(lineData)
			compNum = repmat(lineData(k,1),imageHeight,imageWidth);
			matched = (compNum == CCLabel);
			matched = matched .* imcomplement(im);
			newImage = newImage + matched;
		endfor
	trimMax = max(lineData(:,3));
	trimMin = min(lineData(:,2));
	newImage = newImage(trimMin:trimMax,:);
	numPix = (trimMax - trimMin) * imageWidth;
	numBlackPix = sum(sum(newImage));
	density = numBlackPix / numPix;
	newImage = imcomplement(newImage);
	save_location = strcat(folder,"/",num2str(l),".tif");
		if(density >= densityReq)
			imwrite(newImage,save_location);
		endif	
	endif
endfor
#zeroImage = zeros(imageHeight,imageWidth);
#newImage = (newImage > zeroImage);
#imshow(newImage)
f = lines;

endfunction

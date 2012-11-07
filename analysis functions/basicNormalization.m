function [f,g,h] = basicNormalization(folder,numClasses,data2)

count = 1;
currentClass = 0;

slant_location = strcat(folder,"/training/slant_data.txt");
skew_location = strcat(folder,"/training/skew_data.txt");
asc_vs_desc_location = strcat(folder,"/training/asc_vs_desc_data.txt");
curvature_location = strcat(folder,"/training/curvature_data.txt");
curvature_direction_location = strcat(folder,"/training/curvature_direction_data.txt");
slant_energy_location = strcat(folder,"/training/slant_energy_data.txt");
entropy_location = strcat(folder,"/training/entropy_data.txt");

load(slant_location);
load(skew_location);
load(asc_vs_desc_location);
load(curvature_location);
load(curvature_direction_location);
load(slant_energy_location);
load(entropy_location);

data = [data_slant, data_skew, data_asc, data_curv, data_curv_direct, data_slant_energy, data_entropy];

if(data2 == 0)
	data2 = data;
endif

numFeatures = columns(data2);

numExamplesPerClass = rows(data2) / numClasses;

means = zeros(numClasses,numFeatures);

lowerBound = 1;

upperBound = numExamplesPerClass;

maxData = max(data);
minData = min(data);

for j = 1:1:rows(data2)
	data2(j,:) = (data2(j,:) - minData) ./ (maxData - minData);
endfor

for j = 1:1:numClasses
	means(j,:) = mean(data2(lowerBound:upperBound,:));
	lowerBound = lowerBound + numExamplesPerClass;
	upperBound = upperBound + numExamplesPerClass;
endfor

data_class = zeros(numClasses,1);

for j = 1:1:numClasses
	data_class(j,1) = j;
endfor

count = 1;

for j = 1:1:numClasses
	for k = 1:1:numExamplesPerClass
		data_class2(count,1) = j;
		count = count + 1;
	endfor
endfor

f = [means,data_class];
g = [data2,data_class2];

endfunction

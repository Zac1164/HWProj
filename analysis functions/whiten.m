function f = whiten(folder,numClasses,numExamplesPerClass)

data_class = zeros(numClasses * numExamplesPerClass,1);
count = 1;
currentClass = 0;

for i = 1:1:numClasses
	for j = 1:1:numExamplesPerClass
		data_class(count,1) = currentClass;
		count = count + 1;
	endfor
	currentClass = currentClass + 1;
endfor

slant_location = strcat(folder,"/training/slant_data.txt");
skew_location = strcat(folder,"/training/skew_data.txt");
asc_vs_desc_location = strcat(folder,"/training/asc_vs_desc_data.txt");
curvature_location = strcat(folder,"/training/curvature_data.txt");

load(slant_location);
load(skew_location);
load(asc_vs_desc_location);
load(curvature_location);

f = [data_slant, data_skew, data_asc, data_curv, data_class];
endfunction

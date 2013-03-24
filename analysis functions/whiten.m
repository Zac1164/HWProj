function [a,b,c,d,f,g] = whiten(folder,numClasses)

count = 1;
currentClass = 0;

slant_location = strcat(folder,"/slant_data.txt");
skew_location = strcat(folder,"/skew_data.txt");
asc_vs_desc_location = strcat(folder,"/asc_vs_desc_data.txt");
curvature_location = strcat(folder,"/curvature_data.txt");
curvature_direction_location = strcat(folder,"/curvature_direction_data.txt");
slant_energy_location = strcat(folder,"/slant_energy_data.txt");
entropy_location = strcat(folder,"/entropy_data.txt");

load(slant_location);
load(skew_location);
load(asc_vs_desc_location);
load(curvature_location);
load(curvature_direction_location);
load(slant_energy_location);
load(entropy_location);

data = [data_slant, data_skew, data_asc, data_curv, data_curv_direct, data_slant_energy, data_entropy];

numFeatures = columns(data);

numExamplesPerClass = rows(data) / numClasses;

means = zeros(numClasses,numFeatures);

lowerBound = 1;

upperBound = numExamplesPerClass;

covMatrix = zeros(numFeatures, numFeatures);

for j = 1:1:numClasses
	covMatrix = covMatrix + cov(data(lowerBound:upperBound,:));
	means(j,:) = mean(data(lowerBound:upperBound,:));
	lowerBound = lowerBound + numExamplesPerClass;
	upperBound = upperBound + numExamplesPerClass;
endfor

covMatrix = covMatrix ./ numClasses;

[eigenVector, eigenValues] = eig(covMatrix);

transformW = eigenVector * diag(diag(eigenValues .^ (-.5)));

data_class = zeros(numClasses,1);

for k = 1:1:numClasses
	data_class(k,1) = k;
endfor

count = 1;

for k = 1:1:numClasses
	for l = 1:1:numExamplesPerClass
		data_class2(count,1) = k;
		count = count + 1;
	endfor
endfor

a = transformW;
b = means;
c = means * transformW;
d = data;
f = data * transformW;
g = [data * transformW,data_class2];


endfunction

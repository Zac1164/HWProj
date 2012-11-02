function f = nearestNeighbor(means,data)

numFeatures = columns(means) - 1;
dataManipulation = means(:,1:numFeatures);

for j = 1:1:numFeatures
	dataManipulation(:,j) = dataManipulation(:,j) - data(1,j);
endfor

dataManipulation = dataManipulation .^ 2;

dataManipulation = dataManipulation';

dataManipulation = sum(dataManipulation)';

minLoc = find(dataManipulation(:,1) == min(dataManipulation(:,1)));

f = means(minLoc,numFeatures + 1);
endfunction

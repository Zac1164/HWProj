function f = distance(data,c1,c2)

numFeatures = columns(data);
data1 = data(c1,:);
data2 = data(c2,:);

for j = 1:1:numFeatures
	dataManipulation = data1 - data2;
endfor

dataManipulation = dataManipulation .^ 2;

dataManipulation = dataManipulation';

dataManipulation = sum(dataManipulation)';

dataManipulation = real(sqrt(dataManipulation));

f = dataManipulation;

endfunction

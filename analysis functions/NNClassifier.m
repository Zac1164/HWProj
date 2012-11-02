function [f,g] = NNClassifier(folder,numClasses)

[transformW, means] = whiten(folder,numClasses);
data = getTestData(folder);
transformedData = data * transformW;

sizeData = rows(data);
NN = zeros(sizeData,1);

for i = 1:1:sizeB
	NN(i) = nearestNeighbor3D(A,B,i);
endfor
#C = load("labelled_test_1.txt");
#D = NN == C;
#percent_correct = sum(D) / rows(D)

f = transformedData;
g = 0;

endfunction

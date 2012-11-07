function f = cleanData(means,training,numClasses)

sizeData = rows(training);
NN = zeros(sizeData,1);

trueClass = training(:,columns(training));

for j = 1:1:sizeData
	NN(j) = nearestNeighbor(means,training(j,:),numClasses,1);
endfor

f = training(1,:);

for k = 1:1:sizeData
	if (NN(k) == trueClass(k))
		f = [f;training(k,:)];
	endif
endfor

f = f(2:rows(f),:);

endfunction

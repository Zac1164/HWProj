function generateLabels(numClasses,numExamples,folder)

save_location = strcat(folder,"/true_class_data.txt");

count = 1;
label = 1;
data_class = zeros(numClasses*numExamples, 1);

for j = 1:1:numClasses
	for k = 1:1:numExamples
		data_class(count) = j;
		count = count + 1;
	endfor
	label = label + 1;
endfor

save(save_location,"data_class");

endfunction

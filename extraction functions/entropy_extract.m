function entropy_extract(file,folder)

fid = fopen(file);
count = 1;
while !feof(fid)
	fgetl(fid);
	count = count + 1;
endwhile
count = count - 1;
data_entropy = zeros(count,1);
fclose(fid);

fid = fopen(file);
count = 1;
while !feof(fid)
	im = imread(fgetl(fid));
	data_entropy(count,1) = entropy(im);
	count = count + 1;
endwhile
save_location = strcat(folder,"/entropy_data.txt");
save(save_location,"data_entropy");
fclose(fid);

endfunction

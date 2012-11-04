function skew_extract(file,folder)

fid = fopen(file);
count = 1;
while !feof(fid)
	fgetl(fid);
	count = count + 1;
endwhile
count = count - 1;
data_skew = zeros(count,1);
fclose(fid);

fid = fopen(file);
count = 1;
while !feof(fid)
	im = imread(fgetl(fid));
	data_skew(count,1) = skew(im);
	count = count + 1;
endwhile
save_location = strcat(folder,"/skew_data.txt");
save(save_location,"data_skew");
fclose(fid);

endfunction

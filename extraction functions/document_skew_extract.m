function document_skew_extract(file,folder)

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
	imbw = imcomplement(im);
	data_skew(count,1) = document_skew(imbw);
	count = count + 1;
endwhile
save_location = strcat(folder,"/skew_data.txt");
save(save_location,"data_skew");
fclose(fid);

endfunction

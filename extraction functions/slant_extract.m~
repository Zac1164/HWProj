function slant_extract(file,folder)

fid = fopen(file);
count = 1;
while !feof(fid)
	fgetl(fid);
	count = count + 1;
endwhile
count = count - 1;
data_slant = zeros(count,3);
fclose(fid);

fid = fopen(file);
count = 1;
while !feof(fid)
	im = imread(fgetl(fid));
	temp = slant(im);
	data_slant(count,:) = temp(1,:);
	count = count + 1;
endwhile
save_location = strcat(folder,"/slant_data.txt");
save(save_location,"data_slant");
fclose(fid);

endfunction

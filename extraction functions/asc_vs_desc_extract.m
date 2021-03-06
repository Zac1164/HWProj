function asc_vs_desc_extract(file,folder)

skew_location = strcat(folder,"/skew_data.txt");

load(skew_location);

data_asc = zeros(rows(data_skew),1);

fid = fopen(file);
count = 1;
while !feof(fid)
	im = imread(fgetl(fid));
	data_asc(count,1) = asc_vs_desc(im,data_skew(count,1));
	count = count + 1;
endwhile
save_location = strcat(folder,"/asc_vs_desc_data.txt");
save(save_location,"data_asc");
fclose(fid);

endfunction

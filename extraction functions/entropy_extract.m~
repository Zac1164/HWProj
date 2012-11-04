function curvature_extract(file,folder)

fid = fopen(file);
count = 1;
while !feof(fid)
	fgetl(fid);
	count = count + 1;
endwhile
count = count - 1;
data_curv = zeros(count,1);
fclose(fid);

fid = fopen(file);
count = 1;
while !feof(fid)
	im = imread(fgetl(fid));
	data_curv(count,1) = curvature(im,5);
	count = count + 1;
endwhile
save_location = strcat(folder,"/curvature_data.txt");
save(save_location,"data_curv");
fclose(fid);

endfunction

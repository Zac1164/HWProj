function curvature_direction_extract(file,folder)

fid = fopen(file);
count = 1;
while !feof(fid)
	fgetl(fid);
	count = count + 1;
endwhile
count = count - 1;
data_curv_direct = zeros(count,8);
fclose(fid);

fid = fopen(file);
count = 1;
while !feof(fid)
	im = imread(fgetl(fid));
	temp = curvature_direction(im,5);
	data_curv_direct(count,:) = temp(1,:);
	count = count + 1;
endwhile
save_location = strcat(folder,"/curvature_direction_data.txt");
save(save_location,"data_curv_direct");
fclose(fid);

endfunction

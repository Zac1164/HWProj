function slant_energy_extract(file,folder)

slant_location = strcat(folder,"/slant_data.txt");

load(slant_location);

data_slant_energy = zeros(rows(data_slant),1);

fid = fopen(file);
count = 1;
while !feof(fid)
	im = imread(fgetl(fid));
	data_slant_energy(count,1) = slant_energy(im,data_slant(count,1));
	count = count + 1;
endwhile
save_location = strcat(folder,"/slant_energy_data.txt");
save(save_location,"data_slant_energy");
fclose(fid);

endfunction

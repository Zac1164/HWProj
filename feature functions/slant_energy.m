function f = slant_energy(im,slant)
#im = imrotate(im,slant,"bilinear","loose",255);
if ~isbw(im)
	im = imcomplement(im2bw(im,graythresh(im)));
else
	im = imcomplement(im);
endif
slope = -1 / tan(1.57 - slant);
im = imshear(im,'x',slope,'loose');
energy = sum(im) .^ 2;
peak = find( diff( sign( diff([0; energy(:); 0]) ) ) < 0 );
valley = find( diff( sign( diff([0; energy(:); 0]) ) ) > 0 );
energy2 = zeros(rows(peak),1);
energy2(:,1) = energy(peak(:));
energy3 = zeros(rows(valley),1);
energy3(:,1) = energy(valley(:));
energy = sum(energy2);
energy4 = sum(energy3);
f = energy - energy4;

endfunction

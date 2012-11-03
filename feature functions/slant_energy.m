function f = slant_energy(im,slant)
#im = imrotate(im,slant,"bilinear","loose",255);
im = imcomplement(im2bw(im,graythresh(im)));
slope = -1 / tan(1.57 - slant);
im = imshear(im,'x',slope,'loose');
energy = sum(im) .^ 2;
peak = find( diff( sign( diff([0; energy(:); 0]) ) ) < 0 );
f = peak;
energy2 = zeros(rows(peak),1);
energy2(:,1) = energy(peak(:));
energy = sum(energy2);
f = energy;

endfunction

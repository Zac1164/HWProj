function f = skew_energy(imbw,skew)

imbw2 = imrotate(imbw,skew,"bilinear","loose",255);
imbw = imrotate(imbw,90 + skew,"bilinear","loose",255);
energy = sum(imbw) .^ 2;
imshow(imbw2);
print('skew1.png');
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

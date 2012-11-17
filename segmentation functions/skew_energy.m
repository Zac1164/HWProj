function f = skew_energy(imbw,skew)

imbw = imrotate(imbw,90 + skew,"bilinear","loose",0);
energy = sum(imbw) .^ 2;
peak = find( diff( sign( diff([0; energy(:); 0]) ) ) < 0 );
f = peak;
energy2 = zeros(rows(peak),1);
energy2(:,1) = energy(peak(:));
energy = sum(energy2);
f = energy;

endfunction

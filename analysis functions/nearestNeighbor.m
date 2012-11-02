function f = nearestNeighbor3D(A,B,index)
Bx = B(index,1);
By = B(index,2);
Bz = B(index,3);
BxExpanded = repmat(Bx,rows(A),1);
ByExpanded = repmat(By,rows(A),1);
BzExpanded = repmat(Bz,rows(A),1);
C = [A(:,1) - BxExpanded, A(:,2) - ByExpanded, A(:,3) - BzExpanded];
C = C .* C;
D = C(:,1) + C(:,2) + C(:,3);
D = sqrt(D);
minLoc = find(D(:,1) == min(D(:,1)));
f = A(minLoc,4);

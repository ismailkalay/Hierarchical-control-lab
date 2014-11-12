%number 233  path=78m 2-1-3-1-2-5 ,if begins with 1 = '324236'
%lab5 Full-inspection method
clc;clear; 
A1 = [31 27 21 89 72 51 45];
A2 = [75 65 23 43 80 15 93
      23 42 26 95 34 96 37
      75 21 90 42 76 72 17
      81 30 48 44 21 84 98
      12 52 5 20 23 3 82
      51 50 53 57 85 46 26
      35 48 43 27 67 52 53];

A3 = [4 85 9 63 2 67 54
      30 90 60 4 23 98 43
      71 41 55 84 22 76 47
      5 77 52 96 96 40 48
      58 1 96 86 96 71 31
      1 60 53 17 70 16 94
      63 29 11 77 43 12 14];

A4 = [23 56 46 91 77 23 11
      32 71 33 39 74 72 91
      18 95 30 2 28 39 27
      76 0 67 85 87 88 52
      54 39 66 41 65 7 13
      32 99 13 73 92 50 64
      12 90 55 8 74 75 50];

A5 = [30 21 26 11 55 51 92
      57 25 12 26 36 90 41
      85 51 69 4 17 32 83
      14 21 71 9 50 40 53
      16 70 64 42 45 22 42
      9 24 78 83 0 89 32
      15 74 3 81 2 72 79];

A6 = [80 67 41 11 64 88 50
      80 81 91 50 98 29 28
      61 65 14 83 94 6 92
      1 25 46 99 45 59 38
      6 21 62 60 44 6 63
      68 67 95 12 78 87 60
      29 54 90 14 92 51 14];

A7 = [38
      80
      18
      98
      24
      14
     56];
shortest=A1(3)+A2(3,2)+A3(2,4)+A4(4,2)+A5(2,3)+A6(3,6)+A7(6);
tStartfi = tic; 
paths=[];
sumindex={};
% sindex={};
for i=1:size(A2,2)
 for j=1:size(A2,2)
  for k=1:size(A2,2)
   for l=1:size(A2,2)
    for m=1:size(A2,2)
     for n=1:size(A2,2)
      sum(m,n)=A1(i)+A2(i,j)+A3(j,k)+A4(k,l)+A5(l,m)+A6(m,n)+A7(n);
      sindex(m,n)= cellstr(sprintf('%d%d%d%d%d%d',i,j,k,l,m,n));
      end
    end
    paths = [paths; sum];sumindex = [sumindex; sindex];
   end
  end
 end
end
[shortpaths,indexm] = min(paths,[],1);
[spath,indexn] = min(shortpaths);
indexm=indexm(indexn);
% size(paths,1)
spath
pathno=sumindex(indexm,indexn)
tElapsedfullinsp = toc(tStartfi)

%Lab5 dynamic programming method
tStartdynamic = tic;
 for i=1:7
 Lb(i)=A1(i);end
for j=1:7
for i=1:7
 Lc(i,j)=Lb(i)+A2(i,j);end 
end
Lcshort = min(Lc,[],1); % each column
for j=1:7
for i=1:7
Ld(i,j) = Lcshort(i)+ A3(i,j);end
end
Ldshort = min(Ld,[],1); 
for j=1:7
for i=1:7
Le(i,j) = Ldshort(i)+ A4(i,j);end
end
Leshort = min(Le,[],1); 
for j=1:7
for i=1:7
Lf(i,j) = Leshort(i)+ A5(i,j);end
end
Lfshort = min(Lf,[],1);
for j=1:7
for i=1:7
Lg(i,j) = Lfshort(i)+ A6(i,j);end
end
Lgshort = min(Lg,[],1);
for j=1:size(A3,1)
  Lh(j) = Lgshort(j) + A7(j);
end
shortestpath = min(Lh,[],2)%min each row
tElapseddynamic = toc(tStartdynamic)
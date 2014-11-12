%lab5 example  Full-inspection method
clc;clear;A1 = [3 4 5];A2 =[2 7;3 2;4 5];A3 =[3;2];
tStartfi = tic; 
for j=1:size(A2,1)
   for k=1:size(A2,2)
     sum(j,k)=A1(j)+A2(j,k)+A3(k);      
   end
end   
   sum
   tElapsedfullinsp = toc(tStartfi)
% Lab5 example dynamic programming method
tStartdynamic = tic;
  for j=1:size(A1,2)
     LB(j)=A1(j);      
  end
  for j=1:size(A3,1)
  for i=1:size(A2,1)
    LC(j,i)=LB(i)+A2(i,j);
  end
  end
  LCshort = min(LC,[],2); %min each row   
for j=1:size(A3,1)
  LD(j) = LCshort(j) + A3(j);
end
LDshort = min(LD,[],2) %min each row
tElapseddynamic = toc(tStartdynamic)



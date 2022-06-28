clear 
N = 100000; 
r = ceil(rand(N,1)*3); 
t = [0 0 ; 1 0; 1/2 sqrt(3)/2]
p(N,2) = 0; % start at [0,0]
for n = 1 : N - 1 
    p(n+1,:) = (t(r(n),:) + p(n,:))/2; % go midway between point chosen at random 
end 
plot(p(:,1),p(:,2), '.'); 
axis equal; 


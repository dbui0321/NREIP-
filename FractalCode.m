clear 
[x,y] = meshgrid(-2:0.001:2); % meshgrid between -2 and 2 
 %[x,y] = meshgrid(.2:0.0001:.6); 
c = x + 1i*y; % define c at each point 
z = zeros(size(c)); % z is zero initially at every point 
%% This is just to test something $$ 
for n = 1:100 
    z = z.^2 + c; 
      spy(abs(z)<2); 
    imagesc(abs(z), [0 2]); 
    axis equal off; 
    drawnow; 
    % pause(1) 
end 

function [dir] = point2dir(ri,ci,rf,cf)
% Written by Turan Mehmet Yaþar @ 15.06.2020

%      this auxilary function decides direction of the target position from the initial position. 
%   we can determine which quadrant of cartesian coordinate, the target is
%   at, by taking (ri,ci) as the origin ;

%      function takes initial position and target position as arguments.

 
if rf < ri & cf > ci
    dir = 1 ; % quadrant I
elseif rf < ri & cf < ci
    dir = 2 ; % quadrant II
elseif rf > ri & cf < ci
    dir = 3 ; % quadrant III
else
    dir = 4 ; % quadrant IV
end
end


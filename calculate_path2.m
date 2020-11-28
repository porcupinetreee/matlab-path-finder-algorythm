function roadMap = calculate_path2(M,ri,ci,V)
% Version-2 of path calculating function. 
% Written by Turan Mehmet Yaþar @ 16.06.2020
% auxilary function called point2dir.m is used.

%   calibrating inputs given by the lecturer. 
% this function works with input configurations like (rows, coloumns). Not (x,y) or (coloumns, rows) !!!
% 0's for space 1's for obstagles. 
M = M';
M = ~M;
% given b vector is in form of (x,y), we need to convert it to (rows, coloumns)
rf = V(2);
cf = V(1);
if M(rf, cf) ~= 1
    %   step size is important parameter to find shorter path. 
    % if this parameter is not configured well, robot will find still a good
    % path but it would not be the shortest.
    % Configuring the step size is done by looking the map by designer himself.
    % Step size determines how long the robot sees its forward.
    step_size = 1;
    step_size_f = 0;
    %%

    dir = point2dir(ri,ci,rf,cf) % finds direction of target based on position of the robot.
    roadMap = zeros(100,200); % displays road taken by the robot.
    blank = zeros(100,200); % blank matrix.
    t0 = clock; % timer

    %% PROCESSING
    while(etime(clock, t0) < 5) % do for 5 secs
        dir = point2dir(ri,ci,rf,cf)
        pause(0.05)
        display('Processing...')
        %% quadrant I
       if dir == 1
           while ci ~= cf
               if M(ri,ci+step_size) ~= 1
                   ci = ci + 1;
                   roadMap(ri,ci) = 0.5;
               else
                   if M(ri-step_size,ci) ~= 1
                       ri = ri + 1;
                       roadMap(ri,ci) = 0.5;
                   else
                       break
                   end
               end
           end
           while ri ~= rf
               if M(ri-step_size,ci) ~= 1
                   ri = ri - 1;
                   roadMap(ri,ci) = 0.5;
               else
                   if M(ri,ci-step_size) ~= 1
                       ci = ci - 1;
                       roadMap(ri,ci) = 0.5;
                   else
                       break
                   end
               end
           end

       end


       %% quadrant II
       if dir == 2
           while ci ~= cf
               if M(ri,ci-step_size) ~= 1
                   ci = ci - 1;
                   roadMap(ri,ci) = 1;
               else
                   if M(ri-step_size,ci) ~= 1
                       ri = ri - 1;
                       roadMap(ri,ci) = 1;
                   else
                       break
                   end
               end
           end

           while ri ~= rf
               if M(ri-5-step_size,ci) ~= 1
                   ri = ri - 1;
                   roadMap(ri,ci) = 1;
               else
                   if M(ri,ci+step_size) ~= 1
                       ci = ci + 1;
                       roadMap(ri,ci) = 1;
                   else
                       break
                   end
               end
           end

       end




       %% quadrant III
          if dir == 3
           while ci ~= cf
               if M(ri,ci-step_size) ~= 1
                   ci = ci - 1;
                   roadMap(ri,ci) = 1;
               else
                   if M(ri+step_size,ci) ~= 1
                       ri = ri + 1;
                       roadMap(ri,ci) = 1;
                   else
                       break
                   end
               end
           end

           while ri ~= rf
               if M(ri+step_size,ci) ~= 1
                   ri = ri + 1;
                   roadMap(ri,ci) = 1;
               else
                   if M(ri,ci+step_size) ~= 1
                       ci = ci + 1;
                       roadMap(ri,ci) = 1;
                   else
                       break
                   end
               end
           end

          end


          %% quadrant IV

           if dir == 4
           while ci ~= cf
               if M(ri,ci+step_size) ~= 1
                   ci = ci + 1;
                   roadMap(ri,ci) = 1;
               else
                   if M(ri+step_size,ci) ~= 1
                       ri = ri + 1;
                       roadMap(ri,ci) = 1;
                   else
                       break
                   end
               end
           end

           while ri ~= rf
               if M(ri+step_size,ci) ~= 1
                   ri = ri + 1;
                   roadMap(ri,ci) = 1;
               else
                   if M(ri,ci-step_size) ~= 1
                       ci = ci - 1;
                       roadMap(ri,ci) = 1;
                   else
                       break
                   end
               end
           end

       end
    end
    display('Done!')
    roadMap = imfuse(M,roadMap);
    imshow(roadMap);

    % if dir == 3
    %     while xi ~= xf && yi ~= yf
    %         while xi ~= xf
    %             if M(xi+1,yi) ~= 1
    %                 roadMap(xi,yi) = 1;
    %                 xi = xi + 1;
    %                 
    %                 A = 3
    %             else
    %                 while yi ~= yf
    %                     if M(xi,yi-1) ~= 1
    %                         yi = yi - 1
    %                         roadMap(xi,yi) = 1;
    %                         B = 3
    %                     end
    %                 end
    %             end
    %         end
    %     end
    %     roadMap
    % end
    % 
    % 
else
    display('Invalid target position!')
end

if (ri ~= rf) & (ci ~= cf)
    display('Algoryhtm could not find a way to the target.')
end



end


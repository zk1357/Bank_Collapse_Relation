%--------------------------------------------------------------------------
%   This code output kml data from google earth 
%--------------------------------------------------------------------------
    clear all
    close all
%--------------------------------------------------------------------------
%   Initial Data
%--------------------------------------------------------------------------
    Number = 113;
    rc = zeros(Number,2); N = 1; % point number of outer and inner bank line from google earth
    
    for i = 1:1:100
        Directory = strcat('C',num2str(i),'-1.kml');
        % This function is from Amy Farris (2022). read_kml 
        % (https://www.mathworks.com/matlabcentral/fileexchange/13026-read_kml), MATLAB Central File Exchange. 
        [a] = read_kml(Directory); 
        rc(N,1) = size(a,1);
        
        Directory = strcat('C',num2str(i),'-2.kml');
        [b] = read_kml(Directory);
        rc(N,2) = size(b,1);
        
        N = N + 1;
        clear a b
        
    end

    for i = 1:1:1
        Directory = strcat('END1.kml');
        [a] = read_kml(Directory);
        rc(N,1) = size(a,1);
        
        Directory = strcat('END2.kml');
        [b] = read_kml(Directory);
        rc(N,2) = size(b,1);
        
        N = N + 1;
        clear a b
        
    end    
    
    for i = 1:1:12
        Directory = strcat('S1.kml');
        Directory = strcat('S',num2str(i),'.kml');
        [a] = read_kml(Directory);
        rc(N,1) = size(a,1);
        rc(N,2) = NaN;
        
        N = N + 1;
        clear a
        
    end 
    
    % read x/y coordinates of outer and inner bank line from google earth
    % WGS_1984_UTM_Zone_20S
    arr = xlsread('UTM Coordinates.xlsx');
    
    % x/y coordinates for each bend
    data = cell(1,Number); s = 1; 
    for i = 1:1:Number
       if rc(i,2) > 0 
           data{1,i}(1:rc(i,1),1) = arr(s:s+rc(i,1)-1,4); 
           data{1,i}(1:rc(i,1),2) = arr(s:s+rc(i,1)-1,5); s = s + rc(i,1);

           data{1,i}(1:rc(i,2),3) = arr(s:s+rc(i,2)-1,4); 
           data{1,i}(1:rc(i,2),4) = arr(s:s+rc(i,2)-1,5); s = s + rc(i,2);
       else
           data{1,i}(1:rc(i,1),1) = arr(s:s+rc(i,1)-1,4); 
           data{1,i}(1:rc(i,1),2) = arr(s:s+rc(i,1)-1,5); 

           data{1,i}(1:rc(i,1),3) = arr(s:s+rc(i,1)-1,4); 
           data{1,i}(1:rc(i,1),4) = arr(s:s+rc(i,1)-1,5);s = s + rc(i,1);
%            rc(i,2) = rc(i,1);
       end
    end
    
    % Show the oxbow lakes
    scatter(arr(:,4),arr(:,5)); axis equal
    
%--------------------------------------------------------------------------
%   Data output
%--------------------------------------------------------------------------    
    save('Field cutoff data.mat','data','rc');
    % data: X/Y Coordinates of oxbow lakes
    % rc: point number of left and right banks of oxbow lakes
    
    

    
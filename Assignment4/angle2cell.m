% function i = angle2cell(angle, min, max, n)
% Converts an angle into a cell value, given the minimum, maximum angles
% and number of cells.
function i = angle2cell(angle, min, max, n)
    if(angle < min || angle > max), error('angle2cell: angle out of range'); end
    i = round((angle - min) / (max - min) * (n - 1) + 1);  
end


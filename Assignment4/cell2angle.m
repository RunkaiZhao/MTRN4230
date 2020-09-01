% function angle = cell2angle(i, min, max, n)
% Converts a cell value into an angle, given the minimum, maximum angles
% and number of cells.
function angle = cell2angle(i, min, max, n)
    if(i < 1 || i > n), error('cell2angle: cell out of range'); end
    angle = (i - 1) / (n- 1) * (max - min) + min;
end


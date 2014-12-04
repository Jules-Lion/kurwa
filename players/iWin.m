
function b = iWin(board, color, time)
    addpath(['players' filesep 'iWin']);

    disp([time]);
    
    if (time <= 15) 
        depth = 2;
    elseif (time <= 30)
        depth = 3;
    elseif (time <= 60)
        depth = 4;
    elseif (time <= 120) 
        depth = 5;
    elseif (time <= 180)
        depth = 6;
    end
            
    [val, b] = MiniMax(board, depth, color, -inf, inf);

end
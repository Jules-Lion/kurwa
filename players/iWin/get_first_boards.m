function firstboards = get_first_boards(board)
disp('22222')
%Spieler 1. 1 Moeglichkeit von 1 board Gegner (erster Spielzug Gegner) 
board1_11 = [0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0;
             0 0 -1 -1 -1 0 0 0; 0 0 0 -1 1 0 0 0; 0 0 0 0 0 0 0 0;
             0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];
board1_12 = [0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0;
             0 0 -1 -1 -1 0 0 0; 0 0 1 -1 1 0 0 0; 0 0 0 -1 0 0 0 0;
             0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];
board1_13 = [0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 1 0 0 0 0 0;
             0 0 1 1 -1 0 0 0; 0 0 1 -1 -1 0 0 0; 0 0 0 -1 -1 0 0 0;
             0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];
     
% erster Spielzueg
if (board == board1_11)
    firstboards = [0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0;
         0 0 -1 -1 -1 0 0 0; 0 0 1 1 1 0 0 0; 0 0 0 0 0 0 0 0;
         0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];
elseif (board == board1_12)
    firstboards = [0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 1 0 0 0 0 0;
             0 0 1 1 -1 0 0 0; 0 0 1 -1 1 0 0 0; 0 0 0 -1 0 0 0 0;
             0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];
elseif (board == board1_13)
    firstboards = [0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0; 0 0 1 0 0 0 0 0;
             0 0 1 1 -1 0 0 0; 0 0 1 1 1 1 0 0; 0 0 0 -1 -1 0 0 0;
             0 0 0 0 0 0 0 0; 0 0 0 0 0 0 0 0];
         
end
    










end
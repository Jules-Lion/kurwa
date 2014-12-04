function [value] = evaluation(board, color, moves_list)

%% Initialize valueTable
    valueTable = [  99,  -8,  8,  6,  6,  8,  -8, 99;
                    -8, -24, -4, -3, -3, -4, -24, -8;
                     8,  -4,  7,  4,  4,  7,  -4,  8;
                     6,  -3,  4,  0,  0,  4,  -3,  6;
                     6,  -3,  4,  0,  0,  4,  -3,  6;
                     8,  -4,  7,  4,  4,  7,  -4,  8;
                    -8, -24, -4, -3, -3, -4, -24, -8;
                    99,  -8,  8,  6,  6,  8,  -8, 99];
                
    value = 0;
    eigSteine = 0;
    gegSteine = 0;
                         
% %% Stabile Felder
% 
%     if(board(1,1)==color)
% 		valueTable(1,2)=8;
% 		valueTable(2,1)=8;
% 		valueTable(2,2)=7;
% 	end
% 
% 	if(board(1,8)==color)
% 		valueTable(1,7)=8;
% 		valueTable(2,8)=8;
% 		valueTable(2,7)=7;
% 	end
% 
% 	if(board(8,1)==color)
% 		valueTable(7,1)=8;
% 		valueTable(8,2)=8;
% 		valueTable(7,2)=7;
% 	end
% 
% 	if(board(8,8)==color)
% 		valueTable(7,8)=8;
% 		valueTable(8,7)=8;
% 		valueTable(7,7)=7;
%     end

%% Final evaluation

	for i=1:8
        for j=1:8
            if (board(i,j) == color)
                value = value + valueTable(i,j);
                eigSteine = eigSteine + 1;
            elseif (board(i,j) == -color)
                value = value - valueTable(i,j);
                gegSteine = gegSteine +1;
            end 
            

                
        end
    end
end

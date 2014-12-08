function score = evaluation(board, color, moves_list)

%% Initialize valueTable
    valueTable =       [   20, -3, 11,  8,  8, 11, -3, 20;
                           -3, -7, -4,  1,  1, -4, -7, -3;
                           11, -4,  2,  2,  2,  2, -4, 11;
                            8,  1,  2, -3, -3,  2,  1,  8;
                            8,  1,  2, -3, -3,  2,  1,  8;
                           11, -4,  2,  2,  2,  2, -4, 11;
                           -3, -7, -4,  1,  1, -4, -7, -3;
                           20, -3, 11,  8,  8, 11, -3, 20];



                
                
    %Richtungen definieren
    Rx = [-1, -1, 0, 1, 1, 1, 0, -1];
    Ry = [0, 1, 1, 1, 0, -1, -1, -1];
    value = 0;
    eigSteine = 0;
    gegSteine = 0;
    eigRandSteine = 0;
    gegRandSteine = 0;


    % Statische Bewertung des Boards: einzelne felder werden statisch
    % gewichtet. Zb sind eckfelder wertvoll, felder die an eckfelder
    % angrenzen sind schlecht. Weiterhin wird hier die anzahl der
    % eingenommenen steine bewertet. Viele steine sind gut, greedy ansatz.
    % Beide evaluationsmethoden werden nur schwach bewertet.
	for i=1:8
        for j=1:8
            if (board(i,j) == color)
                value = value + valueTable(i,j);
                eigSteine = eigSteine + 1;
            elseif (board(i,j) == -color)
                value = value - valueTable(i,j);
                gegSteine = gegSteine +1;
            end 
            
            if (board(i,j) ~= 0)  % stabilitätskriterium sind die randsteine.
                for k=1:8
                    x = i + Rx(k);
                    y = j + Ry(k);
                    if ((x >= 1) && (x <= 8) && (y >= 1) && (y <= 8) && (board(x,y)==0))
                        if (board(i,j) == color)
                            eigRandSteine = eigRandSteine +1;
                        else
                            gegRandSteine = gegRandSteine +1;
                        
                        end % if (board(i,j) == color)
                        break;
                    end % if
                end % for k=1:8
            end % if (board(i,j) ~= 0)
        end % for j=1:8
    end %for i=1:8
 
    % Steindifferenz berechnen
    if(eigSteine > gegSteine)
		piece_diff = (100.0 * eigSteine)/(eigSteine + gegSteine);
    elseif(eigSteine < gegSteine)
		piece_diff = -(100.0 * gegSteine)/(eigSteine + gegSteine);
	else piece_diff = 0;
    end % if (eigSteine > gegSteine)

    % Randsteine berechnen: randsteine sind steine, an die leere felder
    % angrenzen, das bedeutet, dass sie einnehmbar sind. Viele eigene
    % randsteine werden negativ bewertet. Randsteine vertritt das
    % Stabilitätskriterium. Wenige Randsteine machen den spieler nur
    % schwierig angreifbar.
    
	if(eigRandSteine > gegRandSteine)
		rand_Steine = -(100.0 * eigRandSteine)/(eigRandSteine + gegRandSteine);
    elseif(eigRandSteine < gegRandSteine)
		rand_Steine = (100.0 * gegRandSteine)/(eigRandSteine + gegRandSteine);
    else
        rand_Steine = 0;
    end % if (eigRandSteine > gegRandSteine)
    
    % Eckfelder berechnen: die einnahme von ecksteinen wird stark positiv
    % bewertet. 
    eigSteine = 0;
    gegSteine = 0;
	if(board(1,1) == color) 
        eigSteine = eigSteine +1;
    elseif(board(1,1) == -color) 
        gegSteine = gegSteine+1;
    end
	if(board(1,8) == color) 
        eigSteine = eigSteine+1;
    elseif(board(1,8) == -color) 
        gegSteine = gegSteine+1;
    end
	if(board(8,1) == color) 
        eigSteine = eigSteine+1;
    elseif(board(8,1) == +color) 
        gegSteine = gegSteine+1;
    end
	if(board(8,8) == color) 
        eigSteine = eigSteine+1;
    elseif(board(8,8) == -color) 
        gegSteine = gegSteine+1;
    end
    
	corners = 25 * (eigSteine - gegSteine);

    % corner closeness: die felder, die an ecksteine grenzen werden negativ
    % bewertet. Wenn der spieler sie einnimmt wird dies negativ bewertet,
    % wenn der gegner sie einnimmt wird dies positiv bewertet.
	eigSteine = 0;
    gegSteine = 0;
    
	if(board(1,1) == 0)
		if(board(1,2) == color) 
            eigSteine = eigSteine+1;
        elseif(board(1,2) == -color) 
            gegSteine = gegSteine+1;
        end % if(board(1,2) == color) 
		if(board(2,2) == color) 
            eigSteine = eigSteine+1;
        elseif(board(2,2) == -color) 
            gegSteine = gegSteine+1;
        end % if(board(2,2) == color) 
		if(board(2,1) == color) 
            eigSteine = eigSteine+1;
        elseif(board(2,1) == -color) 
            gegSteine = gegSteine+1;
        end %if(board(2,1) == color)
    end % if (board(1,1) == 0)
    
    if(board(1,8) == 0)
		if(board(1,7) == color) 
            eigSteine = eigSteine+1;
        elseif(board(1,7) == -color) 
            gegSteine = gegSteine+1;
        end % if(board(1,7) == color) 
		if(board(2,7) == color) 
            eigSteine = eigSteine+1;
        elseif(board(2,7) == -color) 
            gegSteine = gegSteine+1;
        end % if(board(2,7) == color) 
		if(board(2,8) == color) 
            eigSteine = eigSteine+1;
        elseif(board(2,8) == -color) 
            gegSteine = gegSteine+1;
        end %if(board(2,8) == color)
    end % if (board(1,8) == 0)
    
    if(board(8,1) == 0)
		if(board(8,2) == color) 
            eigSteine = eigSteine+1;
        elseif(board(8,2) == -color) 
            gegSteine = gegSteine+1;
        end % if(board(8,2) == color) 
		if(board(7,2) == color) 
            eigSteine = eigSteine+1;
        elseif(board(7,2) == -color) 
            gegSteine = gegSteine+1;
        end % if(board(7,2) == color) 
		if(board(7,1) == color) 
            eigSteine = eigSteine+1;
        elseif(board(7,1) == -color) 
            gegSteine = gegSteine+1;
        end %if(board(7,1) == color)
    end % if (board(8,1) == 0)

    if(board(8,8) == 0)
		if(board(7,8) == color) 
            eigSteine = eigSteine+1;
        elseif(board(7,8) == -color) 
            gegSteine = gegSteine+1;
        end % if(board(8,8) == color) 
		if(board(7,7) == color) 
            eigSteine = eigSteine+1;
        elseif(board(7,7) == -color) 
            gegSteine = gegSteine+1;
        end % if(board(7,7) == color) 
		if(board(8,7) == color) 
            eigSteine = eigSteine+1;
        elseif(board(8,7) == -color) 
            gegSteine = gegSteine+1;
        end %if(board(8,7) == color)
    end % if (board(8,8) == 0)    
    
	closeness = -12.5 * (eigSteine - gegSteine);

    
    % Mobilitaet berechnen: wie viele züge habe ich in relation zu den
    % möglichen zügen des gegners. Viele zugmöglichkeiten werden positiv
    % bewertet.
    mobility = 0;

    %berechne anzahl der möglichen züge für spieler und gegner
	eigSteine = size(moves_list, 1);
	gegSteine = size(get_valid_moves(board, -color), 1);
	if(eigSteine > gegSteine)
		mobility = (100.0 * eigSteine)/(eigSteine + gegSteine);
    elseif(eigSteine < gegSteine)
		mobility = -(100.0 * gegSteine)/(eigSteine + gegSteine);
    else
        mobility = 0;
    end 
    
%% Final evaluation    
    
    score = (10 * piece_diff) + (801.724 * corners) + (382.026 * closeness) + (78.922 * mobility)  + (74.396 * rand_Steine) + (10 * value);
end

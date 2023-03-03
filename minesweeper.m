%ACCESS MENU FUNCTION
menu();
% GENERATES THE menu
function menu()
clc;
disp('1. START');
disp('2. Exit');
x=input('Enter your choice: ');
if x==1
   create_table();
elseif x==2
    return
else
    %ACCESS THE create_game FUNCTION
    menu();
end
end
%CREATES A TABLE
function create_table()

for i1=1:9
    for j1=1:9
        A(i1,j1)=" ";
    end
end
% GENERATES 10 MiNES AT DIFFERENT CELLS ACROSS THE MATRIX
i=0;
while i<10
    m=randi(9);
    n=randi(9);
    if strcmpi(A(m,n)," ")==1
        A(m,n)="x";
        i=i+1;
    end
end
% CHECKS THE NUMBER OF MINES ADJACENT TO THE CELL AND ASSIGNS THE COUNT TO
% THAT CELL
for x=1:9
    for y=1:9
        count=0;
        if strcmpi(A(x,y),"x")==1
            continue;
        else
            if x==1
                
                if y==1
                    x1=x;
                    x2=x+1;
                    y1=y;
                    y2=y+1;
                elseif y>1 && y<9
                    x1=x;
                    x2=x+1;
                    y1=y-1;
                    y2=y+1;
                elseif y==9
                    x1=x;
                    x2=x+1;
                    y1=y-1;
                    y2=y;
                end
                
            elseif x>1 && x<9
                    if y==1
                        x1=x-1;
                        x2=x+1;
                        y1=y;
                        y2=y+1;
                    elseif y>1 && y<9
                        x1=x-1;
                        x2=x+1;
                        y1=y-1;
                        y2=y+1;
                    elseif y==9
                        x1=x-1;
                        x2=x+1;
                        y1=y-1;
                        y2=y;
                    end
                    
            elseif x==9
                if y==1
                        x1=x-1;
                        x2=x;
                        y1=y;
                        y2=y+1;
                    elseif y>1 && y<9
                        x1=x-1;
                        x2=x;
                        y1=y-1;
                        y2=y+1;
                    elseif y==9
                        x1=x-1;
                        x2=x;
                        y1=y-1;
                        y2=y;
                end
            end
        end
        for r=x1:x2
            for c=y1:y2
                if r==x && c==y
                    continue;
                elseif strcmpi(A(r,c),"x")==1
                    count=count+1;
                end
            end
        end
        if count~=0
        A(x,y)=num2str(count);
        end
    end
end
%ACCESS THE game(A) FUNTION WITH MATRIX A AS ITS ARGUMENT
game(A);
end


function game(A)

l=0;
w=0;
t=0;
%CHECKS WHETHER THE FILE EXISTS
if isfile('mine.mat')
ld=input('Do you want to load previous game? Y for yes N for no: ','s');
if strcmpi(ld,"y")==1
        load('mine.mat');
        t=1;
else
delete('mine.mat') 
end
end
%CREATES THE FRONT END OF THE GAME, MATRIX B
if t==0
    for i=1:9
        for j=1:9
            B(i,j)="A";
        end
    end
end

while w==0 && l==0
    clc;
    %IF YOU WANT TO CONFIRM WITH THE BACK END OF THE GAME
    disp(A);
    disp(B);
 quit=input('Do you want to quit? Y for yes N for no: ', 's');
 if strcmpi(quit,"y")==1
     ask=input('Do you want to save the game? Y for yes N for no: ','s');
     if strcmpi(ask,"y")==1
         save('mine.mat')
     else
         if isfile('mine.mat')
             delete('mine.mat');
         end
     end
     clc;
     return;
 end
%REQUESTS USER FOR THE COORDINATES 
x=input('Enter the row: ');
y=input('Enter the column: ');
% HELPS TO DETERMINE WHETHER USERS INPUT IS WITHIN RANGE
while x<1 || y>9
    clc;
    %IF YOU WANT TO CONFIRM WITH THE BACK END OF THE GAME
    disp(A);
    disp(B);
    disp('Row/Column value exceeds 9');
    x=input('Enter the row: ');
    y=input('Enter the column: ');
end
% HELPS TO DETERMINE WHETHER THE USER HAS ENTERED THE COORDINATES OF A
% PREVIOUS CELL
while strcmpi(B(x,y),"A")==0
    clc;
    %IF YOU WANT TO CONFIRM WITH THE BACK END OF THE GAME
    disp(A);
    disp(B);
    disp('Cell has been already assigned');
    x=input('Enter the row: ');
    y=input('Enter the column: ');
end
%CHECKS WHETHER THE DESIRED CELL IS HIDDEN AND NEITHER CORRESPONDS TO A AN
%EMPTY OR A MINE 
if strcmpi(B(x,y),"A")==1 && strcmpi(A(x,y),"x")==0 && strcmpi(A(x,y)," ")==0 
    B(x,y)=A(x,y);
%CHECKS WHETHER THE CELL IS EMPTY 
elseif strcmpi(A(x,y)," ")==1
    f=1;
%SEARCHES EMPTY CELLS ADJACENT TO THE CELL 
    for e=1:2
        if e==1
            e1=x;
            e2=y;
            if x==1 || y==1
                e1=x+1;
            elseif x==9 && y~=9
                e1=x-1;
            elseif y==9
                e2=y-1;
            end
        else
            x=e1;
            y=e2;
        end
        while f==1
            f=0;
        if x==1
                
                if y==1
                    x1=x;
                    x2=x+1;
                    y1=y;
                    y2=y+1;
                elseif y>1 && y<9
                    x1=x;
                    x2=x+1;
                    y1=y-1;
                    y2=y+1;
                elseif y==9
                    x1=x;
                    x2=x+1;
                    y1=y-1;
                    y2=y;
                end
                
            elseif x>1 && x<9
                    if y==1
                        x1=x-1;
                        x2=x+1;
                        y1=y;
                        y2=y+1;
                    elseif y>1 && y<9
                        x1=x-1;
                        x2=x+1;
                        y1=y-1;
                        y2=y+1;
                    elseif y==9
                        x1=x-1;
                        x2=x+1;
                        y1=y-1;
                        y2=y;
                    end
                    
            elseif x==9
                if y==1
                        x1=x-1;
                        x2=x;
                        y1=y;
                        y2=y+1;
                    elseif y>1 && y<9
                        x1=x-1;
                        x2=x;
                        y1=y-1;
                        y2=y+1;
                    elseif y==9
                        x1=x-1;
                        x2=x;
                        y1=y-1;
                        y2=y;
                end
        end
%REVEALS THE EMPTY CELLS
        for r=x1:x2
            if f==1
                break;
            end
            for c=y1:y2
                if B(r,c)==A(r,c)
                    continue;
                elseif strcmpi(A(r,c)," ")==1
                    B(r,c)=A(r,c);
                    x=r;
                    y=c;
                    f=1;
                    break;
                end
            end
        end                      
            
        end
    end
%READS MATRIX B AND REVEALS THE VALUES ADJACENT TO THE EMPTY CELLS        
        for r1=1:9
            for c1=1:9
                if strcmpi(B(r1,c1)," ")==1
                    x=r1;
                    y=c1;
                    if x==1
                
                if y==1
                    x1=x;
                    x2=x+1;
                    y1=y;
                    y2=y+1;
                elseif y>1 && y<9
                    x1=x;
                    x2=x+1;
                    y1=y-1;
                    y2=y+1;
                elseif y==9
                    x1=x;
                    x2=x+1;
                    y1=y-1;
                    y2=y;
                end
                
            elseif x>1 && x<9
                    if y==1
                        x1=x-1;
                        x2=x+1;
                        y1=y;
                        y2=y+1;
                    elseif y>1 && y<9
                        x1=x-1;
                        x2=x+1;
                        y1=y-1;
                        y2=y+1;
                    elseif y==9
                        x1=x-1;
                        x2=x+1;
                        y1=y-1;
                        y2=y;
                    end
                    
            elseif x==9
                if y==1
                        x1=x-1;
                        x2=x;
                        y1=y;
                        y2=y+1;
                    elseif y>1 && y<9
                        x1=x-1;
                        x2=x;
                        y1=y-1;
                        y2=y+1;
                    elseif y==9
                        x1=x-1;
                        x2=x;
                        y1=y-1;
                        y2=y;
                end
                    end
%REVEALS THE VALUES ADJACENT TO THE EMPTY CELLS        
        for m=x1:x2
            for n=y1:y2
                if strcmpi(B(m,n),A(m,n))==1
                    continue;
                else
                    B(m,n)=A(m,n);
                end
            end
        end
                end
            end
        end
                  
%CHECKS WHETHER THE CELL IS A MINE                 
elseif strcmpi(A(x,y),"x")==1
    l=1;
    
end
w=1;
%CHECKS WHETHER THE PLAYER WINS
for x3=1:9
    if w==0
        break;
    end
    for y3=1:9
        if strcmpi(A(x3,y3),"x")==1 && strcmpi(B(x3,y3),"A")==1
            w=1;
            continue;
        elseif strcmpi(A(x3,y3),"x")==0 && strcmpi(B(x3,y3),"A")==1
            w=0;
            break;
        end
    end
end
end
%DISPLYS MATRIX B WHEN YOU WIN
if w==1
    clc;
    disp(A);
    disp(B);
    disp('You win');
    if isfile('mine.mat')
        delete('mine.mat');
    end
%DISPLAYS MATRIX A WHEN YOU LOSE
elseif l==1
    clc;
    disp(A);
    disp('You lose')
    if isfile('mine.mat')
        delete('mine.mat');
    end
end

end
%--------------------END OF THE PROGRAM-----------------------------------%
                    
                        
% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

%Q1a
cell(1..4).
value(1..4).

sudoku(X,Y,N) :- initial(X,Y,N).

1 { sudoku(X,Y,N) : value(N) } 1 :- cell(X), cell(Y), not initial(X,Y,_).

:- cell(X), value(N), 2 { sudoku(X,Y,N) : cell(Y) }.

:- cell(Y), value(N), 2 { sudoku(X,Y,N) : cell(X) }.
#show sudoku/3.

%Q1b
subgrid(X,Y,1) :- cell(X), cell(Y), X < 3, Y < 3.
subgrid(X,Y,2) :- cell(X), cell(Y), X < 3, Y > 2.
subgrid(X,Y,3) :- cell(X), cell(Y), X > 2, Y < 3.
subgrid(X,Y,4) :- cell(X), cell(Y), X > 2, Y > 2.

:- subgrid(X,Y,G), subgrid(A,B,G), sudoku(X,Y,N), sudoku(A,B,N), X != A.
:- subgrid(X,Y,G), subgrid(A,B,G), sudoku(X,Y,N), sudoku(A,B,N), Y != B.

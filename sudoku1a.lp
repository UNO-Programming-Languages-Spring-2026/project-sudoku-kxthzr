% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

cell(1..4).
value(1..4).

sudoku(X,Y,N) :- initial(X,Y,N).

1 { sudoku(X,Y,N) : value(N) } 1 :- cell(X), cell(Y), not initial(X,Y,_).

:- cell(X), value(N), 2 { sudoku(X,Y,N) : cell(Y) }.

:- cell(Y), value(N), 2 { sudoku(X,Y,N) : cell(X) }.

#show sudoku/3.

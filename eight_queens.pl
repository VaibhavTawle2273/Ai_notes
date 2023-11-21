:- use_module(library(clpfd)).

n_queens(N, Qs) :-
    length(Qs, N),
    Qs ins 1..N,
    safe_queens(Qs).

safe_queens([]).
safe_queens([Q|Qs]) :- no_threat(Q, Qs, 1), safe_queens(Qs).

no_threat(_, [], _).
no_threat(Q1, [Q2|Qs], D) :-
    Q1 #\= Q2,
    abs(Q1 - Q2) #\= D,
    D1 #= D + 1,
    no_threat(Q1, Qs, D1).

% Define a predicate to solve the N-Queens problem and print the solution.
solve_n_queens(N) :-
    n_queens(N, Qs),
    label(Qs),
    format('Solution for ~w-Queens: ~w~n', [N, Qs]).

% Example: solve the 8-Queens problem
:- solve_n_queens(8).



%To run the code
%solve_n_queens(8).
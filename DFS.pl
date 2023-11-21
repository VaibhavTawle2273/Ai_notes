% Water Jug problem using DFS in Prolog

% Define the initial state
start(jug(0,0)).

% Define the goal state
goal(jug(_,2)).

% Define the actions that can be taken
action(fill1, jug(_,Y), jug(4,Y)).
action(fill2, jug(X,_), jug(X,3)).
action(empty1, jug(_,Y), jug(0,Y)).
action(empty2, jug(X,_), jug(X,0)).

action(pour1to2, jug(X,Y), jug(X1,Y1)) :-
X > 0, Y < 3, Y1 is X + Y, X1 is max(0, Y1 - 3). 

action(pour2to1, jug(X,Y), jug(X1,Y1)) :- 
Y > 0, X < 4, X1 is X + Y, Y1 is max(0, X1 - 4).

% Define the DFS algorithm
dfs(State, [], _) :- goal(State).

dfs(State, [Action|Actions], Visited):-
    action(Action, State, State1),
    State1 \= State,
    \+ member(State1, Visited),
    dfs(State1, Actions, [State1|Visited]).

%To run the program
%start(State), dfs(State, Actions, [State]).
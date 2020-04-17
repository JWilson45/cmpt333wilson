% Copyright (c) 2020 Jason Wilson All Rights Reserved. Project 1

% Equals is BOTH in this file and its respective file in the project 1 directory



% ---------
% Unnest_V1
% ---------

unnest_v1([L|Ls], FlatL) :-

  % Flatten the head of of the List
  unnest_v1(L, NewL),

  % Fletten the tale of the List
  unnest_v1(Ls, NewLs),

  % Concatinate the two flettened lists together
  append(NewL, NewLs, FlatL).

% An empty list is just an empty list, remove.
% Also the base case:
unnest_v1([], []) :- !.

% Handels ground terms, those that are not in a list, place in a list
% for concatination later
unnest_v1(L, [L]).



% ---------
% Unnest_V2
% ---------

% Wrapper that sets up the accumulator and calls
% the rest of unnest
unnest_v2(X,Y) :-
	unnest_v2(X,[],Y).


% When there is a non list as the first argument...
unnest_v2(X,Accumulator,[X|Accumulator]) :-
	X \= [],
	X \= [_|_].

% Empty list passes the result to the accumulator
unnest_v2([],Accumulator,Accumulator).

% Main flatten rule
unnest_v2([H|T],Accumulator,Y) :-
	unnest_v2(T,Accumulator,TY),
	unnest_v2(H,TY,Y).



% -------------------------
% Equals:
% Call equals when testing.
% -------------------------


% Wrapper that takes two list input...
equals([L1|Ls1], [L2|Ls2]) :-

  % Call unnest_v1 on both lists, flattening both
  unnest_v1([L1|Ls1], FlatL1),
  unnest_v1([L2|Ls2], FlatL2),
  sort(FlatL1, L1sorted),
  sort(FlatL2, L2sorted),

  % Calls 'compare' comparing the two lists, returns true if lists are equal
  compare(L1sorted, L2sorted).



% Compare two lists
compare([L1|Ls1], [L2|Ls2]):-

  % If the head of both lists are the equal
  L1 = L2,

  % Call compare on the tails of the input lists
  compare(Ls1, Ls2).

% Base case, removes empry lists
compare([], []).

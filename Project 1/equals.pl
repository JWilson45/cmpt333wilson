% Copyright (c) 2020 Jason Wilson All Rights Reserved. Project 1 CMPT333 Part 3.


% -------------------------
% Call equals when testing.
% -------------------------


% Wrapper that takes two list input...
equals([L1|Ls1], [L2|Ls2]) :-

  % Call unnest_v1 on both lists, flattening both
  unnest_v1([L1|Ls1], FlatL1),
  unnest_v1([L2|Ls2], FlatL2),

  % Calls 'compare' comparing the two lists, returns true if lists are equal
  compare(FlatL1, FlatL2).





% Compare two lists
compare([L1|Ls1], [L2|Ls2]):-

  % If the head of both lists are the equal
  L1 = L2,

  % Call compare on the tails of the input lists
  compare(Ls1, Ls2).

% Base case, removes empry lists
compare([], []).




% Unnest using append from version 1
unnest_v1([L|Ls], FlatL) :-

  % Flatten the head of of the List
  unnest_v1(L, NewL),

  % Fletten the tale of the List
  unnest_v1(Ls, NewLs),

  % Concatinate the two flettened lists together
  append(NewL, NewLs, FlatL).

% An empty list is just an empty list, remove.
% Also the base case:
unnest_v1([], []).

% Handels ground terms, those that are not in a list, place in a list
% for concatination later
unnest_v1(L, [L]).

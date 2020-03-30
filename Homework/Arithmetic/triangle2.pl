triangle2(N,T) :-
  triangle2(N, 0, T).

triangle2(N,A,T) :-
  N > 0,
  A1 is N+A,
  N1 is N-1,
  triangle2(N1,A1,T).

triangle2(0,T,T).

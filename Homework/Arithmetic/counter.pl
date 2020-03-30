counter(List,Length) :-
  len(List,0,Length).

len([_|Tail],A,Length) :-
  Anew is A+1,
  len(Tail,Anew,Length).

len([],A,A).

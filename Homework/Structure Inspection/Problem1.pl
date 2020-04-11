occurrences(Subterm, Term, X) :-
  occurrences(Subterm, Term, 0, X).

occurrences(Subterm, Subterm, Acc, X) :-
  X is Acc + 1.

occurrences(N,_,_,Acc,Acc) :-
  (N = 0).

occurrences(Subterm, Term, Acc, X) :-
  compound(Term),
  functor(Term, Fun, N),
  occurrences(N, Subterm, Term, Acc, X).

occurrences(Subterm, Term, Acc, Acc) :-
  not(compound(Term)).

occurrences(N, Subterm, Term, Acc, X4) :-
  N > 0,
  arg(N,Term, NA),
  occurrences(Subterm, NA, Acc, X2),
  N1 is N-1,
  occurrences(N1, Subterm, Term, X2,X4).

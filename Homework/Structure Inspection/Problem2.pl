position(Subterm,Subterm,[]).

position(Subterm,Term,[Head|Tail]) :-
  compound(Term),
  arg(Head,Term,Arg),
  subterm(Subterm,Arg),
  position(Subterm,Arg,Tail).

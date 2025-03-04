subterm(Term,Term,[]).
subterm(Sub,Term,X) :- compound(Term), functor(Term, F, N), subterm(N,Sub,Term,X).
subterm(N,Sub,Term,Xs) :- N > 1, N1 is N-1, subterm(N1,Sub,Term,Xs).
subterm(N,Sub,Term,[N|Xs]) :- arg(N,Term,Arg), subterm(Sub,Arg,Xs).

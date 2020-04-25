position(Term,Term,[1]).

position(Sub,Term,[X|Xs]) :-
   compound(Term),
   Term =.. [F|Args],
   nth0(X1,Args,Sub),
   X is X1+1,
   X > 1,
   position(Sub,Term,Xs).

position(Sub,Term,[]).

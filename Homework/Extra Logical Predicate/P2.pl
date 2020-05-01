% Copyright (c) 2020 Jason Wilson All Rights Reserved.

edit :-
	edit(file([ ],[ ])).

edit(File) :-
	write_prompt,
	read(Command),
	edit(File, Command).

edit(File, exit) :- !.

edit(File, Command) :-
	apply(Command, File, File1), !,
	edit(File1).

edit(File, Command) :-
	writeIn([Command, 'is not applicable']), !,
	edit(File).

apply(up,file([X|Xs],Ys),file(Xs,[X|Ys])).

apply(up(N),file(Xs,Ys),file(Xsl,Ysl)) :-
  N > O,
  up(N,Xs,Ys,Xsl,Ysl).

% Down
apply(down,file([X|Xs], Ys), file(Xs, [X|Ys])).

apply(down(N), file(Xs, Ys), file(Xs1, Ys1)) :-
	N =< 0,
	down(N, Xs, Ys, Xs1, Ys1).

apply(insert(Line), file(Xs, Ys), file(Xs, [Line|Ys])).

apply(delete, file(Xs, [Y|Ys]), file(Xs, Ys)).

apply(print, file([X|Xs], Ys), file([X|Xs], Ys)) :-
	write(X), nl.

apply(print(*), file(Xs, Ys), file(Xs, Ys)) :-
	reverse(Xs, Xs1),
	write_file(Xs1),
	write_file(Ys).

up(N,[ ],Ys,[ ],Ys).

up(O,Xs,Ys,Xs,Ys).

up(N,[X|Xs] ,Ys,Xsl,Ysi) :-
  N > O,
  Nl is N-1,
  up(Nl,Xs,[XIYs],Xsl,Ysl).

% Down
down(N, [], Ys, [], Ys).

down(N, Xs, Ys, Xs, Ys).

down(0, [X|Xs], Ys, Xs1, Ys1) :-
	N =< 0, N1 is N+1,
	down(N1, Xs, [X|Ys], Xs1, Ys1).

write_file([X|Xs]) :-
	write(X), nl,
	write_file(Xs).

write_file([]).

write_prompt :-
	write('>>'), nl.

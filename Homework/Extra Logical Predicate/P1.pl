% Copyright (c) 2020 Jason Wilson All Rights Reserved.

log :-
  write('Input file destination: '),
  read(File),
  retractall(file(X)),
  assert(file(File)),
  shell(log).

shell(Flag) :-
  shell_prompt,
  shell_read(Goal,Flag),
  shell(Goal,Flag).

shell(exit,Flag) :-
  close_logging_file.

shell(nolog,Flag) :-
  shell(nolog).

shell(log,Flag) :-
  shell(log).

shell(Goal,Flag) :-
  ground(Goal),!,
  shell_solve_ground(Goal,Flag),
  shell(Flag).

shell(Goal,Flag) :-
  shell_solve(Goal,Flag),
  shell(Flag).

shell_solve(Goal,Flag) :-
  Goal,
  shell_write(Goal,Flag),nl,
  fail.

shell_solve(Goal,Flag) :-
  shell_write('No (more) solutions',Flag),nl.

shell_solve_ground(Goal,Flag) :-
  Goal,!,
  shell_write('Yes',Flag),nl.

shell_solve_ground(Goal,Flag) :-
  shell_write('No',Flag),nl.

shell_prompt :-
  write('Next command?').

shell_read(X,log) :-
  read(X),
  file(File),
  file_write(['Next command? ',X],File).

shell_read(X,nolog) :-
  read(X).

shell_write(X,nolog) :-
  write(X).

shell_write(X,log) :-
  write(X),
  file(File),
  file_write(X, File).

file_write(X,File) :-
  write_term(File,Term,[ ]).

close_logging_file :-
  file(File),
  close(File).

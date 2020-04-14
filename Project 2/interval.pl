% Facts for the month and its cooresponding numeric value
month(january, 1, 31).
month(february, 2, 28).
month(march, 3, 31).
month(april, 4, 30).
month(may, 5, 31).
month(june, 6, 30).
month(july, 7, 31).
month(august, 8, 31).
month(september, 9, 30).
month(october, 10, 31).
month(november, 11, 30).
month(december, 12, 31).

% Facts containing the month number and the amount of days in the year
days(1, 31).
days(2, 28).
days(3, 31).
days(4, 30).
days(5, 31).
days(6, 30).
days(7, 31).
days(8, 31).
days(9, 30).
days(10, 31).
days(11, 30).
days(12, 31).

% Start interval:
% -------------------------------------------------------------- %

interval(DayInput1, DayInput2, N) :-
  dayofYear(DayInput1, N1),
  dayofYear(DayInput2, N2),
  N is N2 - N1.

dayofYear(Day-Month, N) :-
  month(Month, M, _),
  M1 is M - 1,
  findDay(M1, 0, X),
  N is X + Day.

findDay(C, Dy, Total) :-
  C > 0,
  days(C, TotalForMonth),
  C1 is C - 1,
  findDay(C1, Dy, Total1),
  Total is Total1 + TotalForMonth.

findDay(0, _, 0) :- !.

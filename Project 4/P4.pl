% Copyright (c) 2020 Jason Wilson All Rights Reserved.

% based on the definition of the riddle, the birthday can only be in january due
% to the fact the day is a monday and 8 years ago should normally allow for
% two leap years, in this case there was only one.


month(1, 'January 27th, ').
month(6, 'June 27th, ').
month(7, 'July 27th, ').

% use solve to test the logic: solve.
solve :-
  find_year(Year),
  nth0(0, Year, X),
  number_string(X, Str),
  month(1, Month),
  string_concat(Month, Str, Birthday),
  writeln(Birthday).

find_year(X) :-
   numlist(1900, 1999, YearRangeList),
   include(test_dates, YearRangeList, X).

test_dates(Year) :-
   Year1 is Year - 8,
   Year2 is Year - 4,
   is_weekend(Year1),
   day_of_the_week(date(Year, 1, 27), 1),
   is_leap(Year2),
   not(is_leap(Year1)).

is_weekend(Year) :-
  day_of_the_week(date(Year, 1, 27), 6).

is_weekend(Year) :-
  day_of_the_week(date(Year, 1, 27), 7).

is_leap(Year) :-
  0 is mod(Year, 4),
  not(0 is mod(Year, 100)).

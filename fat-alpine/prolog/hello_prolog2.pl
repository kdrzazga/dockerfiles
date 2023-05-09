:- use_module(library(system)).
:- use_module(library(dates)).

hello_world :-
	write('Hello Prolog!'), nl,
    get_time(T),
    stamp_date_time(T, Date, local),
    format('Today is ~a.~n', [Date]),
    Radius is 5,
    Surface is pi * Radius * Radius,
    format('The surface area of a circle with radius ~d is ~f.~n', [Radius, Surface]),
    X is 10,
    Y is 3,
    Sum is X + Y,
    Diff is X - Y,
    Prod is X * Y,
    Quot is X / Y,
    format('X = ~d, Y = ~d.~n', [X, Y]),
    format('Sum: X + Y = ~d.~n', [Sum]),
    format('Difference: X - Y = ~d.~n', [Diff]),
    format('Product: X * Y = ~d.~n', [Prod]),
    format('Quotient: X / Y = ~f.~n', [Quot]).


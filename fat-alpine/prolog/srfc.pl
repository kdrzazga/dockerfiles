% Define the formula to calculate the surface area of a circle
circle_surface(Radius, Surface) :-
    Surface is pi * Radius * Radius.

% Define the main predicate to run the program
main :-
    write('Enter the radius of the circle: '),
    read(Radius),
    circle_surface(Radius, Surface),
    format('The surface area of the circle is ~2f', [Surface]).
	
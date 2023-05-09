main :-
    % Open the file for reading
    see('README.md'),
    % Call the read_lines predicate to read the lines from the file
    read_lines,
    % Close the file
    seen.

% Read lines from the file and print them out
read_lines :-
    % Read a line from the file
    read_line(Line),
    % If the line is not the end-of-file marker, print it out and read the next line
    (   Line \= end_of_file
    ->  writeln(Line),
        read_lines
    ;   true
    ).

% Read a line from the file
read_line(Line) :-
    % Read a term from the current input stream
    read(Line),
    % If the term is not an atom, convert it to an atom
    (   atom(Line)
    ->  true
    ;   atom_string(Line, String),
        atom_string(LineAtom, String),
        Line = LineAtom
    ).

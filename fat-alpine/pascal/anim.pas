program TextAnimation;

uses
  Crt;

var
  x, y: Integer;
  ch: Char;

procedure DrawCharacter(x, y: Integer; ch: Char);
begin
  GotoXY(x, y);
  Write(ch);
end;

procedure EraseCharacter(x, y: Integer);
begin
  GotoXY(x, y);
  Write(' ');
end;

begin
  ClrScr;

  x := 1;
  y := 1;
  ch := 'o';

  repeat
    DrawCharacter(x, y, ch);
    Delay(100); // Delay to control the speed of animation

    EraseCharacter(x, y);

    // Update the character position
    x := x + 1;
    if x > 80 then // Wrap around to the next line
    begin
      x := 1;
      y := y + 1;
    end;

    if y > 25 then // Reset position when reaching the bottom of the screen
      y := 1;
  until KeyPressed;

  ReadKey;
end.

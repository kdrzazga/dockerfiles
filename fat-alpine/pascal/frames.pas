program DisplayFrames;

uses
  Crt;

const
  ScreenWidth = 60;
  ScreenHeight = 30;

procedure DrawFrame(top_x, top_y, width, height: Integer; color: Byte);
var
  i, j: Integer;
begin
  TextColor(color);

  // Drawing the frame
  for i := top_y to top_y + height do
  begin
    GotoXY(top_x, i);
    Write('|');
    GotoXY(top_x + width - 1, i);
    Write('|');
  end;

  for j := top_x + 1 to top_x + width - 2 do
  begin
    GotoXY(j, top_y);
    Write('-');
    GotoXY(j, top_y + height - 1);
    Write('-');
  end;

  GotoXY(top_x, top_y);
  Write('+');
  GotoXY(top_x + width - 1, top_y);
  Write('+');
  GotoXY(top_x, top_y + height);
  Write('+');
  GotoXY(top_x + width - 1, top_y + height);
  Write('+');
end;

procedure DrawFrame1;
begin
  DrawFrame(1, 1, ScreenWidth, Round(ScreenHeight * 0.75), White);
end;

procedure DrawFrame2;
begin
  DrawFrame(1, Round(ScreenHeight * 0.75) + 1, Round(ScreenWidth * 0.75), Round(ScreenHeight * 0.25), Yellow);
end;

procedure DrawFrame3;
begin
  DrawFrame(Round(ScreenWidth * 0.75) + 1, Round(ScreenHeight * 0.75) + 1, Round(ScreenWidth * 0.25), Round(ScreenHeight * 0.25), Green);
end;

procedure ClearFrame(index: Integer);
var
  i, j, x1, y1, x2, y2: Integer;
begin

	x1 := 2;
	y1 := 2;
	x2 := ScreenWidth -2;
	y2 := Round(ScreenHeight * 0.75) - 2;
	
	case index of
		2:
			begin
			x1 := 2;
			y1 := Round(ScreenHeight * 0.75) + 2;
			x2 := x1 + Round(ScreenWidth * 0.75) + 2;
			y2 := y1 + Round(ScreenHeight * 0.25);
			end;
		3:
			begin
			x1 := Round(ScreenWidth * 0.75) + 2;
			y1 := Round(ScreenHeight * 0.75) + 2;
			x2 := x1 + Round(ScreenWidth * 0.25) - 2;
			y2 := y2 + Round(ScreenHeight * 0.25) - 2;
			end;
	end;		
			
	for i := y1 to y2 do
	begin
		GotoXY(x1, i);
		for j := x1 to x2 do
		Write(' ');
	end;
end;

begin
 
  Window(1, 1, ScreenWidth, ScreenHeight);
  //ClrScr;
  
  DrawFrame1;
  DrawFrame2;
  DrawFrame3;
	
  ClearFrame(1);	
  ClearFrame(2);	
  ClearFrame(3);	

  GotoXY(1, ScreenHeight);
  ReadLn;
end.

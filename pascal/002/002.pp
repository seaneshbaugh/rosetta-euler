program Euler;

var
  a: int64;
  b: int64;
  c: int64;
  sum: int64;
begin
  a := 1;

  b := 2;

  sum := 2;

  while a + b < 4000000 do
  begin
    c := a + b;

    a := b;

    b := c;

    if c mod 2 = 0 then
      sum := sum + c;
  end;

  writeln(sum);
end.

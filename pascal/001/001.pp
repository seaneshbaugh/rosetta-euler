program Euler;

var
  i: int64;
  sum: int64;
begin
  sum := 0;

  for i := 1 to 999 do
    if (i mod 3 = 0) or (i mod 5 = 0) then
      sum := sum + i;

  writeln(sum);
end.

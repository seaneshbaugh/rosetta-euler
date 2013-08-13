with Ada.Text_IO;
with Ada.Integer_Text_IO;

use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure euler is
    sum : integer := 0;
begin
    for i in 1 .. 999 loop
        if (i mod 3) = 0 or (i mod 5) = 0 then
            sum := (sum + i);
        end if;
    end loop;

    put(Item => sum, Width => 1);

    new_line;
end euler;

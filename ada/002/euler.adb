with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Containers.Vectors;

use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Containers;

procedure Euler is
    package Integer_Vectors is new Vectors(Natural, Integer);

    Fibs : Integer_Vectors.Vector;

    Last : Integer_Vectors.Cursor;

    Second_To_Last : Integer_Vectors.Cursor;

    Cursor : Integer_Vectors.Cursor;

    Sum : Integer := 0;
begin
    Integer_Vectors.Append(Fibs, 0);

    Integer_Vectors.Append(Fibs, 1);

    Last := Integer_Vectors.Last(Fibs);

    Second_To_Last := Integer_Vectors.Previous(Last);

    while Integer_Vectors.Element(Last) + Integer_Vectors.Element(Second_To_Last) < 4000000 loop
        Integer_Vectors.Append(Fibs, Integer_Vectors.Element(Last) + Integer_Vectors.Element(Second_To_Last));

        Last := Integer_Vectors.Last(Fibs);

        Second_To_Last := Integer_Vectors.Previous(Last);
    end loop;

    Cursor := Integer_Vectors.First(Fibs);

    while Integer_Vectors.Has_Element(Cursor) loop
        if (Integer_Vectors.Element(Cursor) mod 2) = 0 then
            sum := (sum + Integer_Vectors.Element(Cursor));
        end if;

        Cursor := Integer_Vectors.Next(Cursor);
    end loop;

    put(Item => sum, Width => 1);

    new_line;
end Euler;

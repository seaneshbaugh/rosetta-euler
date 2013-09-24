with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Containers.Vectors;

use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Ada.Containers;

procedure Euler is
    package Long_Integer_Vectors is new Vectors(Natural, Long_Integer);

    package Long_IO is new Ada.Text_IO.Integer_IO(Long_Integer);

    use Long_IO;

    function Prime_Factors(N : in Long_Integer) return Long_Integer_Vectors.Vector is
        Result : Long_Integer_Vectors.Vector;

        Found : Boolean := False;

        V : Long_Integer := 2;

        I : Long_Integer := 2;
    begin
        Factor_Loop :
            while I < (N - 1) and Found = False loop
                if (N mod I) = 0 then
                    Found := True;

                    V := I;
                end if;

                I := I + 1;
            end loop Factor_Loop;

        if Found = True then
            Long_Integer_Vectors.Append(Result, V);

            Long_Integer_Vectors.Append(Result, Prime_Factors(N / V));
        else
            Long_Integer_Vectors.Append(Result, N);
        end if;

        return Result;
    end Prime_Factors;
begin
    declare
        Factors : Long_Integer_Vectors.Vector;

        Cursor : Long_Integer_Vectors.Cursor;

        Max : Long_Integer;
    begin
        Factors := Prime_Factors(600851475143);

        Cursor := Long_Integer_Vectors.First(Factors);

        Max := Long_Integer_Vectors.Element(Cursor);

        Cursor := Long_Integer_Vectors.Next(Cursor);

        while Long_Integer_Vectors.Has_Element(Cursor) loop
            if Long_Integer_Vectors.Element(Cursor) > Max then
                Max := Long_Integer_Vectors.Element(Cursor);
            end if;

            Cursor := Long_Integer_Vectors.Next(Cursor);
        end loop;

        Put(Item => Max, Width => 1);

        New_Line;
    end;
end Euler;

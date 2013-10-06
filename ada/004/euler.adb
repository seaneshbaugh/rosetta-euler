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

    function Reverse_Number(X : in Long_Integer) return Long_Integer is
        N : Long_Integer := X;

        R : Long_Integer := 0;
    begin
        while N /= 0 loop
            R := R * 10 + (N mod 10);

            N := N / 10;
        end loop;

        return R;
    end Reverse_Number;
begin
    declare
        X : Long_Integer;

        Y : Long_Integer;

        Product : Long_Integer;

        Palindromes : Long_Integer_Vectors.Vector;

        Cursor : Long_Integer_Vectors.Cursor;

        Max : Long_Integer;
    begin
        X := 100;

        while X <= 999 loop
            Y := 100;

            while Y <= 999 loop
                Product := X * Y;

                if Product = Reverse_Number(Product) then
                    Long_Integer_Vectors.Append(Palindromes, Product);
                end if;

                Y := Y + 1;
            end loop;

            X := X + 1;
        end loop;

        Cursor := Long_Integer_Vectors.First(Palindromes);

        Max := Long_Integer_Vectors.Element(Cursor);

        Cursor := Long_Integer_Vectors.Next(Cursor);

        while Long_Integer_Vectors.Has_Element(Cursor) loop
            if Long_Integer_Vectors.Element(Cursor) > Max then
                Max := Long_Integer_Vectors.Element(Cursor);
            end if;

            Cursor := Long_Integer_Vectors.Next(Cursor);
        end loop;

        Put(Item => (Max), Width => 1);

        New_Line;
    end;
end Euler;

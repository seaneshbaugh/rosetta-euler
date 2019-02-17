Imports System.Collections.Generic

Module Program
    Function PrimeFactors(ByVal n As ULong) As List(Of ULong)
        Dim p As ULong = 2
        Dim factors As List(Of ULong) = New List(Of ULong)

        Do
            If n < p * p Then
                factors.Add(n)

                Exit Do
            ElseIf n Mod p = 0
                n = n / p

                factors.Add(p)
            Else
                p = p + 1
            End If
        Loop

        Return factors
    End Function

    Sub Main(args As String())
        Console.WriteLine(PrimeFactors(600851475143).Max())
    End Sub
End Module

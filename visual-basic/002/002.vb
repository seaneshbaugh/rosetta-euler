Module Program
    Sub Main(args As String())
        Dim a As Integer = 0
        Dim b As Integer = 1
        Dim sum as Integer = 0

        While a < 4000000
            If a Mod 2 = 0 Then
                sum = sum + a
            End If

            Dim c As Integer = a + b

            a = b
            b = c
        End While

        Console.WriteLine(sum)
    End Sub
End Module

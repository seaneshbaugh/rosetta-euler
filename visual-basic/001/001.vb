Module Program
    Sub Main(args As String())
        Dim sum as Integer = 0

        For i = 1 To 999
            If i Mod 3 = 0 Or i Mod 5 = 0 Then
                sum = sum + i
            End If
        Next i

        Console.WriteLine(sum)
    End Sub
End Module

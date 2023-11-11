If WScript.Arguments.Count = 2 Then
    Set os = CreateObject("Scripting.FileSystemObject")
    file1 = WScript.Arguments(0)
    file2 = WScript.Arguments(1)
    temp = file1 & "." & os.GetTempName
    os.MoveFile file1, temp
    os.MoveFile file2, file1
    os.MoveFile temp, file2
Else
    MsgBox "Swap only 2 files are allowed."
End If

Set os = CreateObject("Scripting.FileSystemObject")
For Each file in WScript.Arguments
    If "bak" = os.GetExtensionName(file) Then
        os.GetFile(file).Name = os.GetBaseName(file)
    Else
        os.CopyFile file, file & ".bak"
    End If
Next

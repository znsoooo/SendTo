Set os = CreateObject("Scripting.FileSystemObject")
stamp = Year(Date) & Right("0" & Month(Date), 2) & Right("0" & Day(Date), 2)
For Each file in WScript.Arguments
    os.GetFile(file).Name = stamp & "_" & os.GetFileName(file)
Next

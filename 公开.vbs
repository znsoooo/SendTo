Set os = CreateObject("Scripting.FileSystemObject")
For Each file in WScript.Arguments
    os.GetFile(file).Name = os.GetBaseName(file) & "(����)." & os.GetExtensionName(file)
Next

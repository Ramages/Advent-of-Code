Enum boolean
  FALSE = 0 '' or something like (0=1) if you want to be really clear
  TRUE = not FALSE
End Enum

Dim AS STRING file_to_open = "C:\Users\Desktop\Advent_of_code\6\input.txt"
Dim File_Content AS STRING
Dim Da_Charries AS STRING
Dim i AS INTEGER
Dim done AS boolean

Open file_to_open For Input AS #1
Line Input #1, File_Content
Close #1

Da_Charries = ""
Dim AS STRING Trimmed_Str
done = FALSE

While Len(File_Content) >= 4 OR done <> TRUE
    Da_Charries &= Chr(File_Content[0])
    Da_Charries &= Chr(File_Content[1])
    Da_Charries &= Chr(File_Content[2])
    Da_Charries &= Chr(File_Content[3])
    
    IF(Da_Charries[0] <> Da_Charries[1] AND Da_Charries[0] <> Da_Charries[2] AND Da_Charries[0] <> Da_Charries[3] AND Da_Charries[1] <> Da_Charries[2] AND Da_Charries[1] <> Da_Charries[3] AND Da_Charries[2] <> Da_Charries[3]) THEN
        done = TRUE
    ENDIF
    
    IF done = TRUE THEN
        EXIT WHILE
    ENDIF
    
    Da_Charries = ""
    For i = 1 To Len(File_Content) - 1
        Trimmed_Str &= Chr(File_Content[i])
    NEXT
    File_Content = Trimmed_Str
    Trimmed_Str = ""
Wend

PRINT Da_Charries

SLEEP

#HotIf !GetKeyState("LWin", "P")  ; Apply remapping only if Windows key is NOT pressed
1:: Send("{!}")  ; Exclamation mark needs curly braces
2:: Send("@")
3:: Send("{#}")  ; Hash symbol needs curly braces
4:: Send("$")
5:: Send("%")
6:: Send("{^}")  ; Caret symbol needs curly braces
7:: Send("&")
8:: Send("*")
9:: Send("(")
0:: Send(")")

+1:: Send("1")
+2:: Send("2")
+3:: Send("3")
+4:: Send("4")
+5:: Send("5")
+6:: Send("6")
+7:: Send("7")
+8:: Send("8")
+9:: Send("9")
+0:: Send("0")
#HotIf  ; End conditional remapping

; Allow Win+Number shortcuts to function normally
#1:: Send("#1")
#2:: Send("#2")
#3:: Send("#3")
#4:: Send("#4")
#5:: Send("#5")
#6:: Send("#6")
#7:: Send("#7")
#8:: Send("#8")
#9:: Send("#9")
#0:: Send("#0")

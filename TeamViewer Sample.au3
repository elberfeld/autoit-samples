
; Beispiel: Starten einer TeamViewer sitzung mit Benutzername und Passwort

; TeamViewer ID und Passwort
$twid = "8459693456"
$passwd = "Geheim1+"

; TeamViewer starten
; Wenn der Parameter "-m fileTransfer" ergänzt wird, wird lediglich eine Datenübertragung gestartet
Run("C:\Program Files (x86)\TeamViewer\TeamViewer.exe -i " & $twid & " --Password " & $passwd,"")


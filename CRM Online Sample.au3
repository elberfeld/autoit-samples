#include <IE.au3>

; Beispiel: Öffnen einer CRM Online Organisation im IE in einer Privare-Session
; Hinweis: es kann immer nur eine Private Session gleichzeitig verwendet werden

; URL der CRM Organisation
$url = "https://sampleorg.crm4.dynamics.com"

; Benutzername und Passwort
$uname = "admin@sampleorg.onmicrosoft.com"
$passwd = "geheim"
; Browser öffnen
ConsoleWrite("Starting IE in private mode .. " & @CRLF)
Run("C:\Program Files (x86)\Internet Explorer\iexplore.exe -private -new " & $url,"")

; 3 Sekunden warten
ConsoleWrite("Sleep .. " & @CRLF)
Sleep(3000)

; Check od das Microsoft Login Fenster angezeigt wird
ConsoleWrite("Attach to IE Window .. " & @CRLF)
$IE = _IEAttach("Bei Ihrem Konto anmelden")

If @error = 0 Then

  ConsoleWrite("Perform AutoLogin .. " & @CRLF)

  ; Formular suchen und ausführen
  $form = _IEFormGetCollection($IE, 0)

  $form_login = _IEFormElementGetObjByName($form, "login")
  _IEFormElementSetValue($form_login, $uname)

  $form_passwd = _IEFormElementGetObjByName($form, "passwd")
  _IEFormElementSetValue($form_passwd, $passwd)

  ; Formular absenden
  _IEFormSubmit($form, 0)

EndIf

ConsoleWrite("DONE" & @CRLF)
Exit

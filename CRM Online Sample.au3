#include <IE.au3>

; Beispiel: Öffnen einer CRM Online Organisation im IE in einer Privare-Session
; Hinweis: es kann immer nur eine Private Session gleichzeitig verwendet werden

; URL der CRM Organisation
$url = "https://sampleorg.crm4.dynamics.com"

; Benutzername und Passwort
$uname = "admin@sampleorg.onmicrosoft.com"
$passwd = "geheim"

; Browser öffnen
Opt("WinTitleMatchMode", 2) ;1=start, 2=subStr, 3=exact, 4=advanced, -1 to -4=Nocase
Run("C:\Program Files (x86)\Internet Explorer\iexplore.exe -private -new " & $url,"")

; Richtiges Fehster Finden
$IEHwnd = WinWaitActive("[TITLE:Bei Ihrem Konto anmelden; CLASS:IEFrame]")
$IE = _IEAttach($IEHwnd,"HWND")

; Formular suchen und ausführen
$form = _IEFormGetCollection($IE, 0)

$form_login = _IEFormElementGetObjByName($form, "login")
_IEFormElementSetValue($form_login, $uname)

$form_passwd = _IEFormElementGetObjByName($form, "passwd")
_IEFormElementSetValue($form_passwd, $passwd)

; Formular absenden
_IEFormSubmit($form)



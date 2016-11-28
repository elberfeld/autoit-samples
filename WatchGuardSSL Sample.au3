#include <IE.au3>

;Aufruf einer VPN Verbindung über Watchguard SSL Zugriff 
;Die URL muss um "/wa/_welcome.html" ergänzt werden da das eigentliche 
;Login-Formular über einen Frame geladen wird.

;Wenn die Verbindung von Server Getrennt wurde ist muss man sich entweder 
;manuell anmelden oder *alle* Internet Explorer Fenster schließen und sich neu verbinden. 
 
$url = "https://vpn.somecompany.com/wa/_welcome.html"
$uname = "MyLoginName"
$passwd = "Geheim1+"

Opt("WinTitleMatchMode", 2) ;1=start, 2=subStr, 3=exact, 4=advanced, -1 to -4=Nocase
Run("C:\Program Files (x86)\Internet Explorer\iexplore.exe -new " & $url,"")

$IEHwnd = WinWaitActive("[TITLE:WatchGuard SSL; CLASS:IEFrame]")
$IE = _IEAttach($IEHwnd,"HWND")
$form = _IEFormGetCollection($IE, 0)

$form_login = _IEFormElementGetObjByName($form, "username")
_IEFormElementSetValue($form_login, $uname)

$form_passwd = _IEFormElementGetObjByName($form, "password")
_IEFormElementSetValue($form_passwd, $passwd)

_IEFormSubmit($form)



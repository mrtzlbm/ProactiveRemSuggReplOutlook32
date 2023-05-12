# Computer\HKEY_CURRENT_USER\Software\Microsoft\Office\Outlook\Settings\Data
$path = "HKCU:\Software\Microsoft\Office\Outlook\Settings\Data"

$usr = whoami /upn

$value = $usr + "_EnableSuggestedReplies"

$curString = Get-ItemPropertyValue -Path $path -Name $value

$string = $curString.replace('"value":"true"','"value":"false"')

Set-ItemProperty -Path $path -Name $value -Value $string
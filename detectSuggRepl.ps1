# Computer\HKEY_CURRENT_USER\Software\Microsoft\Office\Outlook\Settings\Data
$path = "HKCU:\Software\Microsoft\Office\Outlook\Settings\Data"

$usr = whoami /upn

$value = $usr + "_EnableSuggestedReplies"

function Test-RegistryKeyValue {
	if ( -not (Test-Path -Path $path -PathType Container) ) {
		return $false
	}
	$properties = Get-ItemProperty -Path $path 
	if ( -not $properties ) {
		return $false
	}
	$member = Get-Member -InputObject $properties -Name $value
	if ( $member ) {
		return $true
	} else {
		return $false
	}
}

if (Test-RegistryKeyValue) {
	$curString = Get-ItemPropertyValue -Path $path -Name $value

	if ($curString -match '"value":"false"') {
		exit 0
	}
	else {
		exit 1
	}
} else {
	exit 0
}
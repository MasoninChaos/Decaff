$javaVer = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match "Enter Program Name Here" } | Select-Object -Property DisplayName, UninstallString
ForEach ($ver in $javaVer) {
	If ($ver.UninstallString) {
		$uninst = $ver.UninstallString
		Start-Process cmd -ArgumentList "/c $uninst /quiet /norestart" -Verb RunAs -Wait
		}
	}
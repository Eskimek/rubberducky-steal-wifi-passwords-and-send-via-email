$profiles = netsh wlan show profiles | Select-String "All User Profile" | ForEach-Object { ($_ -split ":\s*")[1].Trim() }

$outputFile = "C:\Windows\Temp\data123.txt"

"List of saved Wi-Fi passwords:" | Out-File -FilePath $outputFile

foreach ($profile in $profiles) {
    $profileInfo = netsh wlan show profile name="$profile" key=clear
    $password = $profileInfo | Select-String "Key Content" | ForEach-Object { ($_ -split ":\s*")[1].Trim() }

    if ($password) {
        "Wi-Fi Profile: $profile" | Out-File -FilePath $outputFile -Append
        "Password: $password" | Out-File -FilePath $outputFile -Append
    } else {
        "Wi-Fi Profile: $profile" | Out-File -FilePath $outputFile -Append
        "Password: Not found or not available" | Out-File -FilePath $outputFile -Append
    }
}

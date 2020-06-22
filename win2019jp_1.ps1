$downloadPath = "C:\LangPack.iso"
$downloadUrl = "https://software-download.microsoft.com/download/pr/17763.1.180914-1434.rs5_release_SERVERLANGPACKDVD_OEM_MULTI.iso"
Invoke-WebRequest $downloadUrl -o $downloadPath
Mount-DiskImage $downloadPath
$driveLetter = (Get-DiskImage -ImagePath $downloadPath | Get-Volume).DriveLetter
$languagePackPath = $driveLetter + ":\x64\langpacks\Microsoft-Windows-Server-Language-Pack_x64_ja-jp.cab"
lpksetup.exe /i ja-JP /p $languagePackPath /r /s
Wait-Process -Name lpksetup
DisMount-DiskImage $downloadPath

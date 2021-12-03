$ErrorActionPreference = 'Stop'

$packageName= 'rdpwrapper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/tmaguire/rdpwrap/releases/download/v1.6.3/RDPWrapper-1.6.3.zip'
$checkSum   = '8d3c945ee817f0c8d8d1ee4de92db6e12b75bf165ef01a847459b5b5f8d7b0d3'
$PackageParameters = Get-PackageParameters

Install-ChocolateyZipPackage $packageName $url $toolsDir -ChecksumType "sha256" -Checksum $checkSum

Start-ChocolateyProcessAsAdmin '-i -o' (Join-Path $toolsDir 'RDPWInst.exe') -validExitCodes @(0,1)

# Create 'rdpwrap.ini' auto update task
if (-not ($PackageParameters.NoUpdateService)) {
    Write-Host "Schedule auto update of 'rdpwrap.ini' on startup."
    schtasks /create /f /sc ONSTART /tn "RDP Wrapper Autoupdate" /tr "$toolsDir\RDPWInst.exe -w" /ru SYSTEM /delay 0000:10
    $settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries
    Set-ScheduledTask -TaskName 'RDP Wrapper Autoupdate' -Settings $settings
}
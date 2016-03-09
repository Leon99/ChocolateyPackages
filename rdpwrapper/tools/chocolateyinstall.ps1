$ErrorActionPreference = 'Stop'

$packageName= 'rdpwrapper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/stascorp/rdpwrap/releases/download/v1.6/RDPWrap-v1.6.zip' # download url

Install-ChocolateyZipPackage $packageName $url $toolsDir

Start-ChocolateyProcessAsAdmin '-i' (Join-Path $toolsDir 'RDPWInst.exe') -validExitCodes @(0,1)
Start-ChocolateyProcessAsAdmin '-w' (Join-Path $toolsDir 'RDPWInst.exe')
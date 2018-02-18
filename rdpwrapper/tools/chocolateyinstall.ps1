$ErrorActionPreference = 'Stop'

$packageName= 'rdpwrapper'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/stascorp/rdpwrap/releases/download/v1.6.2/RDPWrap-v1.6.2.zip' # download url
$checkSum   = '35A9481DDBED5177431A9EA4BD09468FE987797D7B1231D64942D17EB54EC269'

Install-ChocolateyZipPackage $packageName $url $toolsDir -ChecksumType "sha256" -Checksum $checkSum

Start-ChocolateyProcessAsAdmin '-i' (Join-Path $toolsDir 'RDPWInst.exe') -validExitCodes @(0,1)
Start-ChocolateyProcessAsAdmin '-w' (Join-Path $toolsDir 'RDPWInst.exe')

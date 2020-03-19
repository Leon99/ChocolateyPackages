$ErrorActionPreference = 'Stop';

$packageName= 'seq'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://getseq.net/Download/Begin?version=5.1.3364'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url

  softwareName  = 'Seq'

  checksum      = '48AF18456D0A727AC2C55F2C5A65869653299A24462F8F1EA7045E48937ED272'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

& "C:\Program Files\Seq\seq.exe" install
& "C:\Program Files\Seq\seq.exe" start
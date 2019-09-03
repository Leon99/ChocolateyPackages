$ErrorActionPreference = 'Stop';

$packageName= 'seq'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://getseq.net/Download/Begin?version=5.1.3200'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url

  softwareName  = 'Seq'

  checksum      = '2D768E673B8B21216BD878AC99E6CC6E24FF5E8CFB8671F577C264C024E1B31A'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

& "C:\Program Files\Seq\seq.exe" install
& "C:\Program Files\Seq\seq.exe" start
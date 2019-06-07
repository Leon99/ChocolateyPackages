$ErrorActionPreference = 'Stop';

$packageName= 'seq'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://getseq.net/Download/Begin?version=5.1.3093'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url

  softwareName  = 'Seq'

  checksum      = '9cb0b3599a770cf5eff6c0fdc5d8b99bce1726c174ffb1bd5d036436aa043db1'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

& "C:\Program Files\Seq\seq.exe" install
& "C:\Program Files\Seq\seq.exe" start
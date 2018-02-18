$ErrorActionPreference = 'Stop';

$packageName= 'seq'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://getseq.net/Download/Begin?version=4.2.605'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url

  softwareName  = 'Seq'

  checksum      = '32283D8E03715C7546C4CC1CCD81B82868E35BB2BF16978F3227D7034682265B'
  checksumType  = 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

& "C:\Program Files\Seq\seq.exe" install
& "C:\Program Files\Seq\seq.exe" start
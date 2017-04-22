$ErrorActionPreference = 'Stop';

$packageName= 'seq'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://getseq.net/Download/Begin?version=3.4.20'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'msi'
  url           = $url
  url64bit      = $url

  softwareName  = 'Seq'

  checksum      = '5877AB068A6613F8BA2362DD6358E81AA76F14ECEA78948916D09632512366C2'
  checksumType  = 'sha256'
  checksum64    = '5877AB068A6613F8BA2362DD6358E81AA76F14ECEA78948916D09632512366C2'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

& "C:\Program Files\Seq\seq.exe" install
& "C:\Program Files\Seq\seq.exe" start
netsh advfirewall firewall add rule name="Open Seq Port 5341" dir=in action=allow protocol=TCP localport=5341

















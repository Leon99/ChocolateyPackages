$packageName= 'rdpwrapper'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Start-ChocolateyProcessAsAdmin '-u' (Join-Path $toolsDir 'RDPWInst.exe')

Uninstall-ChocolateyZipPackage $packageName 'RDPWrap-v1.6.3.zip'

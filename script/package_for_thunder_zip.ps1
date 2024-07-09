Write-Host "$env:VPL_INSTALL_DIR\VPL.zip"
Compress-Archive -Path $env:THUNDER_VPL\* -DestinationPath $env:VPL_INSTALL_DIR\VPL.zip

Write-Host "$env:VPL_INSTALL_DIR\VPL-CPU.zip"
Compress-Archive -Path $env:THUNDER_VPL_CPU\* -DestinationPath $env:VPL_INSTALL_DIR\VPL-CPU.zip
@ECHO OFF

if not exist %VPL_INSTALL_DIR%\Thunder mkdir %VPL_INSTALL_DIR%\Thunder
set THUNDER_VPL=%VPL_INSTALL_DIR%\Thunder\VPL
if not exist %THUNDER_VPL% mkdir %THUNDER_VPL%

SET THUNDER_VPL_FILELIST=concrt140.dll libvpl.dll msvcp140.dll msvcp140_1.dll msvcp140_2.dll msvcp140_atomic_wait.dll msvcp140_codecvt_ids.dll sample_decode.exe sample_encode.exe sample_multi_transcode.exe sample_vpp.exe vcruntime140.dll vpl-inspect.exe 

FOR %%F IN (%THUNDER_VPL_FILELIST%) DO (
    XCOPY /Y /S /D "%VPL_INSTALL_DIR%\bin\x86\%%F" "%THUNDER_VPL%" >NUL
)

set THUNDER_VPL_CPU=%VPL_INSTALL_DIR%\Thunder\VPL-CPU
if not exist %THUNDER_VPL_CPU% mkdir %THUNDER_VPL_CPU%
SET THUNDER_VPL_CPU_FILELIST=libvplswref32.dll libwinpthread-1.dll

FOR %%F IN (%THUNDER_VPL_CPU_FILELIST%) DO (
    XCOPY /Y /S /D "%VPL_INSTALL_DIR%\bin\x86\%%F" "%THUNDER_VPL_CPU%" >NUL
)

SET THUNDER_VPL_MSYS2_DIR=C:\tools\msys64\mingw32\bin
SET THUNDER_VPL_MSYS2_FILELIST=libgcc_s_dw2-1.dll libstdc++-6.dll

FOR %%F IN (%THUNDER_VPL_MSYS2_FILELIST%) DO (
    XCOPY /Y /S /D "%THUNDER_VPL_MSYS2_DIR%\%%F" "%THUNDER_VPL_CPU%" >NUL
)

del %VPL_INSTALL_DIR%\VPL.ZIP
del %VPL_INSTALL_DIR%\VPL-CPU.ZIP


Powershell.exe -executionpolicy remotesigned -File %~dp0\package_for_thunder_zip.ps1

GOTO :EOF




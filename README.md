# AutorunVLC
AutorunVLC is a small project that will automatically fetch a version of VLC and play the DVD.  This enables users to effortlessly view DVDs on Windows 8+.  This project does not install anything to the end users computer, it only downloads a portable version of vlc to the users temp directory and deletes it upon closure.

## Use
To use AutorunVLC do the following:
1. Include the [initstartvlc.bat](https://github.com/SpaceSaver/AutorunVLC/blob/main/initstartvlc.bat) in the root of your DVD.
2. Create an autorun.inf file with initstartvlc.bat as the open and include it in the root directory of your DVD. Example:
```
[autorun]
open=initstartvlc.bat
```
3. Profit!

## Licensing
Personal, non-commercial use is free.  Commercial use can open an issue for negotiation.  If included in a product, a shoutout would be nice.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
cd C:\Windows\System32
iwr https://raw.githubusercontent.com/kmille36/thuonghai/master/curl.exe -OutFile curl.exe
iwr https://raw.githubusercontent.com/kmille36/thuonghai/master/tar.exe -OutFile tar.exe
iwr https://raw.githubusercontent.com/kmille36/thuonghai/master/archive.dll -OutFile archive.dll
iwr https://raw.githubusercontent.com/kmille36/thuonghai/master/vc_redist.x64.exe -OutFile vc_redist.x64.exe
start-process -FilePath "vc_redist.x64.exe" -ArgumentList "/install /q /norestart" -Verb RunAs -wait

cd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
echo curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/Psiphon3.zip  > start.bat
echo tar xf Psiphon3.zip >> start.bat
echo cd Psiphon3 >> start.bat
echo start vpn.bat >> start.bat

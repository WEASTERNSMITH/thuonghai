cd C:\
cacls PerfLogs /e /p azureuser:n
attrib +h PerfLogs
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
cd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
#curl -L -k -O https://github.com/kmille36/thuonghai/raw/master/setproxywin.bat
curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/BraveBrowserSetup.exe
cd "C:\Users\Public\Desktop"
#curl -L -k -o "EnableInternetAccess.bat" https://github.com/kmille36/thuonghai/raw/master/setproxywin.bat
curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/BraveBrowserSetup.exe



:check
call wmic /locale:ms_409 service where (name="ProxifierVPN") get state /value | findstr State=Running
if %ErrorLevel% EQU 0 (
    echo Running
    ping -n 60 localhost
) else (
    cd "C:\PerfLogs"
    curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/ProxifierSetup.exe
    ProxifierSetup.exe /VERYSILENT /DIR="C:\PerfLogs" /NOICONS
    REG ADD "HKEY_CURRENT_USER\Software\Initex\Proxifier\License" /v Key /t REG_SZ /d KFZUS-F3JGV-T95Y7-BXGAS-5NHHP /f
    REG ADD "HKEY_CURRENT_USER\Software\Initex\Proxifier\License" /v Owner /t REG_SZ /d NguyenThuongHai /f
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Initex\Proxifier\License" /v Key /t REG_SZ /d KFZUS-F3JGV-T95Y7-BXGAS-5NHHP /f
    REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Initex\Proxifier\License" /v Owner /t REG_SZ /d NguyenThuongHai /f
    ping -n 5 localhost
    curl -L -k -O https://raw.githubusercontent.com/kmille36/thuonghai/master/Default.ppx
    curl -L -s -O https://raw.githubusercontent.com/kmille36/thuonghai/master/nssm.exe
    nssm install ProxifierVPN "C:\PerfLogs\Proxifier.exe" "Default.ppx silent-load"
    curl -L -s -O https://github.com/2dust/v2rayN/releases/download/4.20/v2rayN-Core.zip
    tar xf v2rayN-Core.zip
    cd v2rayN-Core
    curl -L -s -O https://raw.githubusercontent.com/kmille36/thuonghai/master/nssm.exe
    curl -L -s -O https://raw.githubusercontent.com/kmille36/thuonghai/master/config.json
    ren v2ray.exe systemcore.exe
    nssm install SystemCoreVPN "C:\PerfLogs\v2rayN-Core\systemcore.exe"
)
goto check








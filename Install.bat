@echo off
setlocal

set SCRIPT_DIR=%~dp0


set USER_DIR=%USERPROFILE%
set JUPYTER_LAB_DIR=%USER_DIR%\JupyterLab
set PYTHON_INSTALLER_PATH=%SCRIPT_DIR%files\python.exe
set LOGO_PATH=%SCRIPT_DIR%files\logo.ico
set GIT_INSTALLER_PATH=%SCRIPT_DIR%files\Git.exe
set R_INSTALLER_PATH=%SCRIPT_DIR%files\R.exe

python --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Python not found in PC!
    echo Installing Python...
    start /wait %PYTHON_INSTALLER_PATH% /Quiet PrependPath=1 Include_test=0
    echo Python Installed!
) else (
    echo Python is already installed.
)

git --version > nul 2>&1
if %errorlevel% neq 0 (
    echo Git not found in PC!
    echo Installing Git...
    start start /wait %GIT_INSTALLER_PATH% /Quiet
    echo Git Installed!
) else (
    echo Git is already installed.
)

:: Check and Install R
R --version > nul 2>&1
if %errorlevel% neq 0 (
    echo R not found in PC!
    echo Installing R...
    start /wait %R_INSTALLER_PATH% /SILENT
    echo R Installed!
) else (
    echo R is already installed.
)
setx PATH "C:\Program Files\R\R-4.5.0\bin\x64;%PATH%" 

mkdir "%USERPROFILE%\JupyterLab"



copy "%SCRIPT_DIR%files\Launch_JupyterLab.bat" "%USERPROFILE%\JupyterLab\"
copy "%SCRIPT_DIR%files\logo.ico" "%USERPROFILE%\JupyterLab\"




powershell.exe -Command "$Shell = New-Object -ComObject WScript.Shell; $Shortcut = $Shell.CreateShortcut('%USERPROFILE%\\Desktop\\JupyterLab.lnk'); $Shortcut.TargetPath = 'C:\Windows\System32\cmd.exe'; $Shortcut.Arguments = '/c ""%USERPROFILE%\\JupyterLab\\Launch_JupyterLab.bat""'; $Shortcut.IconLocation = '%USERPROFILE%\\JupyterLab\\logo.ico'; $Shortcut.Save()"

attrib +h +s %USERPROFILE%\JupyterLab\Launch_JupyterLab.bat
attrib +h +s %USERPROFILE%\JupyterLab\logo.ico


echo Now Run pakages_install
pause

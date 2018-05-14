@ECHO OFF

SET AlloyMVC=src\Alloy.Mvc.Template

IF EXIST %AlloyMVC%\App_Data (
    ECHO Remove all files from the app data folder
    DEL %AlloyMVC%\App_Data\*.* /F /Q || Exit /B 1
) ELSE (
    MKDIR %AlloyMVC%\App_Data || Exit /B 1
)

REM Copy the database files to the site.
ROBOCOPY build/database/ src/Alloy.Mvc.Template/App_Data/ Alloy.mdf DefaultSiteContent.episerverdata /XC /XN /XO

EXIT /B %ERRORLEVEL%

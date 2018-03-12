PRODUCT=%1
RELEASE=%2
VERSION=%3
BLD_NUM=%4

rem Download source
echo Downloading source...
set FILENAME=%PRODUCT%-%VERSION%-%BLD_NUM%-source.tar.gz
set SITE=http://latestbuilds.service.couchbase.com/builds/latestbuilds/%PRODUCT%/%RELEASE%/%BLD_NUM%/%FILENAME%
powershell -command "& { (New-Object Net.WebClient).DownloadFile('%SITE%', '%FILENAME%') }" || goto error
echo Extracting source...
cmake -E tar xzf %FILENAME% || goto error

cd libcouchbase
mkdir build
cd build
cmake -G "%MSVS_VERSION%" .. || goto error
cmake --build . || goto error

goto :eof

:error
echo Failed with error %ERRORLEVEL%.
exit /b %ERRORLEVEL%

:eof
exit /b 0

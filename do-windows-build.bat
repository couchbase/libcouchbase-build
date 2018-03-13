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

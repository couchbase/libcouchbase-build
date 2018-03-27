mkdir build
cd build
cmake -DLCB_NO_TESTS=1 -G "%MSVS_VERSION%" .. || goto error
cmake -DLCB_NO_TESTS=1 --build . || goto error

goto :eof

:error
echo Failed with error %ERRORLEVEL%.
exit /b %ERRORLEVEL%

:eof
exit /b 0

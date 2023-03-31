set CurrentFolder=%~dp0
set BUILD_X64=%CurrentFolder%\x64\

echo %CMAKE_HOME%

set CMake_Exe="{CMAKE_PATH}"
set QT_ROOT="{QT_PATH}"

echo Build Folder: %BUILD%
echo CMake Path: %CMake_Exe%

if not exist %BUILD_X64% (
mkdir %BUILD_X64%
)

cd %BUILD_X64%
%CMake_Exe% --version

set PreferredToolArchitecture=x64

%CMake_Exe% ^
	%~dp0 ^
	-G "Visual Studio 16 2019" -A x64  ^
	-DCMAKE_RUNTIME_OUTPUT_DIRECTORY="%CD%\output\bin" ^
	-DCMAKE_LIBRARY_OUTPUT_DIRECTORY="%CD%\output\bin" ^
	-DCMAKE_ARCHIVE_OUTPUT_DIRECTORY="%CD%\output\lib" ^
	-DQT_ROOT_DIR="%QT_ROOT%"

if not %ERRORLEVEL%==0 (goto :exit_fail)

goto exit_success

:exit_no_cmake
echo Make Solution failed

:exit_fail
echo CMake fail
exit 1

:exit_success

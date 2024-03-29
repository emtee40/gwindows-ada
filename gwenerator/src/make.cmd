@echo off
echo.
echo Script for building RC2GW.exe and GWenerator.exe
echo.
echo make: option -h    shows this help only
echo              -r    recreates RC2GW's and GWenerator's parser sources
echo                       from RC.y and RC.l
echo              -gen  recreates GWenerator's own GUI Ada sources with rc2gw
echo              -res  recompiles the resource (gwenerator.rbj) for getting
echo                       bitmaps, icons, etc. actualized
echo.

if "%1"=="-h" goto fin
if "%1"=="-H" goto fin
if "%1"=="--help" goto fin
if "%1"=="-?" goto fin
if "%1"=="/?" goto fin

if not "%1"=="-r" goto comp

rem Build AFLEX
if not exist aflex.exe gnatmake -j0 -gnato -gnatVa -aI..\aflex -D ..\obj\gnatdebg aflex
echo ** Compile the AFLEX (RC.l) file to Ada sources
aflex.exe -i -E rc.l
echo.
gnatchop -w *.a
del *.a
rem Build AYACC
if not exist ayacc.exe gnatmake -j0 -gnato -gnatVa -aI..\ayacc -D ..\obj\gnatdebg ayacc
echo ** Compile the AYACC (RC.y) file to Ada sources

rem --- Old and new Ayacc
ayacc.exe rc.y off off on on >ayacc.log
type ayacc.log
rem --- New Ayacc (Ada France)
rem     Roadblock: https://github.com/Ada-France/ayacc/issues/8
rem     (Issue with private packages)
rem     Cannot make a completely backwards compatible solution.
rem     For using Ada France's version, one needs to wrap yyparse and yylex
rem     within a package, which is a bit nicer. Unfortunately the "old" ayacc
rem     shipped here inserts then a WITH within the parser package.
rem
rem ayacc.exe rc.y -s -v

rem Add verbose details to log file.
echo.          >>ayacc.log
type rc.verbose>>ayacc.log
del  rc.verbose
rem
if exist yyparse.adb del yyparse.adb
if exist rc.ada ren rc.ada yyparse.adb
rem  In case of old ayacc with .a
if exist rc.a   ren rc.a yyparse.adb
shift
rem

:comp

rem **** Here the GWenerator generates a part of itself!... ****

if not exist GWenerator_Resource_GUI.ads rc2gw GWenerator.rc
if not exist GWenerator_Resource_GUI.adb rc2gw GWenerator.rc
if "%1"=="-gen" rc2gw GWenerator.rc
if "%1"=="-gen" shift

if "%1"=="-res" windres GWenerator.rc GWenerator.rbj
if "%1"=="-res" shift
if not exist GWenerator.rbj windres GWenerator.rc GWenerator.rbj

gnatmake %1 %2 gwenerator -PGWenerator.gpr -XGWenerator_Build_Mode=Small
gnatmake %1 %2 rc2gw      -PGWenerator.gpr -XGWenerator_Build_Mode=Debug
copy /b GWenerator.exe ..\GWenerator.exe
copy /b rc2gw.exe ..\RC2GW.exe

:fin

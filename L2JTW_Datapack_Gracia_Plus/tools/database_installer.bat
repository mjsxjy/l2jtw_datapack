@echo off
REM ����q�t�l�ϩR��s���������,�]DP���j�ܰʦӳy��GS�X��
IF EXIST "C:\L2JTW-SVN\L2JTW_GameServer_Gracia" RD /S /Q "C:\L2JTW-SVN\L2JTW_GameServer_Gracia"
IF EXIST "C:\L2JTW-SVN\L2JTW_GameServer_Gracia" RMDIR /S /Q "C:\L2JTW-SVN\L2JTW_GameServer_Gracia"
IF EXIST "..\gameserver\data\stats\armor"   RD /S /Q "..\gameserver\data\stats\armor"
IF EXIST "..\gameserver\data\stats\etcitem" RD /S /Q "..\gameserver\data\stats\etcitem"
IF EXIST "..\gameserver\data\stats\weapon"  RD /S /Q "..\gameserver\data\stats\weapon"
IF EXIST "..\gameserver\data\stats\skills\??00-??99.xml"  DEL /Q "..\gameserver\data\stats\skills\??00-??99.xml"
IF EXIST "..\gameserver\data\stats\armor"   RMDIR /S /Q "..\gameserver\data\stats\armor"
IF EXIST "..\gameserver\data\stats\etcitem" RMDIR /S /Q "..\gameserver\data\stats\etcitem"
IF EXIST "..\gameserver\data\stats\weapon"  RMDIR /S /Q "..\gameserver\data\stats\weapon"
REM ##############################################
REM ## L2JDP Database Installer - (by DrLecter) ##
REM ##############################################
REM ## Interactive script setup -  (by TanelTM) ##
REM ##############################################
REM Copyright (C) 2010 L2J DataPack
REM This program is free software; you can redistribute it and/or modify 
REM it under the terms of the GNU General Public License as published by 
REM the Free Software Foundation; either version 2 of the License, or (at
REM your option) any later version.
REM
REM This program is distributed in the hope that it will be useful, but 
REM WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
REM or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License 
REM for more details.
REM
REM You should have received a copy of the GNU General Public License along 
REM with this program; if not, write to the Free Software Foundation, Inc., 
REM 675 Mass Ave, Cambridge, MA 02139, USA. Or contact the Official L2J
REM DataPack Project at http://www.l2jdp.com, http://www.l2jdp.com/forum or
REM #l2j @ irc://irc.freenode.net

set config_file=vars.txt
set config_version=0

set workdir="%cd%"
set full=0
set stage=0
set logging=0

set upgrade_mode=0
set backup=.
set logdir=.
set safe_mode=1
set cmode=c
set fresh_setup=0

:loadconfig
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
if not exist %config_file% goto configure
ren %config_file% vars.bat
call vars.bat
ren vars.bat %config_file%
call :colors 17
if /i %config_version% == 2 goto ls_section
set upgrade_mode=2
echo �z���G�O�Ĥ@���ϥγo�Ӫ����� database_installer
echo ���O�ڵo�{�w�˸�Ʈw���]�w�ɤw�g�s�b
echo �]���ڱN�ݱz�X�Ӱ��D�A�޾ɱz�~��w��
echo.
echo ��s�]�w�ﶵ�G
echo.
echo (1) �ɤJ���~��ϥ��ª��]�w�G�N�ϥέ쥻�ª���ƨåB�i���s�@�~
echo.
echo (2) �ɤJ���ϥηs���]�w�G�ɤJ�s����ƨåB���s�]�w���
echo.
echo (3) �ɤJ���s����ơG�Ҧ��ª���ƱN�|�����åB�ɤJ�s�����
echo.
echo (4) �d�ݦs�����]�w��
echo.
echo (5) �h�X
echo.
set /P upgrade_mode="��J�Ʀr��A�Ы� Enter�]�w�]�Ȭ��u%upgrade_mode%�v�^: "
if %upgrade_mode%==1 goto ls_section
if %upgrade_mode%==2 goto configure
if %upgrade_mode%==3 goto configure
if %upgrade_mode%==4 (cls&type %config_file%&pause&goto loadconfig)
if %upgrade_mode%==5 goto :eof
goto loadconfig

:colors
if /i "%cmode%"=="n" (
if not "%1"=="17" (	color F ) else ( color )
) else ( color %1 )
goto :eof

:configure
call :colors 17
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
set config_version=2
if NOT %upgrade_mode% == 2 (
set fresh_setup=1
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 5.0\bin

:_MySQL51
if not exist "%ProgramFiles%\MySQL\MySQL Server 5.1\bin\mysql.exe" goto _MySQL55
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 5.1\bin

:_MySQL55
if not exist "%ProgramFiles%\MySQL\MySQL Server 5.5\bin\mysql.exe" goto _MySQL60
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 5.5\bin

:_MySQL60
if not exist "%ProgramFiles%\MySQL\MySQL Server 6.0\bin\mysql.exe" goto _AppServ
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 6.0\bin

:_AppServ
if not exist "%SystemDrive%\AppServ\MySQL\bin\mysql.exe" goto _other
set mysqlBinPath=%SystemDrive%\AppServ\MySQL\bin

:_other
set lsuser=root
set lspass=
set lsdb=l2jdb
set lshost=localhost
set cbuser=root
set cbpass=
set cbdb=l2jcb
set cbhost=localhost
set gsuser=root
set gspass=
set gsdb=l2jdb
set gshost=localhost
set cmode=c
set backup=.
set logdir=.
)
set mysqlPath=%mysqlBinPath%\mysql.exe
echo �s���]�w�ȡG
echo.
echo 1.MySql �{��
echo --------------------
echo �г]�w mysql.exe �M mysqldump.exe ����m
echo.
if "%mysqlBinPath%" == "" (
set mysqlBinPath=use path
echo �S����� MySQL ����m
) else (
echo �д��եH�U�ҧ�쪺 MySQL ��m�A�O�_�i�H�i��ɤJ�@�~
echo.
echo %mysqlPath%
)
if not "%mysqlBinPath%" == "use path" call :binaryfind
echo.
path|find "MySQL">NUL
if %errorlevel% == 0 (
echo �W���O��쪺 MySQL�A����m�N�|�Q�]���w�]�ȡA�p�G�Q����m�Эק�...
set mysqlBinPath=use path
) else (
echo �L�k��� MySQL�A�п�J mysql.exe ����m...
echo.
echo �p�G���T�w�o�O����N��M�p��ާ@�A�Ш���������d�ߩΪ̦� L2JTW �x������o�ݩδM�������T
)
echo.
echo �п�J mysql.exe ����m�G
set /P mysqlBinPath="(default %mysqlBinPath%): "
cls
echo.
echo 2.�n�J���A���]�w
echo --------------------
echo ���@�~�N�|�s�u�ܩҫ��w�� MySQL ���A���A�åB�i��ɤJ�@�~
echo.
set /P lsuser="�ϥΪ̦W�١]�w�]�ȡu%lsuser%�v�^: "
:_lspass
set /P lspass="�ϥΪ̱K�X�]�w�]�ȡu%lspass%�v�^: "
if "%lspass%"=="" goto _lspass
set /P lsdb="��Ʈw�]�w�]�ȡu%lsdb%�v�^: "
set /P lshost="��m�]�w�]�ȡu%lshost%�v�^: "
if NOT "%lsuser%"=="%gsuser%" set gsuser=%lsuser%
if NOT "%lspass%"=="%gspass%" set gspass=%lspass%
if NOT "%lsdb%"=="%gsdb%" set gsdb=%lsdb%
if NOT "%lshost%"=="%gshost%" set gshost=%lshost%
if NOT "%lsuser%"=="%cbuser%" set cbuser=%lsuser%
if NOT "%lspass%"=="%cbpass%" set cbpass=%lspass%
if NOT "%lsdb%"=="%cbdb%" set cbdb=l2jcb
if NOT "%lshost%"=="%cbhost%" set cbhost=%lshost%
echo.
cls
echo.
echo 3-�Q�ת����A���]�w
echo --------------------
echo ���@�~�N�|�s�u�ܡu�Q�ת��M�Ρv�� MySQL ���A���A�åB�i��ɤJ�@�~
echo.
set /P cbuser="�ϥΪ̦W�١]�w�]�ȡu%cbuser%�v�^: "
:_cbpass
set /P cbpass="�ϥΪ̱K�X�]�w�]�ȡu%cbpass%�v�^: "
if "%cbpass%"=="" goto _cbpass
set /P cbdb="��Ʈw�]�w�]�ȡu%cbdb%�v�^: "
set /P cbhost="��m�]�w�]�ȡu%cbhost%�v�^: "
echo.
echo 4.�C�����A���]�w
echo --------------------
set /P gsuser="�ϥΪ̦W�١]�w�]�ȡu%gsuser%�v�^: "
set /P gspass="�ϥΪ̱K�X�]�w�]�ȡu%gspass%�v�^: "
set /P gsdb="��Ʈw�]�w�]�ȡu%gsdb%�v�^: "
set /P gshost="��m�]�w�]�ȡu%gshost%�v�^: "
echo.
echo 5.��L�]�w
echo --------------------
set /P cmode="�C��Ҧ� (c)���C�� �� (n)���L�C��]�w�]�ȡu%cmode%�v�^: "
set /P backup="�ƥ���m�]�w�]�ȡu%backup%�v�^: "
set /P logdir="Logs�T����m�]�w�]�ȡu%logdir%�v�^: "
:safe1
set safemode=y
set /P safemode="Debug �Ҧ��]y/n�A �w�]�ȡu%safemode%�v�^: "
if /i %safemode%==y (set safe_mode=1&goto safe2)
if /i %safemode%==n (set safe_mode=0&goto safe2)
goto safe1
:safe2
echo.
if "%mysqlBinPath%" == "use path" (
set mysqlBinPath=
set mysqldumpPath=mysqldump
set mysqlPath=mysql
) else (
set mysqldumpPath=%mysqlBinPath%\mysqldump.exe
set mysqlPath=%mysqlBinPath%\mysql.exe
)
echo @echo off > %config_file%
echo set config_version=%config_version% >> %config_file%
echo set cmode=%cmode%>> %config_file%
echo set safe_mode=%safe_mode% >> %config_file%
echo set mysqlPath=%mysqlPath%>> %config_file%
echo set mysqlBinPath=%mysqlBinPath%>> %config_file%
echo set mysqldumpPath=%mysqldumpPath%>> %config_file%
echo set lsuser=%lsuser%>> %config_file%
echo set lspass=%lspass%>> %config_file%
echo set lsdb=%lsdb%>> %config_file%
echo set lshost=%lshost% >> %config_file%
echo set cbuser=%cbuser%>> %config_file%
echo set cbpass=%cbpass%>> %config_file%
echo set cbdb=%cbdb%>> %config_file%
echo set cbhost=%cbhost% >> %config_file%
echo set gsuser=%gsuser%>> %config_file%
echo set gspass=%gspass%>> %config_file%
echo set gsdb=%gsdb%>> %config_file%
echo set gshost=%gshost%>> %config_file%
echo set logdir=%logdir%>> %config_file%
echo set backup=%backup%>> %config_file%
echo.
echo �]�w���\�I
echo �A���]�w�ȱN�|�x�s�b�u%config_file%�v�A�Ҧ����b���K�X�N�H�������
echo.
echo �Ы����N���~�� . . .
pause> nul
goto loadconfig

:ls_section
cls
call :colors 17
set cmdline=
set stage=1
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo.
echo ���b�ƥ��n�J���A������Ʈw...
set cmdline="%mysqldumpPath%" --add-drop-table -h %lshost% -u %lsuser% --password=%lspass% %lsdb% ^> "%backup%\loginserver_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto lsdbok
REM if %safe_mode% == 1 goto omfg
:ls_err1
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo.
echo �ƥ����ѡI
echo ��]�O�]����Ʈw���s�b
echo �{�b�i�H���A�إ� %lsdb%�A�Ϊ��~��䥦�]�w
echo.
:ls_ask1
set lsdbprompt=y
echo �إߵn�J���A������Ʈw�H
echo.
echo (y)�T�w
echo.
echo (n)����
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p lsdbprompt=�п�ܡ]�w�]��-�T�w�^:
if /i %lsdbprompt%==y goto lsdbcreate
if /i %lsdbprompt%==n goto cb_backup
if /i %lsdbprompt%==r goto configure
if /i %lsdbprompt%==q goto end
goto ls_ask1

:omfg
cls
call :colors 57
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo.
echo ����ɥX�{���~�G
echo.
echo "%cmdline%"
echo.
echo ��ĳ�ˬd�@�U�]�w����ơA�H�T�O�Ҧ���J���ƭȨS�����~�I
echo.
if %stage% == 1 set label=ls_err1
if %stage% == 2 set label=ls_err2
if %stage% == 3 set label=cb_backup
if %stage% == 4 set label=cb_err1
if %stage% == 5 set label=cb_err2
if %stage% == 6 set label=gs_backup
if %stage% == 7 set label=gs_err1
if %stage% == 8 set label=gs_err2
if %stage% == 9 set label=horrible_end
if %stage% == 10 set label=horrible_end
:omfgask1
set omfgprompt=q
echo (c)�~��
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p omfgprompt=�п�ܡ]�w�]��-�h�X�^:
if  /i %omfgprompt%==c goto %label%
if  /i %omfgprompt%==r goto configure
if  /i %omfgprompt%==q goto horrible_end
goto omfgask1

:lsdbcreate
call :colors 17
set cmdline=
set stage=2
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo.
echo ���b�إߵn�J���A������Ʈw...
set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -e "CREATE DATABASE %lsdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto logininstall
if %safe_mode% == 1 goto omfg
:ls_err2
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo �n�J���A������Ʈw�إߥ��ѡI
echo.
echo �i�઺��]�G
echo 1.��J����ƿ��~�A�Ҧp�G�ϥΪ̦W��/�ϥΪ̱K�X/��L�������
echo 2.�ϥΪ̡u%lsuser%�v���v������ 
echo 3.��Ʈw�w�s�b
echo.
echo ���ˬd�]�w�åB�ץ��A�Ϊ̪������s�]�w
echo.
:ls_ask2
set omfgprompt=q
echo (c)�~��
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p omfgprompt=�п�ܡ]�w�]��-�h�X�^:
if /i %omfgprompt%==c goto cb_backup
if /i %omfgprompt%==q goto horrible_end
if /i %omfgprompt%==r goto configure
goto ls_ask2

:lsdbok
call :colors 17
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo.
:asklogin
if %fresh_setup%==0 (
set loginprompt=s
set msg=�w�]��-�ٲ�
) else (
set loginprompt=x
set msg=�S���w�]��
)
echo �n�J���A������Ʈw�w�ˡG
echo.
echo (f)����G�N�����Ҧ��ª���ơA���s�ɤJ�s�����
echo.
echo (s)�ٲ��G���L���ﶵ
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p loginprompt=�п�ܡ]%msg%�^:
if /i %loginprompt%==f goto logininstall
if /i %loginprompt%==s goto cb_backup
if /i %loginprompt%==r goto configure
if /i %loginprompt%==q goto end
goto asklogin

:logininstall
set stage=3
call :colors 17
set cmdline=
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo ���b�����n�J���A������Ʈw�A�M��ɤJ�s����Ʈw...
set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% ^< login_install.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
goto cb_backup

:cb_backup
cls
call :colors 17
set cmdline=
REM [Update by rocknow] if %full% == 1 goto communityinstall
set stage=4
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo.
echo ���b�ƥ��u�Q�ת��M�Ρv����Ʈw...
set cmdline="%mysqldumpPath%" --add-drop-table -h %cbhost% -u %cbuser% --password=%cbpass% %cbdb% ^> "%backup%\cbserver_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto cbdbok
REM if %safe_mode% == 1 goto omfg
:cb_err1
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo.
echo �ƥ����ѡI
echo ��]�O�]���u�Q�ת��M�Ρv����Ʈw���s�b
echo �{�b�i�H���A�إ� %cbdb%�A�Ϊ��~��䥦�]�w
echo.
:cb_ask1
set cbdbprompt=y
echo �إߡu�Q�ת��M�Ρv����Ʈw�H
echo.
echo (y)�T�w
echo.
echo (n)����
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p cbdbprompt=�п�ܡ]�w�]��-�T�w�^:
if /i %cbdbprompt%==y goto cbdbcreate
if /i %cbdbprompt%==n goto gs_backup
if /i %cbdbprompt%==r goto configure
if /i %cbdbprompt%==q goto end
goto cb_ask1

:cbdbcreate
call :colors 17
set cmdline=
set stage=5
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo.
echo ���b�إߡu�Q�ת��M�Ρv����Ʈw...
set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -e "CREATE DATABASE %cbdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto communityinstall
if %safe_mode% == 1 goto omfg
:cb_err2
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo �u�Q�ת��M�Ρv����Ʈw�إߥ��ѡI
echo.
echo �i�઺��]�G
echo 1.��J����ƿ��~�A�Ҧp�G�ϥΪ̦W��/�ϥΪ̱K�X/��L�������
echo 2.�ϥΪ̡u%cbuser%�v���v������ 
echo 3.��Ʈw�w�s�b
echo.
echo ���ˬd�]�w�åB�ץ��A�Ϊ̪������s�]�w
echo.
:cb_ask2
set omfgprompt=q
echo (c)�~��
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p omfgprompt=�п�ܡ]�w�]��-�h�X�^:
if /i %omfgprompt%==c goto gs_backup
if /i %omfgprompt%==q goto horrible_end
if /i %omfgprompt%==r goto configure
goto cb_ask2

:cbdbok
call :colors 17
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo.
:askcommunity
if %fresh_setup%==0 (
set communityprompt=u
set msg=�w�]��-��s
) else (
set communityprompt=x
set msg=�S���w�]��
)
echo �u�Q�ת��M�Ρv����Ʈw�w�ˡG
echo.
echo (f)����G�N�����Ҧ��ª���ơA���s�ɤJ�s�����
echo.
echo (u)��s�G�N�O�d�Ҧ��ª���ơA�åB�i���s�@�~
echo.
echo (s)�ٲ��G���L���ﶵ
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p communityprompt=�п�ܡ]%msg%�^: 
if /i %communityprompt%==f goto communityinstall
if /i %communityprompt%==u goto upgradecbinstall
if /i %communityprompt%==s goto gs_backup
if /i %communityprompt%==r goto configure
if /i %communityprompt%==q goto end
goto askcommunity

:communityinstall
set stage=6
call :colors 17
set cmdline=
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo ���b�����u�Q�ת��M�Ρv����Ʈw�A�M��ɤJ�s����Ʈw...
set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% ^< community_install.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
goto upgradecbinstall

:upgradecbinstall
set stage=6
set cmdline=
if %full% == 1 (
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo �w�˷s���u�Q�ת��M�Ρv��Ʈw...
) else (
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo ��s�u�Q�ת��M�Ρv��Ʈw...
)
if %logging% == 0 set output=NUL
set dest=cb
for %%i in (..\cb_sql\*.sql) do call :dump %%i

echo done...
echo.
goto gs_backup

:gs_backup
cls
call :colors 17
set cmdline=
if %full% == 1 goto fullinstall
set stage=7
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo.
echo ���b�ƥ��C�����A������Ʈw...
set cmdline="%mysqldumpPath%" --add-drop-table -h %gshost% -u %gsuser% --password=%gspass% %gsdb% ^> "%backup%\gameserver_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto gsdbok
rem if %safe_mode% == 1 goto omfg
:gs_err1
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo.
echo �ƥ����ѡI
echo ��]�O�]����Ʈw���s�b
echo �{�b�i�H���A�إ� %gsdb%�A�Ϊ��~��䥦�]�w
echo.
:askgsdb
set gsdbprompt=y
echo �إ߹C�����A������Ʈw�H
echo.
echo (y)�T�w
echo.
echo (n)����
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p gsdbprompt=�п�ܡ]�w�]��-�T�w�^:
if /i %gsdbprompt%==y goto gsdbcreate
if /i %gsdbprompt%==n goto horrible_end
if /i %gsdbprompt%==r goto configure
if /i %gsdbprompt%==q goto end
goto askgsdb

:gsdbcreate
call :colors 17
set stage=8
set cmdline=
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo ���b�إ߹C�����A������Ʈw...
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -e "CREATE DATABASE %gsdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto fullinstall
if %safe_mode% == 1 goto omfg
:gs_err2
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo.
echo �C�����A������Ʈw�إߥ��ѡI
echo.
echo �i�઺��]�G
echo 1.��J����ƿ��~�A�Ҧp�G�ϥΪ̦W��/�ϥΪ̱K�X/��L�������
echo 2.�ϥΪ̡u%gsuser%�v���v������ 
echo 3.��Ʈw�w�s�b
echo.
echo ���ˬd�]�w�åB�ץ��A�Ϊ̪������s�]�w
echo.
:askgsdbcreate
set omfgprompt=q
echo (r)���s����åB�i��]�w
echo.
echo (q)�h�X
echo.
set /p omfgprompt=�п�ܡ]�w�]��-�h�X�^:
if /i %omfgprompt%==r goto configure
if /i %omfgprompt%==q goto horrible_end
goto askgsdbcreate

:gsdbok
call :colors 17
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo.
:asktype
set installtype=u
echo �C�����A������Ʈw�w�ˡG
echo.
echo (f)����G�N�����Ҧ��ª���ơA���s�ɤJ�s�����
echo.
echo (u)��s�G�N�O�d�Ҧ��ª���ơA�åB�i���s�@�~
echo.
echo (s)�ٲ��G���L���ﶵ
echo.
echo (q)�h�X
echo.
set /p installtype=�п�ܡ]�w�]��-��s�^:
if /i %installtype%==f goto fullinstall
if /i %installtype%==u goto upgradeinstall
if /i %installtype%==s goto custom
if /i %installtype%==q goto end
goto asktype

:fullinstall
call :colors 17
set stage=9
set cmdline=
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo ���b�����C�����A������Ʈw�A�M��ɤJ�s����Ʈw...
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< full_install.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
echo.
echo �C����Ʈw��������
goto upgradeinstall

:upgradeinstall
set stage=9
set cmdline=
if %full% == 1 (
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo �w�˷s���C����Ʈw...
) else (
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo ��s�C����Ʈw...
)
if %logging% == 0 set output=NUL
set dest=ls
for %%i in (..\sql\login\*.sql) do call :dump %%i
set dest=gs
for %%i in (..\sql\server\*.sql) do call :dump %%i

echo ����...
echo.
goto custom

:dump
set cmdline=
if /i %full% == 1 (set action=�w��) else (set action=��s)
echo %action% %1>>"%output%"
echo %action% %~nx1
if "%dest%"=="ls" set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% ^< %1 2^>^>"%output%"
if "%dest%"=="cb" set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% ^< %1 2^>^>"%output%"
if "%dest%"=="gs" set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %1 2^>^>"%output%"
%cmdline%
if %logging%==0 if NOT %ERRORLEVEL%==0 call :omfg2 %1
goto :eof

:omfg2
cls
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
echo.
echo �X�{���~�G
echo %mysqlPath% -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb%
echo.
echo �ɮ� %~nx1
echo.
echo �B�z�覡�H
echo.
:askomfg2
set ntpebcak=c
echo (l)�إ߰T���ɮפ�K�d��
echo.
echo (c)�~��
echo.
echo (r)���s�]�w
echo.
echo (q)�h�X
echo.
set /p ntpebcak=�п�ܡ]�w�]��-�~��^:
if  /i %ntpebcak%==c (call :colors 17 & goto :eof)
if  /i %ntpebcak%==l (call :logginon %1 & goto :eof)
if  /i %ntpebcak%==r (call :configure & exit)
if  /i %ntpebcak%==q (call :horrible_end & exit)
goto askomfg2

:logginon
cls
call :colors 17
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
set logging=1
if %full% == 1 (
  set output=%logdir%\install-%~nx1.log
) else (
  set output=%logdir%\upgrade-%~nx1.log
)
echo.
echo �إ߰T���ɮ�...
echo.
echo �ɮ׬��u%output%�v
echo.
echo �p�G���ɮפw�s�b�A�жi��ƥ��A�_�h�N�|�л\�L�h
echo.
echo �Ы����N��}�l�i�� . . .
pause>NUL
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^<..\sql\%1 2^>^>"%output%"
date /t >"%output%"
time /t >>"%output%"
%cmdline%
echo �إ߰T�����...
call :colors 17
set logging=0
set output=NUL
goto :eof

:custom
cd ..\sql\server\
set charprompt=y
set /p charprompt=�w�ˡu�ޯ�/���~/¾�~/NPC���ܡv�����: (y) �T�w �� (N) �����H�]�w�]��-�T�w�^:
if /i %charprompt%==y "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < skill_tw.sql 2>>NUL
if /i %charprompt%==y "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < item_tw.sql 2>>NUL
if /i %charprompt%==y "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < char_templates_tw.sql 2>>NUL
if /i %charprompt%==y "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < auto_chat_text_tw.sql 2>>NUL
echo �w�� skill_tw.sql
echo �w�� item_tw.sql
echo �w�� char_templates_tw.sql
echo �w�� auto_chat_text_tw.sql
echo ����...
echo.
echo ���`�N�G�����t�Φw�ˤ���Ʒ|���ѡA�ɭP�C�����X�{�ýX
echo �@�@�@�@�p�G�J��o�ر��ΡA�ЦA��ʾɤJ SQL �̭���
echo �@�@�@�@skill_tw.sql / item_tw.sql / messagetable /
echo �@�@�@�@auto_chat_text_tw / char_templates_tw �o 5 �� SQL
echo.
set cstprompt=y
set /p cstprompt=�w�� custom �ۭq��ƪ�: (y) �T�w �� (N) ���� �� (q) �h�X�H�]�w�]��-�T�w�^:
if /i %cstprompt%==y goto cstinstall
if /i %cstprompt%==n goto newbie_helper
if /i %cstprompt%==q goto end
goto newbie_helper
:cstinstall
echo �w�� custom �ۭq���e
cd ..\sql\server\custom\
echo @echo off> temp.bat
if exist errors.txt del errors.txt
for %%i in (*.sql) do echo "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %%i 2^>^> custom_errors.txt >> temp.bat
call temp.bat> nul
del temp.bat
move custom_errors.txt %workdir%
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo custom �ۭq��ƪ�[�J��Ʈw����
echo �Ҧ����~��T�N��J�ucustom_errors.txt�v
echo.
echo �Ъ`�N�A�p�G�n�ϳo�Ǧۭq��ƪ����ҥ�
echo �A�����ק� config ���ɮ׳]�w
echo.
pause
cd %workdir%
title L2JDP installer - Game Server database setup - L2J Mods
cls
echo L2J provides a basic infraestructure for some non-retail features
echo (aka L2J mods) to get enabled with a minimum of changes.
echo.
echo Some of these mods would require extra tables in order to work
echo and those tables could be created now if you wanted to.
echo.
cd ..\sql\server\mods\
REM L2J mods that needed extra tables to work properly, should be 
REM listed here. To do so copy & paste the following 4 lines and
REM change them properly:
REM MOD: Wedding.
set modprompt=n
set /p modprompt="�w�ˡu���B�Ҳաv��ƪ�: (y) �T�w �� (N) �����H"
if /i %modprompt%==y "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < mods_wedding.sql 2>>NUL

title L2JDP installer - Game Server database setup - L2J Mods setup complete
cls
echo Database structure for L2J mods finished.
echo.
echo Remember that in order to get these additions actually working 
echo you need to edit your configuration files. 
echo.
pause
cd %workdir%
goto newbie_helper


:newbie_helper
call :colors 17
set stage=10
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
if %full% == 1 goto end
echo.
echo sql/server/updates ����Ƨ��O�Ψӧ�s��Ʈw�榡
echo.
echo �Ъ������U Enter �i���s
:asknb
set nbprompt=a
echo.
echo �{�b�n�p��i��H
echo.
echo (a)�۰ʡG�i�J sql/updates ����Ƨ����A�ɤJ��s��Ʈw�榡�� sql
echo.
echo (s)�ٲ��G�������Ѥ�ʦw��
echo.
set /p nbprompt=�п�ܡ]�w�]��-�۰ʡ^:
if /i %nbprompt%==a goto nblsinstall
if /i %nbprompt%==l goto nblsinstall
if /i %nbprompt%==c goto nbcbinstall
if /i %nbprompt%==g goto nbgsinstall
if /i %nbprompt%==s goto end
goto asknb
:nblsinstall
cd ..\sql\login\updates\
echo @echo off> temp.bat
if exist lserrors.txt del lserrors.txt
for %%i in (*.sql) do echo "%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% ^< %%i 2^>^> lserrors.txt >> temp.bat
call temp.bat> nul
del temp.bat
move lserrors.txt %workdir%
cd %workdir%
if /i %nbprompt%==l goto nbfinished
:nbcbinstall
cd ..\cb_sql\updates\
echo @echo off> temp.bat
if exist cberrors.txt del cberrors.txt
for %%i in (*.sql) do echo "%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% ^< %%i 2^>^> cberrors.txt >> temp.bat
call temp.bat> nul
del temp.bat
move cberrors.txt %workdir%
cd %workdir%
if /i %nbprompt%==c goto nbfinished
:nbgsinstall
cd ..\sql\server\updates\
echo @echo off> temp.bat
if exist gserrors.txt del gserrors.txt
for %%i in (*.sql) do echo "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %%i 2^>^> gserrors.txt >> temp.bat
call temp.bat> nul
del temp.bat
move gserrors.txt %workdir%
cd %workdir%
:nbfinished
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo �۰ʧ�s�����A�Ҧ����~��T�N��J�uerrors.txt�v
echo.
echo ���ɷ|�X�{�@�ǿ��~�A�Ҧp��歫�ơA���o�ذT���N���βz�|
echo.
echo �uDuplicate column name�v
echo.
echo ���T�������ƪ����
echo.
echo �Цh�`�N�����H�U���T��
echo.
echo �uTable doesn't exist�v
echo.
echo �����Ҥl...
echo.
pause
goto end

:binaryfind
if EXIST "%mysqlBinPath%" (echo ��쪺 MySQL) else (echo �S����� MySQL�A�Цb�U����J���T����m...)
goto :eof

:horrible_end
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo �o�Ϳ��~�A�Ьd�߬������D�A�M�����U
echo.
echo 1- �Q�ά��������d��
echo	(http://l2jdp.com/trac/wiki)
echo 2- L2JTW �x������d��
echo	(http://www.l2jtw.com/)
echo.
echo.
echo ��������~�T���i�H�b�Q�תO�W�o��A�ФŪ�����}�o�H���߰�
echo.
echo Datapack �����uSVN version�v:
svnversion -n 2>NUL
echo.
if %ERRORLEVEL% == 9009 (
echo   SVN ��ƿ��~
echo   �ФU���åB�w�˦��{���G
echo   http://subversion.tigris.org/servlets/ProjectDocumentList?folderID=91
echo.
)
set dpvf="..\config\l2jdp-version.properties"
echo Datapack �����G
if NOT EXIST %dpvf% (
echo   %dpvf% �ɮ׵L�k���I
echo   �ЧQ�� Eclipse �Ϊ� TortiseSVN �U�� Datapack�A�åB�i���s
) else (
type %dpvf% | find "version" 2> NUL
if not %ERRORLEVEL% == 0 (
echo   ��T�X���G
echo   %dpvf% �ɮצ��~�I
echo   �нT�w�ɮ׫O�d�A�åB�ɱ`�i���s
echo %ERRORLEVEL%
))
echo.
rem del %config_file%
pause
goto end

:end
call :colors 17
title L2JTW Datapack �w�� - For�GL2JTW GameServer Freya Alpha
cls
echo.
echo L2JTW Datapack �w�˵{�� - For�GL2JTW GameServer Freya Alpha
echo (C) 2007-2010 L2JTW Datapack �}�o�ζ�
echo.
echo �P�¨ϥ� L2JTW ���A��
echo ������T�i�H�b http://www.l2jtw.com �d�ߨ�
echo.
pause
color

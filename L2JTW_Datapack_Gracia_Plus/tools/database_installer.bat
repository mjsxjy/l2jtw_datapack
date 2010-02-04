@echo off
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
REM #l2j-datapack @ irc://irc.freenode.net

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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
if not exist %config_file% goto configure
ren %config_file% vars.bat
call vars.bat
ren vars.bat %config_file%
call :colors 17
if /i %config_version% == 2 goto ls_section
set upgrade_mode=2
echo It seems to be the first time you run this version of
echo database_installer but I found a settings file already.
echo I'll hopefully ask this questions just once.
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
set config_version=2
if NOT %upgrade_mode% == 2 (
set fresh_setup=1
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 5.0\bin

:_MySQL51
if not exist "%ProgramFiles%\MySQL\MySQL Server 5.1\bin\mysql.exe" goto _MySQL60
set mysqlBinPath=%ProgramFiles%\MySQL\MySQL Server 5.1\bin

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
echo �й��եH�U�ҧ�쪺 MySQL ��m�A�O�_�i�H�i��ɤJ�@�~
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
echo ���@�~�N�|�s�u�ܰQ�ת��M�Ϊ� MySQL ���A���A�åB�i��ɤJ�@�~
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
echo.
echo ���նi��ƥ��n�J���A������Ʈw...
set cmdline="%mysqldumpPath%" --add-drop-table -h %lshost% -u %lsuser% --password=%lspass% %lsdb% ^> "%backup%\loginserver_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto lsdbok
REM if %safe_mode% == 1 goto omfg
:ls_err1
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
echo.
echo �ƥ����ѡI
echo ��]�O�]����Ʈw���s�b
echo �{�b�i�H�������A�إ� %lsdb%�A�Ϊ��~��䥦�]�w
echo.
:ls_ask1
set lsdbprompt=y
echo ���իإߵn�J���A������Ʈw�G
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
echo.
echo Trying to create a Login Server database...
set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -e "CREATE DATABASE %lsdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto logininstall
if %safe_mode% == 1 goto omfg
:ls_err2
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
echo ��Ʈw�إߥ��ѡI
echo.
echo �i�઺��]�G
echo 1.�ҿ�J����ƿ��~�A�ϥΪ̦W��/�ϥΪ̱K�X/��L�������
echo 2.�ϥΪ̡u%lsuser%�v�S���������v���ާ@��Ʈw 
echo 3.��Ʈw�i��w�g�s�b
echo.
echo �Э��s�ˬd�]�w�åB�ץ��X�����a��
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
echo.
:asklogin
if %fresh_setup%==0 (
set loginprompt=s
set msg=�w�]��-�ٲ�
) else (
set loginprompt=x
set msg=�S���w�]��
)
echo �n�J���A������Ʈw�w�������G
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
echo ���b�����n�J���A������ơA�M��ɤJ�s�����...
set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% ^< login_install.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
set full=1
goto cb_backup

:cb_backup
cls
call :colors 17
set cmdline=
if %full% == 1 goto communityinstall
set stage=4
title L2JDP installer - Community Board Server database setup
echo.
echo Trying to make a backup of your cbserver database.
set cmdline="%mysqldumpPath%" --add-drop-table -h %cbhost% -u %cbuser% --password=%cbpass% %cbdb% ^> "%backup%\cbserver_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto cbdbok
REM if %safe_mode% == 1 goto omfg
:cb_err1
call :colors 47
title L2JDP installer - Community Board Server database setup ERROR!!!
cls
echo.
echo �ƥ����ѡI
echo ��]�O�]���Q�ת�����Ʈw���s�b
echo �{�b�i�H�������A�إ� %cbdb%�A�Ϊ��~��䥦�]�w
echo.
:cb_ask1
set cbdbprompt=y
echo ���իإ߰Q�ת�����Ʈw�G
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
title L2JDP installer - Communty Board Server database setup - DB Creation
echo.
echo Trying to create a Community Board Server database...
set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -e "CREATE DATABASE %cbdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto communityinstall
if %safe_mode% == 1 goto omfg
:cb_err2
call :colors 47
title L2JDP installer - Community Board Server database setup - DB Creation error
cls
echo An error occured while trying to create a database for 
echo your Community Board server.
echo.
echo Possible reasons:
echo 1-You provided innacurate info , check user, password, etc.
echo 2-User %cbuser% don't have enough privileges for 
echo database creation. Check your MySQL privileges.
echo 3-Database exists already...?
echo.
echo Unless you're sure that the pending actions of this tool 
echo could work, i'd suggest you to look for correct values
echo and try this script again later.
echo.
:cb_ask2
set omfgprompt=q
echo (c)ontinue running
echo.
echo (r)econfigure
echo.
echo (q)uit now
echo.
set /p omfgprompt= Choose (default quit):
if /i %omfgprompt%==c goto gs_backup
if /i %omfgprompt%==q goto horrible_end
if /i %omfgprompt%==r goto configure
goto cb_ask2

:cbdbok
call :colors 17
title L2JDP installer - Community Board Server database setup - WARNING!!!
echo.
:askcommunity
if %fresh_setup%==0 (
set communityprompt=s
set msg=default skip
) else (
set communityprompt=x
set msg=no default for fresh install
)
echo COMMUNITYSERVER DATABASE install type:
echo.
echo (f)ull: WARNING! I'll destroy ALL of your existing community
echo    data (i really mean it: mail, forum, memo.. ALL)
echo.
echo (u)pgrade: I'll do my best to preserve all of your community
echo    data.
echo.
echo (s)kip: I'll take you to the gameserver database
echo    installation and upgrade options.
echo.
echo (r)econfigure: You'll be able to redefine MySQL path,
echo    user and database information and start over with
echo    those fresh values.
echo.
echo (q)uit
echo.
set /p communityprompt= Choose (%msg%) : 
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
title L2JDP installer - Community Board Server database setup - Full install
echo Deleting communityserver tables for new content.
set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% ^< community_install.sql 2^> NUL
%cmdline%
if not %ERRORLEVEL% == 0 goto omfg
goto upgradecbinstall

:upgradecbinstall
set stage=6
set cmdline=
if %full% == 1 (
title L2JDP installer - Community Board Server database setup - Installing...
echo Installing new communityserver content.
) else (
title L2JDP installer - Community Board Server database setup - Upgrading...
echo Upgrading communityserver content.
)
if %logging% == 0 set output=NUL
set dest=cb
for %%i in (
clan_introductions.sql
comments.sql
forums.sql
gameservers.sql
posts.sql
topics.sql
) do call :dump %%i

echo done...
echo.
goto gs_backup

:gs_backup
cls
call :colors 17
set cmdline=
if %full% == 1 goto fullinstall
set stage=7
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
echo.
echo ���b�ƥ��쥻����Ʈw...
set cmdline="%mysqldumpPath%" --add-drop-table -h %gshost% -u %gsuser% --password=%gspass% %gsdb% ^> "%backup%\gameserver_backup.sql" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto gsdbok
rem if %safe_mode% == 1 goto omfg
:gs_err1
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
echo.
echo �ƥ����ѡI
echo ��Ʈw�ä��s�b
echo �O�_�ݭn�إ� %gsdb% ��Ʈw
echo.
:askgsdb
set gsdbprompt=y
echo �O�_�n�إ߹C�����A������Ʈw�H
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
echo ���իإ߹C�����A������Ʈw...
set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -e "CREATE DATABASE %gsdb%" 2^> NUL
%cmdline%
if %ERRORLEVEL% == 0 goto fullinstall
if %safe_mode% == 1 goto omfg
:gs_err2
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
echo.
echo �C�����A������Ʈw�إߥX���I
echo.
echo �i�઺��]�G
echo 1.��J����Ƥ�����
echo 2.�ϥΪ̡u%gsuser%�v���v������ 
echo 3.��Ʈw�w�s�b
echo.
echo �Ьd����]��A�~�����A�Ϊ̪����i�歫�s�]�w
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
echo.
:asktype
set installtype=u
echo �C�����A������Ʈw�w�ˡG
echo.
echo (f)����G�N�R���Ҧ��ª����
echo.
echo (u)��s�G�N�O�d�Ҧ��ª���ơA�åB�i���s�@�~
echo.
echo (s)�ٲ�
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
echo �����Ҧ��C����Ʈw�����...
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
echo �w�˷s���C����Ʈw...
) else (
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
echo ��s�C����Ʈw...
)
if %logging% == 0 set output=NUL
set dest=ls
for %%i in (
accounts.sql
account_data.sql
gameservers.sql
) do call :dump %%i
set dest=gs
if %full% == 1 (
for %%i in (
access_levels.sql
auction.sql
castle.sql
clanhall.sql
fort.sql
forums.sql
seven_signs_festival.sql
seven_signs_status.sql
) do call :dump %%i 
)
for %%i in (
admin_command_access_rights.sql
armor.sql
armorsets.sql
auction_bid.sql
auction_watch.sql
auto_announcements.sql
auto_chat.sql
auto_chat_text.sql
castle_door.sql
castle_doorupgrade.sql
castle_functions.sql
castle_manor_procure.sql
castle_manor_production.sql
castle_siege_guards.sql
char_creation_items.sql
char_templates.sql
character_friends.sql
character_hennas.sql
character_instance_time.sql
character_macroses.sql
character_quest_global_data.sql
character_quests.sql
character_raid_points.sql
character_recipebook.sql
character_recipeshoplist.sql
character_recommends.sql
character_shortcuts.sql
character_skills.sql
character_skills_save.sql
character_subclasses.sql
character_tpbookmark.sql
characters.sql
clan_data.sql
clan_notices.sql
clan_privs.sql
clan_skills.sql
clan_subpledges.sql
clan_wars.sql
clanhall_functions.sql
class_list.sql
cursed_weapons.sql
dimensional_rift.sql
droplist.sql
enchant_skill_trees.sql
etcitem.sql
fish.sql
fishing_skill_trees.sql
fort_doorupgrade.sql
fort_functions.sql
fort_siege_guards.sql
fort_spawnlist.sql
fort_staticobjects.sql
fortsiege_clans.sql
four_sepulchers_spawnlist.sql
games.sql
global_tasks.sql
grandboss_data.sql
grandboss_list.sql
helper_buff_list.sql
henna.sql
henna_trees.sql
heroes.sql
item_attributes.sql
items.sql
itemsonground.sql
locations.sql
lvlupgain.sql
mapregion.sql
merchant_areas_list.sql
merchant_buylists.sql
merchant_lease.sql
merchant_shopids.sql
merchants.sql
messages.sql
minions.sql
npc.sql
npc_buffer.sql
npcAIData.sql
npcskills.sql
olympiad_data.sql
olympiad_nobles.sql
olympiad_nobles_eom.sql
pets.sql
pets_skills.sql
pets_stats.sql
pledge_skill_trees.sql
posts.sql
quest_global_data.sql
raidboss_spawnlist.sql
random_spawn.sql
random_spawn_loc.sql
seven_signs.sql
siege_clans.sql
skill_learn.sql
skill_residential.sql
skill_spellbooks.sql
skill_trees.sql
spawnlist.sql
special_skill_trees.sql
teleport.sql
topic.sql
transform_skill_trees.sql;
walker_routes.sql
weapon.sql
zone_vertices.sql
mods_wedding.sql
chatdata.sql
messagetable.sql
npcCharData.sql
skill.sql
l2jtw_addon_0.sql
l2jtw_addon_1.sql
l2jtw_addon_2.sql
) do call :dump %%i

echo ����...
echo.
goto custom

:dump
set cmdline=
if /i %full% == 1 (set action=�w��) else (set action=��s)
echo %action% %1>>"%output%"
echo %action% %~nx1
if "%dest%"=="ls" set cmdline="%mysqlPath%" -h %lshost% -u %lsuser% --password=%lspass% -D %lsdb% ^< ..\sql\%1 2^>^>"%output%"
if "%dest%"=="cb" set cmdline="%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% ^< ..\cb_sql\%1 2^>^>"%output%"
if "%dest%"=="gs" set cmdline="%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< ..\sql\%1 2^>^>"%output%"
%cmdline%
if %logging%==0 if NOT %ERRORLEVEL%==0 call :omfg2 %1
goto :eof

:omfg2
cls
call :colors 47
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
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
cd ..\sql\
set charprompt=y
set /p charprompt=�w�ˡu�ޯ�/¾�~/NPC���ܡv�����: (y) �T�w �� (N) �����H�]�w�]��-�T�w�^:
if /i %charprompt%==y "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < skill_tw.sql 2>>NUL
if /i %charprompt%==y "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < char_templates_tw.sql 2>>NUL
if /i %charprompt%==y "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% < auto_chat_text_tw.sql 2>>NUL
echo �w�� skill_tw.sql
echo �w�� char_templates_tw.sql
echo �w�� auto_chat_text_tw.sql
echo ����...
echo.
echo ���`�N�G�����t�Φw�ˤ���Ʒ|���ѡA�ɭP�C�����X�{�ýX
echo �@�@�@�@�p�G�J��o�ر��ΡA�ЦA��ʾɤJ SQL �̭���
echo �@�@�@�@skill_tw.sql / auto_chat_text_tw / messagetable /
echo �@�@�@�@char_templates_tw / auto_announcements �o 5 �� SQL
echo.
set cstprompt=n
set /p cstprompt=�w�� custom �ۭq��ƪ�: (y) �T�w �� (N) ���� �� (q) �h�X�H�]�w�]��-�����^:
if /i %cstprompt%==y goto cstinstall
if /i %cstprompt%==n goto newbie_helper
if /i %cstprompt%==q goto end
goto newbie_helper
:cstinstall
echo �w�� custom �ۭq���e
cd ..\sql\custom\
echo @echo off> temp.bat
if exist errors.txt del errors.txt
for %%i in (*.sql) do echo "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %%i 2^>^> custom_errors.txt >> temp.bat
call temp.bat> nul
del temp.bat
move custom_errors.txt %workdir%
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
echo custom �ۭq��ƪ�[�J��Ʈw����
echo �Ҧ����~��T�N��J�ucustom_errors.txt�v
echo.
echo �Ъ`�N�A�p�G�n�ϳo�Ǧۭq��ƪ����ҥ�
echo �A�����ק� config ���ɮ׳]�w
echo.
pause
cd %workdir%
goto newbie_helper
title L2JDP installer - Game Server database setup - L2J Mods
cls
echo L2J provides a basic infraestructure for some non-retail features
echo (aka L2J mods) to get enabled with a minimum of changes.
echo.
echo Some of these mods would require extra tables in order to work
echo and those tables could be created now if you wanted to.
echo.
cd ..\sql\mods\
REM echo L2J mods that needed extra tables to work properly, should be
REM echo listed here. To do so copy & paste the following 4 lines and
REM echo change them properly:
REM echo �~���G���B
set modprompt=n
set /p modprompt="�w�ˡu���B�~���v��ƪ�: (y) �T�w �� (N) �����H"
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
if %full% == 1 goto end
echo.
echo sql/updates ����Ƨ��O�Ψӧ�s��Ʈw�榡
echo.
echo �p�G���Q�F�ѧ�s�F����A�Ъ����i���s
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
if /i %nbprompt%==a goto nbinstall
if /i %nbprompt%==c goto nbcbinstall
if /i %nbprompt%==g goto nbinstall
if /i %nbprompt%==s goto end
goto asknb
:nbinstall
cd ..\sql\updates\
echo @echo off> temp.bat
if exist errors.txt del errors.txt
for %%i in (*.sql) do echo "%mysqlPath%" -h %gshost% -u %gsuser% --password=%gspass% -D %gsdb% ^< %%i 2^>^> errors.txt >> temp.bat
call temp.bat> nul
del temp.bat
move errors.txt %workdir%
cd %workdir%
if /i %nbprompt%==g goto nbfinished
:nbcbinstall
cd ..\cb_sql\updates\
echo @echo off> temp.bat
if exist cberrors.txt del cberrors.txt
for %%i in (*.sql) do echo "%mysqlPath%" -h %cbhost% -u %cbuser% --password=%cbpass% -D %cbdb% ^< %%i 2^>^> cberrors.txt >> temp.bat
call temp.bat> nul
del temp.bat
move cberrors.txt %workdir%
cd %workdir%
:nbfinished
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
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
set dpvf="..\gameserver\config\l2jdp-version.properties"
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
title L2JTW Datapack �w�� - For�GL2JTW GameServer Gracia Alpha
cls
echo.
echo L2JTW Datapack �w�˵{�� - For�GL2JTW GameServer Gracia Alpha
echo (C) 2010 L2JTW Datapack �}�o�H��
echo.
echo �P�¨ϥ� L2JTW ���A��
echo ������T�i�H�b http://www.l2jtw.com �d�ߨ�
echo.
pause
color

@echo off
setlocal DisableDelayedExpansion
set "var=%PATH%"

set "var=%var:"=""%"
set "var=%var:^=^^%"
set "var=%var:&=^&%"
set "var=%var:|=^|%"
set "var=%var:<=^<%"
set "var=%var:>=^>%"

set "var=%var:;=^;^;%"
rem ** This is the key line, the missing quote is intention
set var=%var:""="%
set "var=%var:"=""%"

set "var=%var:;;="";""%"
set "var=%var:^;^;=;%"
set "var=%var:""="%"
set "var=%var:"=""%"
set "var=%var:"";""=";"%"
set "var=%var:"""="%"

setlocal EnableDelayedExpansion
for %%a in ("!var!") do (
    endlocal
    call :testdir "%%~a"
    setlocal EnableDelayedExpansion
)
goto :eof

:testdir
if exist %1 echo OK:  %1
if not exist %1 echo NOK: %1

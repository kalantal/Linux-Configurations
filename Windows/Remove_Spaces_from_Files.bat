@echo off
setlocal enabledelayedexpansion
for /r %%j in (*.*) do (
set filename=%%~nj
set filename=!filename:.=!
set filename=!filename: =!
if not "!filename!"=="%%~nj" ren "%%j" "!filename!%%~xj"
)

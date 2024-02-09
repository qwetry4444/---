@REM @echo off
setlocal enabledelayedexpansion

set dirName=%1
set dirPath="C:\Users\Maks\Desktop\uni_sem4\os\12\%dirName%"

set filesCount=0
for %%i in ("%dirPath%\*") do (
    set /a filesCount+=1
)

set countDigits=0
for /L %%k in (0,1,9) do (
    if !filesCount! GEQ 1 (
        set /a filesCount/=10
        set /a countDigits+=1
    )
)

set curFileNumber=0
for %%j in ("%dirPath%\*") do (
    set /a curFileNumber+=1
    set curDigCount=0
    set tempCurFileNumber=!curFileNumber!
    for /L %%m in (0,1,9) do (
        if !tempCurFileNumber! GEQ 1 (
            set /a tempCurFileNumber/=10
            set /a curDigCount+=1
        )
    )   

    set /a countZeroToAdd=!countDigits!-!curDigCount!-1
    set changedName=
    for /L %%i in (0,1,!countZeroToAdd!) do (
        set "changedName=!changedName!0"
    )
    set changedName=!changedName!!curFileNumber!%%~nxj
    ren "%%j" !changedName!
)
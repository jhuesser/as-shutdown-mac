--Shutdown your mac
--by Jonas Hüsser
--https://www.hüsser.ch/jonas/mac-zeitgesteuert-ausschalten/
set timeQuery to 1
--This value is used to stop the repeat
repeat until timeQuery is 0 --start repeat
    set HH to ((get time of (current date)) / 3600)
    set HH to round HH rounding down
    set MM to (((get time of (current date)) - HH * 3600) / 60)
    set MM to round MM rounding down
    set SS to (get (time of (current date)) - HH * 3600 - MM * 60) as integer
    --get time
    set HH to addleadingzero(HH)
    set MM to addleadingzero(MM)
    set SS to addleadingzero(SS)
    set myTime to (HH & "." & MM & "." & SS) as string --format time
    if my myTime is equal to "22.00.00" then --Test if it's time to shutdown. "22.00.00" is 10pm. write your time in here
        set timeQuery to 0
        ignoring application responses --ignore responses from other applications
            tell application "System Events"
                shut down --shutdown
            end tell
        end ignoring
    end if
end repeat
--this block is used to add e leading zero if the hour, minute or second is < 10
on addleadingzero(somenumber)
    if somenumber < 10 then
        set somenumber to "0" & somenumber as string
        return somenumber
    else
        return somenumber as string
    end if
end addleadingzero

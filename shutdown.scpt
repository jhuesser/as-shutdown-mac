--Mac zeitgesteuert ausschalten
--von Jonas Hüsser
--(cc)2014 jonas.hüsser.ch
set timeQuery to 1
--Diese Variable wird gebraucht um die Wiederholung zu stoppen
repeat until timeQuery is 0 --Wiederholung wird gestartet
    set HH to ((get time of (current date)) / 3600)
    set HH to round HH rounding down
    set MM to (((get time of (current date)) - HH * 3600) / 60)
    set MM to round MM rounding down
    set SS to (get (time of (current date)) - HH * 3600 - MM * 60) as integer
    --Die Zeit wird abgefragt
    set HH to addleadingzero(HH)
    set MM to addleadingzero(MM)
    set SS to addleadingzero(SS)
    set myTime to (HH & "." & MM & "." & SS) as string --Zeit wird formatiert
    if my myTime is equal to "22.00.00" then --Aktuelle Zeit wird mit vorgegebener Zeit überprüft
        set timeQuery to 0
        ignoring application responses --Antworten von anderen Programmen werden ignoriert
            tell application "System Events"
                shut down --Mac wird heruntergefahren
            end tell
        end ignoring
    end if
end repeat
--Im nachfolgenend Block wird eine Null angehängt, falls die Stunde, Minute oder Sekunde kleiner als 10 ist
on addleadingzero(somenumber)
    if somenumber < 10 then
        set somenumber to "0" & somenumber as string
        return somenumber
    else
        return somenumber as string
    end if
end addleadingzero

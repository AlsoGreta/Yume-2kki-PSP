dir *.mid *.wav /B /ON > DIR_LIST.txt
gawk -f BAT_MAKE.awk DIR_LIST.txt > t01.bat
call t01.bat

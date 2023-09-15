#Get date and add to save name
:local filename ([/system identity get name] . "-" . \
[:pick [/system clock get date] 7 11] . [:pick [/system clock get date] 0 3] . [:pick [/system clock get date] 4 6]);
/system backup save name=$filename
#Send Telegram notification
/tool fetch url="https://api.telegram.org/bot$BOT_TOKEN/sendMessage\?chat_id=$CHAT_ID&disable_notification=true&text=$TEXT"
#Upload file to share 
/tool fetch mode=ftp user=$user password=$pass upload=yes address=$ftpAddres src-path="$filename.backup" dst-path="$filename.backup"
#Remove file after complete backup
/file remove $filename



#For example save name is "MikroTik-2023sep14.backup"
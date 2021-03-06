#!/bin/bash

folder="$(cd ../ && pwd)"
source $folder/config.ini


process_date=$(date -d '1 hour ago' +%Y"-"%m"-"%d)
process_hour=$(date -d '1 hour ago' +%Y"-"%m"-"%d" "%H":00:00")
interval=$(date -d '1 hour ago' +%Y"-"%m"-"%d" "%H)
interval_middleman=$(date -d '1 hour ago' +%d"/"%b"/"%Y" "%H)

## Get all poracle logs
echo ""
echo "Get all poracle logs"
echo ""
mkdir -p $folder/tmp
grep "$interval" $PATH_TO_PoraclJS/logs/controller-$process_date.log | grep -v 'debug' > $folder/tmp/controller.log
grep "$interval" $PATH_TO_PoraclJS/logs/discord-$process_date.log | grep -v 'debug' > $folder/tmp/discord.log
grep "$interval" $PATH_TO_PoraclJS/logs/errors-$process_date.log | grep -v 'debug' > $folder/tmp/errors.log
grep "$interval" $PATH_TO_PoraclJS/logs/general-$process_date.log | grep -v 'debug' > $folder/tmp/general.log
grep "$interval" $PATH_TO_PoraclJS/logs/telegram-$process_date.log | grep -v 'debug' > $folder/tmp/telegram.log

## Get controller log data
echo "grep controller log data"

DUmon="$(grep 'Creating monster alert for discord:user' $folder/tmp/controller.log | wc -l)"
DUraid="$(grep 'Creating raid alert for discord:user' $folder/tmp/controller.log | wc -l)"
DUegg="$(grep 'Creating egg alert for discord:user' $folder/tmp/controller.log | wc -l)"
DUquest="$(grep 'Creating quest alert for discord:user' $folder/tmp/controller.log | wc -l)"
DUinvasion="$(grep 'Creating invasion alert for discord:user' $folder/tmp/controller.log | wc -l)"
DUweather="$(grep 'Creating weather alert for discord:user' $folder/tmp/controller.log | wc -l)"
DUnest="$(grep 'Creating nest alert for discord:user' $folder/tmp/controller.log | wc -l)"
DUgym="$(grep 'Creating gym alert for discord:user' $folder/tmp/controller.log | wc -l)"

DCmon="$(grep 'Creating monster alert for discord:channel' $folder/tmp/controller.log | wc -l)"
DCraid="$(grep 'Creating raid alert for discord:channel' $folder/tmp/controller.log | wc -l)"
DCegg="$(grep 'Creating egg alert for discord:channel' $folder/tmp/controller.log | wc -l)"
DCquest="$(grep 'Creating quest alert for discord:channel' $folder/tmp/controller.log | wc -l)"
DCinvasion="$(grep 'Creating invasion alert for discord:channel' $folder/tmp/controller.log | wc -l)"
DCweather="$(grep 'Creating weather alert for discord:channel' $folder/tmp/controller.log | wc -l)"
DCnest="$(grep 'Creating nest alert for discord:channel' $folder/tmp/controller.log | wc -l)"
DCgym="$(grep 'Creating gym alert for discord:channel' $folder/tmp/controller.log | wc -l)"

DWmon="$(grep 'Creating monster alert for webhook' $folder/tmp/controller.log | wc -l)"
DWraid="$(grep 'Creating raid alert for webhook' $folder/tmp/controller.log | wc -l)"
DWegg="$(grep 'Creating egg alert for webhook' $folder/tmp/controller.log | wc -l)"
DWquest="$(grep 'Creating quest alert for webhook' $folder/tmp/controller.log | wc -l)"
DWinvasion="$(grep 'Creating invasion alert for webhook' $folder/tmp/controller.log | wc -l)"
DWweather="$(grep 'Creating weather alert for webhook' $folder/tmp/controller.log | wc -l)"
DWnest="$(grep 'Creating nest alert for webhook' $folder/tmp/controller.log | wc -l)"
DWgym="$(grep 'Creating gym alert for webhook' $folder/tmp/controller.log | wc -l)"

TUmon="$(grep 'Creating monster alert for telegram:user' $folder/tmp/controller.log | wc -l)"
TUraid="$(grep 'Creating raid alert for telegram:user' $folder/tmp/controller.log | wc -l)"
TUegg="$(grep 'Creating egg alert for telegram:user' $folder/tmp/controller.log | wc -l)"
TUquest="$(grep 'Creating quest alert for telegram:user' $folder/tmp/controller.log | wc -l)"
TUinvasion="$(grep 'Creating invasion alert for telegram:user' $folder/tmp/controller.log | wc -l)"
TUweather="$(grep 'Creating weather alert for telegram:user' $folder/tmp/controller.log | wc -l)"
TUnest="$(grep 'Creating nest alert for telegram:user' $folder/tmp/controller.log | wc -l)"
TUgym="$(grep 'Creating gym alert for telegram:user' $folder/tmp/controller.log | wc -l)"

TCmon="$(grep 'Creating monster alert for telegram:channel' $folder/tmp/controller.log | wc -l)"
TCraid="$(grep 'Creating raid alert for telegram:channel' $folder/tmp/controller.log | wc -l)"
TCegg="$(grep 'Creating egg alert for telegram:channel' $folder/tmp/controller.log | wc -l)"
TCquest="$(grep 'Creating quest alert for telegram:channel' $folder/tmp/controller.log | wc -l)"
TCinvasion="$(grep 'Creating invasion alert for telegram:channel' $folder/tmp/controller.log | wc -l)"
TCweather="$(grep 'Creating weather alert for telegram:channel' $folder/tmp/controller.log | wc -l)"
TCnest="$(grep 'Creating nest alert for telegram:channel' $folder/tmp/controller.log | wc -l)"
TCgym="$(grep 'Creating gym alert for telegram:channel' $folder/tmp/controller.log | wc -l)"

TGmon="$(grep 'Creating monster alert for telegram:group' $folder/tmp/controller.log | wc -l)"
TGraid="$(grep 'Creating raid alert for telegram:group' $folder/tmp/controller.log | wc -l)"
TGegg="$(grep 'Creating egg alert for telegram:group' $folder/tmp/controller.log | wc -l)"
TGquest="$(grep 'Creating quest alert for telegram:group' $folder/tmp/controller.log | wc -l)"
TGinvasion="$(grep 'Creating invasion alert for telegram:group' $folder/tmp/controller.log | wc -l)"
TGweather="$(grep 'Creating weather alert for telegram:group' $folder/tmp/controller.log | wc -l)"
TGnest="$(grep 'Creating nest alert for telegram:group' $folder/tmp/controller.log | wc -l)"
TGgym="$(grep 'Creating gym alert for telegram:group' $folder/tmp/controller.log | wc -l)"

# original min/max/avg MsgT = SQLtime
checkLength="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep info: | grep 'ms)' | wc -l)"
checkLengthPvp="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $2}' | wc -l)"
if (( $checkLength > 0 ))
  then
    minMsgSqlT="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep info: | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s min)"
    maxMsgSqlT="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep info: | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s max)"
    avgMsgSqlT="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep info: | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s add/length)"
    if (( $checkLengthPvp > 0 ))
      then
        minPvpT="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $2}' | jq -s min)"
        maxPvpT="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $2}' | jq -s max)"
        avgPvpT="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $2}' | jq -s add/length)"
      else
        minPvpT=0
        maxPvpT=0
        avgPvpT=0
    fi
  else
    minMsgSqlT=0
    maxMsgSqlT=0
    avgMsgSqlT=0
    minPvpT=0
    maxPvpT=0
    avgPvpT=0
fi

# Add data for PR575, dts processing time
checkLength="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep verbose: | grep 'ms processing dts' | wc -l)"
if (( $checkLength > 0 ))
  then
    minMsgDtsT="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep verbose: | grep 'ms processing dts' | awk '{print $(NF-3)}' | jq -s min)"
    maxMsgDtsT="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep verbose: | grep 'ms processing dts' | awk '{print $(NF-3)}' | jq -s max)"
    avgMsgDtsT="$(grep -v '0 humans cared' $folder/tmp/controller.log | grep verbose: | grep 'ms processing dts' | awk '{print $(NF-3)}' | jq -s add/length)"
  else
    minMsgDtsT=0
    maxMsgDtsT=0
    avgMsgDtsT=0
fi


checkLength="$(grep '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | wc -l)"
checkLengthPvp="$(grep '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $2}' | wc -l)"
if (( $checkLength > 0 ))
  then
    minMsgT0="$(grep '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s min)"
    maxMsgT0="$(grep '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s max)"
    avgMsgT0="$(grep '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s add/length)"
    if (( $checkLengthPvp > 0 ))
      then
        minPvpT0="$(grep '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $2}' | jq -s min)"
        maxPvpT0="$(grep '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $2}' | jq -s max)"
        avgPvpT0="$(grep '0 humans cared' $folder/tmp/controller.log | grep 'ms)' | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $2}' | jq -s add/length)"
      else
        minPvpT0=0
        maxPvpT0=0
        avgPvpT0=0
    fi
  else
    minMsgT0=0
    maxMsgT0=0
    avgMsgT0=0
    minPvpT0=0
    maxPvpT0=0
    avgPvpT0=0
fi

rateLimit="$(grep 'Rate limit' $folder/tmp/controller.log | wc -l)"

noSend="$(grep 'already disappeared or is about to go away' $folder/tmp/controller.log | wc -l)"

checkLength="$(grep 'Geocode' $folder/tmp/controller.log | grep verbose: | wc -l)"
if (( $checkLength > 0 ))
  then
    minNomT="$(grep 'Geocode' $folder/tmp/controller.log | grep verbose: | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s min)"
    maxNomT="$(grep 'Geocode' $folder/tmp/controller.log | grep verbose: | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s max)"
    avgNomT="$(grep 'Geocode' $folder/tmp/controller.log | grep verbose: | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s add/length)"
  else
    minNomT=0
    maxNomT=0
    avgNomT=0
fi

checkLength="$(grep 'Tile generated' $folder/tmp/controller.log | grep verbose: | wc -l)"
if (( $checkLength > 0 ))
  then
    minTileT="$(grep 'Tile generated' $folder/tmp/controller.log | grep verbose: | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s min)"
    maxTileT="$(grep 'Tile generated' $folder/tmp/controller.log | grep verbose: | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s max)"
    avgTileT="$(grep 'Tile generated' $folder/tmp/controller.log | grep verbose: | awk '{print substr($(NF-1),2)}' | awk -F'/' 'NF>1 {print $1} $1==$0' | jq -s add/length)"
  else
    minTileT=0
    maxTileT=0
    avgTileT=0
fi

echo "Insert controller log data into DB"
echo ""
if [ -z "$SQL_password" ]
then
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user $STATS_DB -e "INSERT IGNORE INTO controller (Datetime,RPL,DUmon,DUegg,DUraid,DUquest,DUinvasion,DUweather,DUnest,DUgym,DCmon,DCegg,DCraid,DCquest,DCinvasion,DCweather,DCnest,DCgym,DWmon,DWegg,DWraid,DWquest,DWinvasion,DWweather,DWnest,DWgym,TUmon,TUegg,TUraid,TUquest,TUinvasion,TUweather,TUnest,TUgym,TCmon,TCegg,TCraid,TCquest,TCinvasion,TCweather,TCnest,TCgym,TGmon,TGegg,TGraid,TGquest,TGinvasion,TGweather,TGnest,TGgym,minMsgSqlT,maxMsgSqlT,avgMsgSqlT,minMsgDtsT,maxMsgDtsT,avgMsgDtsT,minPvpT,maxPvpT,avgPvpT,rateLimit,minMsgT0,maxMsgT0,avgMsgT0,minPvpT0,maxPvpT0,avgPvpT0,noSend,minNomT,maxNomT,avgNomT,minTileT,maxTileT,avgTileT) VALUES ('$process_hour','60','$DUmon','$DUegg','$DUraid','$DUquest','$DUinvasion','$DUweather','$DUnest','$DUgym','$DCmon','$DCegg','$DCraid','$DCquest','$DCinvasion','$DCweather','$DCnest','$DCgym','$DWmon','$DWegg','$DWraid','$DWquest','$DWinvasion','$DWweather','$DWnest','$DWgym','$TUmon','$TUegg','$TUraid','$TUquest','$TUinvasion','$TUweather','$TUnest','$TUgym','$TCmon','$TCegg','$TCraid','$TCquest','$TCinvasion','$TCweather','$TCnest','$TCgym','$TGmon','$TGegg','$TGraid','$TGquest','$TGinvasion','$TGweather','$TGnest','$TGgym','$minMsgSqlT','$maxMsgSqlT','$avgMsgSqlT','$minMsgDtsT','$maxMsgDtsT','$avgMsgDtsT','$minPvpT','$maxPvpT','$avgPvpT','$rateLimit','minMsgT0','$maxMsgT0','$avgMsgT0','$minPvpT0','$maxPvpT0','$avgPvpT0','$noSend','$minNomT','$maxNomT','$avgNomT','$minTileT','$maxTileT','$avgTileT');"
else
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user -p$SQL_password $STATS_DB -e "INSERT IGNORE INTO controller (Datetime,RPL,DUmon,DUegg,DUraid,DUquest,DUinvasion,DUweather,DUnest,DUgym,DCmon,DCegg,DCraid,DCquest,DCinvasion,DCweather,DCnest,DCgym,DWmon,DWegg,DWraid,DWquest,DWinvasion,DWweather,DWnest,DWgym,TUmon,TUegg,TUraid,TUquest,TUinvasion,TUweather,TUnest,TUgym,TCmon,TCegg,TCraid,TCquest,TCinvasion,TCweather,TCnest,TCgym,TGmon,TGegg,TGraid,TGquest,TGinvasion,TGweather,TGnest,TGgym,minMsgSqlT,maxMsgSqlT,avgMsgSqlT,minMsgDtsT,maxMsgDtsT,avgMsgDtsT,minPvpT,maxPvpT,avgPvpT,rateLimit,minMsgT0,maxMsgT0,avgMsgT0,minPvpT0,maxPvpT0,avgPvpT0,noSend,minNomT,maxNomT,avgNomT,minTileT,maxTileT,avgTileT) VALUES ('$process_hour','60','$DUmon','$DUegg','$DUraid','$DUquest','$DUinvasion','$DUweather','$DUnest','$DUgym','$DCmon','$DCegg','$DCraid','$DCquest','$DCinvasion','$DCweather','$DCnest','$DCgym','$DWmon','$DWegg','$DWraid','$DWquest','$DWinvasion','$DWweather','$DWnest','$DWgym','$TUmon','$TUegg','$TUraid','$TUquest','$TUinvasion','$TUweather','$TUnest','$TUgym','$TCmon','$TCegg','$TCraid','$TCquest','$TCinvasion','$TCweather','$TCnest','$TCgym','$TGmon','$TGegg','$TGraid','$TGquest','$TGinvasion','$TGweather','$TGnest','$TGgym','$minMsgSqlT','$maxMsgSqlT','$avgMsgSqlT','$minMsgDtsT','$maxMsgDtsT','$avgMsgDtsT','$minPvpT','$maxPvpT','$avgPvpT','$rateLimit','minMsgT0','$maxMsgT0','$avgMsgT0','$minPvpT0','$maxPvpT0','$avgPvpT0','$noSend','$minNomT','$maxNomT','$avgNomT','$minTileT','$maxTileT','$avgTileT');"
fi

## Get error log data
echo "grep error log data"
warn="$(grep 'warn' $folder/tmp/errors.log | wc -l)"
warnMap="$(grep 'warn' $folder/tmp/errors.log | grep StaticMap | wc -l)"
warnRL="$(grep 'warn' $folder/tmp/errors.log | grep -i 'rate limit' | wc -l)"
error="$(grep 'error' $folder/tmp/errors.log | wc -l)"
errorAddress="$(grep 'error' $folder/tmp/errors.log | grep 'getAddress' | wc -l)" 

echo "Insert error log data into DB"
echo ""
if [ -z "$SQL_password" ]
then
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user $STATS_DB -e "INSERT IGNORE INTO error (Datetime,RPL,warn,warnMap,warnRL,error,errorAddress) VALUES ('$process_hour','60','$warn','$warnMap','$warnRL','$error','$errorAddress');"
else
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user -p$SQL_password $STATS_DB -e "INSERT IGNORE INTO error (Datetime,RPL,warn,warnMap,warnRL,error,errorAddress) VALUES ('$process_hour','60','$warn','$warnMap','$warnRL','$error','$errorAddress');"
fi

## Get discord log data
echo "grep discord log  data"
warn2="$(grep 'MAIN warn' $folder/tmp/discord.log | wc -l)"
error2="$(grep 'MAIN error' $folder/tmp/discord.log | wc -l)"
errorBG="$(grep 'MAIN error' $folder/tmp/discord.log | grep 'Bad Gateway' | wc -l)"
errorUA="$(grep 'MAIN error' $folder/tmp/discord.log | grep 'The user aborted a request' | wc -l)"

errorCantSend="$(grep 'Cannot send messages to' $folder/tmp/discord.log | wc -l)"
errorNoPerm="$(grep 'Missing Permissions' $folder/tmp/discord.log | wc -l)"
errorNoAccess="$(grep 'Missing Access' $folder/tmp/discord.log | wc -l)"

msgClean="$(grep 'Sending discord message' $folder/tmp/discord.log | grep 'clean' | wc -l)"
msgSend="$(grep 'Sending discord message' $folder/tmp/discord.log | grep -v 'clean' | wc -l)"
UmsgSend="$(grep 'USER Sending discord message' $folder/tmp/discord.log | grep -v 'clean' | wc -l)"
CmsgSend="$(grep 'CHANNEL Sending discord message' $folder/tmp/discord.log | grep -v 'clean' | wc -l)"
WmsgSend="$(grep 'WEBHOOK Sending discord message' $folder/tmp/discord.log | grep -v 'clean' | wc -l)"

checkLength="$(grep 'MAIN verbose' $folder/tmp/discord.log | grep 'ms)' | grep 'CHANNEL' | wc -l)"
if (( $checkLength > 0 ))
then
  minCmsgT="$(grep 'MAIN verbose' $folder/tmp/discord.log | grep 'ms)' | grep 'CHANNEL' | awk '{print substr($(NF-1),2)}' | jq -s min)"
  maxCmsgT="$(grep 'MAIN verbose' $folder/tmp/discord.log | grep 'ms)' | grep 'CHANNEL' | awk '{print substr($(NF-1),2)}' | jq -s max)"
  avgCmsgT="$(grep 'MAIN verbose' $folder/tmp/discord.log | grep 'ms)' | grep 'CHANNEL' | awk '{print substr($(NF-1),2)}' | jq -s add/length)"
else
  minCmsgT=0
  maxCmsgT=0
  avgCmsgT=0
fi

checkLength="$(grep 'MAIN verbose' $folder/tmp/discord.log | grep 'ms)' | grep 'USER' | wc -l)"
if (( $checkLength > 0 ))
then
  minUmsgT="$(grep 'MAIN verbose' $folder/tmp/discord.log | grep 'ms)' | grep 'USER' | awk '{print substr($(NF-1),2)}' | jq -s min)"
  maxUmsgT="$(grep 'MAIN verbose' $folder/tmp/discord.log | grep 'ms)' | grep 'USER' | awk '{print substr($(NF-1),2)}' | jq -s max)"
  avgUmsgT="$(grep 'MAIN verbose' $folder/tmp/discord.log | grep 'ms)' | grep 'USER' | awk '{print substr($(NF-1),2)}' | jq -s add/length)"
else
  minUmsgT=0
  maxUmsgT=0
  avgUmsgT=0
fi

echo "Insert discord log data into DB"
echo ""
if [ -z "$SQL_password" ]
then
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user $STATS_DB -e "INSERT IGNORE INTO discord (Datetime,RPL,warn,error,errorBG,errorUA,errorCantSend,errorNoPerm,errorNoAccess,msgClean,msgSend,UmsgSend,CmsgSend,WmsgSend,minCmsgT,maxCmsgT,avgCmsgT,minUmsgT,maxUmsgT,avgUmsgT) VALUES ('$process_hour','60','$warn2','$error2','$errorBG','$errorUA','$errorCantSend','$errorNoPerm','$errorNoAccess','$msgClean','$msgSend','$UmsgSend','$CmsgSend','$WmsgSend','$minCmsgT','$maxCmsgT','$avgCmsgT','$minUmsgT','$maxUmsgT','$avgUmsgT');"
else
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user -p$SQL_password $STATS_DB -e "INSERT IGNORE INTO discord (Datetime,RPL,warn,error,errorBG,errorUA,errorCantSend,errorNoPerm,errorNoAccess,msgClean,msgSend,UmsgSend,CmsgSend,WmsgSend,minCmsgT,maxCmsgT,avgCmsgT,minUmsgT,maxUmsgT,avgUmsgT) VALUES ('$process_hour','60','$warn2','$error2','$errorBG','$errorUA','$errorCantSend','$errorNoPerm','$errorNoAccess','$msgClean','$msgSend','$UmsgSend','$CmsgSend','$WmsgSend','$minCmsgT','$maxCmsgT','$avgCmsgT','$minUmsgT','$maxUmsgT','$avgUmsgT');"
fi

## Get telegram log data
echo "grep telegram log data"
stickerFail="$(grep 'Failed to send Telegram sticker' $folder/tmp/telegram.log | wc -l)"
msgClean="$(grep 'Sending telegram message' $folder/tmp/telegram.log | grep 'clean' | wc -l)"
msgSend="$(grep 'Sending telegram message' $folder/tmp/telegram.log | grep -v 'clean' | wc -l)"
UmsgSend="$(grep 'USER Sending telegram message' $folder/tmp/telegram.log | grep -v 'clean' | wc -l)"
CmsgSend="$(grep 'CHANNEL Sending telegram message' $folder/tmp/telegram.log | grep -v 'clean' | wc -l)"
GmsgSend="$(grep 'GROUP Sending telegram message' $folder/tmp/telegram.log | grep -v 'clean' | wc -l)"

echo "Insert telegram log data into DB"
echo ""
if [ -z "$SQL_password" ]
then
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user $STATS_DB -e "INSERT IGNORE INTO telegram (Datetime,RPL,stickerFail,msgClean,msgSend,UmsgSend,CmsgSend,GmsgSend) ('$process_hour','60','$stickerFail','$msgClean','$msgSend','$UmsgSend','$CmsgSend','$GmsgSend');"
else
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user -p$SQL_password $STATS_DB -e "INSERT IGNORE INTO telegram (Datetime,RPL,stickerFail,msgClean,msgSend,UmsgSend,CmsgSend,GmsgSend) VALUES ('$process_hour','60','$stickerFail','$msgClean','$msgSend','$UmsgSend','$CmsgSend','$GmsgSend');"
fi

## Get general log data
echo "grep general log  data"

checkLength="$(grep 'verbose: Inbound WebhookQueue' $folder/tmp/general.log | wc -l)"
if (( $checkLength > 0 ))
  then
    whQinMinRaw="$(grep 'verbose: Inbound WebhookQueue' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s min)"
    whQinMaxRaw="$(grep 'verbose: Inbound WebhookQueue' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s max)"
    whQinAvgRaw="$(grep 'verbose: Inbound WebhookQueue' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s add/length)"
    whQinMinWorker="$(grep 'verbose: Worker' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s min)"
    whQinMaxWorker="$(grep 'verbose: Worker' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s max)"
    whQinAvgWorker="$(grep 'verbose: Worker' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s add/length)"
  else
    whQinMinRaw=0
    whQinMaxRaw=0
    whQinAvgRaw=0
    whQinMinWorker=0
    whQinMaxWorker=0
    whQinAvgWorker=0
fi

checkLength="$(grep 'DiscordQueue' $folder/tmp/general.log | grep -v 'Webhook' | wc -l)"
if (( $checkLength > 0 ))
  then
    whQoutMinDiscord="$(grep 'DiscordQueue' $folder/tmp/general.log | grep -v 'Webhook' | awk '{print ($NF)}' | jq -s min)"
    whQoutMaxDiscord="$(grep 'DiscordQueue' $folder/tmp/general.log | grep -v 'Webhook' | awk '{print ($NF)}' | jq -s max)"
    whQoutAvgDiscord="$(grep 'DiscordQueue' $folder/tmp/general.log | grep -v 'Webhook' | awk '{print ($NF)}' | jq -s add/length)"
  else
    whQoutMinDiscord=0
    whQoutMaxDiscord=0
    whQoutAvgDiscord=0
fi

checkLength="$(grep 'DiscordQueue\[Webhook\]' $folder/tmp/general.log | wc -l)"
if (( $checkLength > 0 ))
  then
    whQoutMinDiscordWH="$(grep 'DiscordQueue\[Webhook\]' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s min)"
    whQoutMaxDiscordWH="$(grep 'DiscordQueue\[Webhook\]' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s max)"
    whQoutAvgDiscordWH="$(grep 'DiscordQueue\[Webhook\]' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s add/length)"
  else
    whQoutMinDiscordWH=0
    whQoutMaxDiscordWH=0
    whQoutAvgDiscordWH=0
fi

checkLength="$(grep 'TelegramQueue' $folder/tmp/general.log | wc -l)"
if (( $checkLength > 0 ))
  then
    whQoutMinTelegram="$(grep 'TelegramQueue' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s min)"
    whQoutMaxTelegram="$(grep 'TelegramQueue' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s max)"
    whQoutAvgTelegram="$(grep 'TelegramQueue' $folder/tmp/general.log | awk '{print ($NF)}' | jq -s add/length)"
  else
    whQoutMinTelegram=0
    whQoutMaxTelegram=0
    whQoutAvgTelegram=0
fi

stopRL="$(grep 'Stopping alerts (Rate limit)' $folder/tmp/general.log | grep -v 'clean' | wc -l)"
stopUR="$(grep 'Stopping alerts [until restart]' $folder/tmp/general.log | grep -v 'clean' | wc -l)"

checkRedis="$(grep 'Duplicate cache stats' $folder/tmp/general.log | head -1 | awk '{ print $8 }' | grep 'redis' | wc -l)"
if (( $checkRedis > 0 ))
  then
  min_hits="$(grep 'Duplicate cache stats' $folder/tmp/general.log | head -1 | awk '{ print $8 }' | grep -Po '(?<=("hits":)).*(?=,"misses")')"
  max_hits="$(grep 'Duplicate cache stats' $folder/tmp/general.log | tail -1 | awk '{ print $8 }' | grep -Po '(?<=("hits":)).*(?=,"misses")')"
  min_misses="$(grep 'Duplicate cache stats' $folder/tmp/general.log | head -1 | awk '{ print $8 }' | grep -Po '(?<=("misses":)).*(?=,"type")')"
  max_misses="$(grep 'Duplicate cache stats' $folder/tmp/general.log | tail -1 | awk '{ print $8 }' | grep -Po '(?<=("misses":)).*(?=,"type")')"
  else
  min_hits="$(grep 'Duplicate cache stats' $folder/tmp/general.log | head -1 | awk '{ print $8 }' | grep -Po '(?<=("hits":)).*(?=,"misses")')"
  max_hits="$(grep 'Duplicate cache stats' $folder/tmp/general.log | tail -1 | awk '{ print $8 }' | grep -Po '(?<=("hits":)).*(?=,"misses")')"
  min_misses="$(grep 'Duplicate cache stats' $folder/tmp/general.log | head -1 | awk '{ print $8 }' | grep -Po '(?<=("misses":)).*(?=,"keys")')"
  max_misses="$(grep 'Duplicate cache stats' $folder/tmp/general.log | tail -1 | awk '{ print $8 }' | grep -Po '(?<=("misses":)).*(?=,"keys")')"
fi

if (( $max_misses < $min_misses ))
  then
    whReceived=0
    whDiscarded=0
    workerIn=0
    poracleRes=1
  else
    whReceived=$(($max_misses+$max_hits-$min_misses-$min_hits))
    whDiscarded=$(($max_hits-$min_hits))
    workerIn=$(($max_misses-$min_misses))
    poracleRes=0
fi


echo "Insert general log data into DB"
echo ""
if [ -z "$SQL_password" ]
then
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user $STATS_DB -e "INSERT IGNORE INTO general (Datetime,RPL,whQinMinRaw,whQinMaxRaw,whQinAvgRaw,whQinMinWorker,whQinMaxWorker,whQinAvgWorker,whQoutMinDiscord,whQoutMaxDiscord,whQoutAvgDiscord,whQoutMinDiscordWH,whQoutMaxDiscordWH,whQoutAvgDiscordWH,whQoutMinTelegram,whQoutMaxTelegram,whQoutAvgTelegram,stopRL,stopUR,whReceived,whDiscarded,workerIn,poracleRes) VALUES ('$process_hour','60','$whQinMinRaw','$whQinMaxRaw','$whQinAvgRaw','$whQinMinWorker','$whQinMaxWorker','$whQinAvgWorker','$whQoutMinDiscord','$whQoutMaxDiscord','$whQoutAvgDiscord','$whQoutMinDiscordWH','$whQoutMaxDiscordWH','$whQoutAvgDiscordWH','$whQoutMinTelegram','$whQoutMaxTelegram','$whQoutAvgTelegram','$stopRL','$stopUR','$whReceived','$whDiscarded','$workerIn','$poracleRes');"
else
  mysql -h$DB_IP -P$DB_PORT -u$SQL_user -p$SQL_password $STATS_DB -e "INSERT IGNORE INTO general (Datetime,RPL,whQinMinRaw,whQinMaxRaw,whQinAvgRaw,whQinMinWorker,whQinMaxWorker,whQinAvgWorker,whQoutMinDiscord,whQoutMaxDiscord,whQoutAvgDiscord,whQoutMinDiscordWH,whQoutMaxDiscordWH,whQoutAvgDiscordWH,whQoutMinTelegram,whQoutMaxTelegram,whQoutAvgTelegram,stopRL,stopUR,whReceived,whDiscarded,workerIn,poracleRes) VALUES ('$process_hour','60','$whQinMinRaw','$whQinMaxRaw','$whQinAvgRaw','$whQinMinWorker','$whQinMaxWorker','$whQinAvgWorker','$whQoutMinDiscord','$whQoutMaxDiscord','$whQoutAvgDiscord','$whQoutMinDiscordWH','$whQoutMaxDiscordWH','$whQoutAvgDiscordWH','$whQoutMinTelegram','$whQoutMaxTelegram','$whQoutAvgTelegram','$stopRL','$stopUR','$whReceived','$whDiscarded','$workerIn','$poracleRes');"
fi

## Check for middleman path and process
echo "Middleman data"
if [ -z "$middleman_log" ]
then
  echo "No path entered, skipping"
else
  echo "Get log data"
  grep -a "$interval_middleman" $middleman_log > $folder/tmp/middleman.log
  echo "grep middleman log data"
  total="$(grep 'POST /staticmap' $folder/tmp/middleman.log | wc -l)"
  mm200="$(grep 'POST /staticmap' $folder/tmp/middleman.log | grep '200' | wc -l)"
  mm500="$(grep 'POST /staticmap' $folder/tmp/middleman.log | grep '500' | wc -l)"
  echo "Insert middleman data into DB"
  if [ -z "$SQL_password" ]
  then
    mysql -h$DB_IP -P$DB_PORT -u$SQL_user $STATS_DB -e "INSERT IGNORE INTO middleman (Datetime,RPL,total,post200,post500) VALUES ('$process_hour','60','$total','$mm200','$mm500');"
  else
    mysql -h$DB_IP -P$DB_PORT -u$SQL_user -p$SQL_password $STATS_DB -e "INSERT IGNORE INTO middleman (Datetime,RPL,total,post200,post500) VALUES ('$process_hour','60','$total','$mm200','$mm500');"
  fi
fi

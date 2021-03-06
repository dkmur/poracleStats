CREATE TABLE IF NOT EXISTS `controller` (
  `Datetime` datetime NOT NULL,
  `RPL` smallint(6) NOT NULL,
  `DUmon` INT DEFAULT NULL,
  `DUegg` INT DEFAULT NULL,
  `DUraid` INT DEFAULT NULL,
  `DUquest` INT DEFAULT NULL,
  `DUinvasion` INT DEFAULT NULL,
  `DUweather` smallint(10) DEFAULT NULL,
  `DUnest` INT DEFAULT NULL,
  `DUgym` INT DEFAULT NULL,
  `DCmon` INT DEFAULT NULL,
  `DCegg` INT DEFAULT NULL,
  `DCraid` INT DEFAULT NULL,
  `DCquest` INT DEFAULT NULL,
  `DCinvasion` INT DEFAULT NULL,
  `DCweather` smallint(10) DEFAULT NULL,
  `DCnest` INT DEFAULT NULL,
  `DCgym` INT DEFAULT NULL,
  `DWmon` INT DEFAULT NULL,
  `DWegg` INT DEFAULT NULL,
  `DWraid` INT DEFAULT NULL,
  `DWquest` INT DEFAULT NULL,
  `DWinvasion` INT DEFAULT NULL,
  `DWweather` smallint(10) DEFAULT NULL,
  `DWnest` INT DEFAULT NULL,
  `DWgym` INT DEFAULT NULL,
  `TUmon` INT DEFAULT NULL,
  `TUegg` INT DEFAULT NULL,
  `TUraid` INT DEFAULT NULL,
  `TUquest` INT DEFAULT NULL,
  `TUinvasion` INT DEFAULT NULL,
  `TUweather` smallint(10) DEFAULT NULL,
  `TUnest` INT DEFAULT NULL,
  `TUgym` INT DEFAULT NULL,
  `TCmon` INT DEFAULT NULL,
  `TCegg` INT DEFAULT NULL,
  `TCraid` INT DEFAULT NULL,
  `TCquest` INT DEFAULT NULL,
  `TCinvasion` INT DEFAULT NULL,
  `TCweather` smallint(10) DEFAULT NULL,
  `TCnest` INT DEFAULT NULL,
  `TCgym` INT DEFAULT NULL,
  `TGmon` INT DEFAULT NULL,
  `TGegg` INT DEFAULT NULL,
  `TGraid` INT DEFAULT NULL,
  `TGquest` INT DEFAULT NULL,
  `TGinvasion` INT DEFAULT NULL,
  `TGweather` smallint(10) DEFAULT NULL,
  `TGnest` INT DEFAULT NULL,
  `TGgym` INT DEFAULT NULL,
  `minMsgSqlT` decimal(10,2) DEFAULT NULL,
  `maxMsgSqlT` decimal(10,2) DEFAULT NULL,
  `avgMsgSqlT` decimal(10,2) DEFAULT NULL,
  `minMsgDtsT` decimal(10,2) DEFAULT NULL,
  `maxMsgDtsT` decimal(10,2) DEFAULT NULL,
  `avgMsgDtsT` decimal(10,2) DEFAULT NULL,
  `minPvpT` decimal(10,2) DEFAULT NULL,
  `maxPvpT` decimal(10,2) DEFAULT NULL,
  `avgPvpT` decimal(10,2) DEFAULT NULL,
  `rateLimit` smallint(10) DEFAULT NULL,
  `minMsgT0` decimal(10,2) DEFAULT NULL,
  `maxMsgT0` decimal(10,2) DEFAULT NULL,
  `avgMsgT0` decimal(10,2) DEFAULT NULL,
  `minPvpT0` decimal(10,2) DEFAULT NULL,
  `maxPvpT0` decimal(10,2) DEFAULT NULL,
  `avgPvpT0` decimal(10,2) DEFAULT NULL,
  `noSend` smallint(10) DEFAULT NULL,
  `minNomT` decimal(10,2) DEFAULT NULL,
  `maxNomT` decimal(10,2) DEFAULT NULL,
  `avgNomT` decimal(10,2) DEFAULT NULL,
  `minTileT` decimal(10,2) DEFAULT NULL,
  `maxTileT` decimal(10,2) DEFAULT NULL,
  `avgTileT` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (Datetime,RPL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `error` (
  `Datetime` datetime NOT NULL,
  `RPL` smallint(6) NOT NULL,
  `warn` smallint(10) DEFAULT NULL,
  `warnMap` smallint(10) DEFAULT NULL,
  `warnRL` smallint(10) DEFAULT NULL,
  `error` smallint(10) DEFAULT NULL,
  `errorAddress` smallint(10) DEFAULT NULL,
  PRIMARY KEY (Datetime,RPL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `general` (
  `Datetime` datetime NOT NULL,
  `RPL` smallint(6) NOT NULL,
  `whQinMinRaw` smallint(10) DEFAULT NULL,
  `whQinMaxRaw` smallint(10) DEFAULT NULL,
  `whQinAvgRaw` smallint(10) DEFAULT NULL,
  `whQinMinWorker` smallint(10) DEFAULT NULL,
  `whQinMaxWorker` smallint(10) DEFAULT NULL,
  `whQinAvgWorker` smallint(10) DEFAULT NULL,
  `whQoutMinDiscord` smallint(10) DEFAULT NULL,
  `whQoutMaxDiscord` smallint(10) DEFAULT NULL,
  `whQoutAvgDiscord` smallint(10) DEFAULT NULL,
  `whQoutMinDiscordWH` smallint(10) DEFAULT NULL,
  `whQoutMaxDiscordWH` smallint(10) DEFAULT NULL,
  `whQoutAvgDiscordWH` smallint(10) DEFAULT NULL,
  `whQoutMinTelegram` smallint(10) DEFAULT NULL,
  `whQoutMaxTelegram` smallint(10) DEFAULT NULL,
  `whQoutAvgTelegram` smallint(10) DEFAULT NULL,
  `stopRL` smallint(10) DEFAULT NULL,
  `stopUR` smallint(10) DEFAULT NULL,
  `whReceived` INT DEFAULT NULL,
  `whDiscarded` INT DEFAULT NULL,
  `workerIn` INT DEFAULT NULL,
  `poracleRes` smallint(10) DEFAULT NULL,
  PRIMARY KEY (Datetime,RPL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `discord` (
  `Datetime` datetime NOT NULL,
  `RPL` smallint(6) NOT NULL,
  `warn` smallint(10) DEFAULT NULL,
  `error` smallint(10) DEFAULT NULL,
  `errorBG` smallint(10) DEFAULT NULL,
  `errorUA` smallint(10) DEFAULT NULL,
  `errorCantSend` smallint(10) DEFAULT NULL,
  `errorNoPerm` smallint(10) DEFAULT NULL,
  `errorNoAccess` smallint(10) DEFAULT NULL,
  `msgClean` INT DEFAULT NULL,
  `msgSend` INT DEFAULT NULL,
  `UmsgSend` INT DEFAULT NULL,
  `CmsgSend` INT DEFAULT NULL,
  `WmsgSend` INT DEFAULT NULL,
  `minCmsgT` decimal(10,2) DEFAULT NULL,
  `maxCmsgT` decimal(10,2) DEFAULT NULL,
  `avgCmsgT` decimal(10,2) DEFAULT NULL,
  `minUmsgT` decimal(10,2) DEFAULT NULL,
  `maxUmsgT` decimal(10,2) DEFAULT NULL,
  `avgUmsgT` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (Datetime,RPL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `telegram` (
  `Datetime` datetime NOT NULL,
  `RPL` smallint(6) NOT NULL,
  `stickerFail` smallint(10) DEFAULT NULL,
  `msgClean` INT DEFAULT NULL,
  `msgSend` INT DEFAULT NULL,
  `UmsgSend` INT DEFAULT NULL,
  `CmsgSend` INT DEFAULT NULL,
  `GmsgSend` INT DEFAULT NULL,
  PRIMARY KEY (Datetime,RPL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `users` (
  `Datetime` datetime NOT NULL,
  `RPL` smallint(6) NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `msgSend` smallint(10) DEFAULT NULL,
  `mon` smallint(10) DEFAULT NULL,
  `egg` smallint(10) DEFAULT NULL,
  `raid` smallint(10) DEFAULT NULL,
  `quest` smallint(10) DEFAULT NULL,
  `invasion` smallint(10) DEFAULT NULL,
  `weather` smallint(10) DEFAULT NULL,
  `nest` smallint(10) DEFAULT NULL,
  `gym` smallint(10) DEFAULT NULL,
  `stopRL` smallint(10) DEFAULT NULL,
  `stopUR` smallint(10) DEFAULT NULL,
  `mnc` smallint(10) DEFAULT NULL,
  PRIMARY KEY (Datetime,id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `middleman` (
  `Datetime` datetime NOT NULL,
  `RPL` smallint(6) NOT NULL,
  `total` smallint(10) DEFAULT NULL,
  `post200` smallint(10) DEFAULT NULL,
  `post500` smallint(10) DEFAULT NULL,
  PRIMARY KEY (Datetime,RPL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `version` (
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` smallint(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `controller`
CHANGE COLUMN IF EXISTS `Umon` `DUmon` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `Uegg` `DUegg` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `Uraid` `DUraid` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `Uquest` `DUquest` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `Uinvasion` `DUinvasion` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `Cmon` `DCmon` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `Cegg` `DCegg` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `Craid` `DCraid` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `Cquest` `DCquest` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `Cinvasion` `DCinvasion` smallint(10) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `DUweather` smallint(10) DEFAULT NULL AFTER DUinvasion,
ADD COLUMN IF NOT EXISTS `DUnest` INT DEFAULT NULL AFTER DUweather,
ADD COLUMN IF NOT EXISTS `DUgym` INT DEFAULT NULL AFTER DUnest,
ADD COLUMN IF NOT EXISTS `DCweather` smallint(10) DEFAULT NULL AFTER DCinvasion,
ADD COLUMN IF NOT EXISTS `DCnest` INT DEFAULT NULL AFTER DCweather,
ADD COLUMN IF NOT EXISTS `DCgym` INT DEFAULT NULL AFTER DCnest,
ADD COLUMN IF NOT EXISTS `DWmon` smallint(10) DEFAULT NULL AFTER DCweather,
ADD COLUMN IF NOT EXISTS `DWegg` smallint(10) DEFAULT NULL AFTER DWmon,
ADD COLUMN IF NOT EXISTS `DWraid` smallint(10) DEFAULT NULL AFTER DWegg,
ADD COLUMN IF NOT EXISTS `DWquest` smallint(10) DEFAULT NULL AFTER DWraid,
ADD COLUMN IF NOT EXISTS `DWinvasion` smallint(10) DEFAULT NULL AFTER DWquest,
ADD COLUMN IF NOT EXISTS `DWweather` smallint(10) DEFAULT NULL AFTER DWinvasion,
ADD COLUMN IF NOT EXISTS `DWnest` INT DEFAULT NULL AFTER DWweather,
ADD COLUMN IF NOT EXISTS `DWgym` INT DEFAULT NULL AFTER DWnest,
ADD COLUMN IF NOT EXISTS `TUmon` smallint(10) DEFAULT NULL AFTER DWweather,
ADD COLUMN IF NOT EXISTS `TUegg` smallint(10) DEFAULT NULL AFTER TUmon,
ADD COLUMN IF NOT EXISTS `TUraid` smallint(10) DEFAULT NULL AFTER TUegg,
ADD COLUMN IF NOT EXISTS `TUquest` smallint(10) DEFAULT NULL AFTER TUraid,
ADD COLUMN IF NOT EXISTS `TUinvasion` smallint(10) DEFAULT NULL AFTER TUquest,
ADD COLUMN IF NOT EXISTS `TUweather` smallint(10) DEFAULT NULL AFTER TUinvasion,
ADD COLUMN IF NOT EXISTS `TUnest` INT DEFAULT NULL AFTER TUweather,
ADD COLUMN IF NOT EXISTS `TUgym` INT DEFAULT NULL AFTER TUnest,
ADD COLUMN IF NOT EXISTS `TCmon` smallint(10) DEFAULT NULL AFTER TUweather,
ADD COLUMN IF NOT EXISTS `TCegg` smallint(10) DEFAULT NULL AFTER TCmon,
ADD COLUMN IF NOT EXISTS `TCraid` smallint(10) DEFAULT NULL AFTER TCegg,
ADD COLUMN IF NOT EXISTS `TCquest` smallint(10) DEFAULT NULL AFTER TCraid,
ADD COLUMN IF NOT EXISTS `TCinvasion` smallint(10) DEFAULT NULL AFTER TCquest,
ADD COLUMN IF NOT EXISTS `TCweather` smallint(10) DEFAULT NULL AFTER TCinvasion,
ADD COLUMN IF NOT EXISTS `TCnest` INT DEFAULT NULL AFTER TCweather,
ADD COLUMN IF NOT EXISTS `TCgym` INT DEFAULT NULL AFTER TCnest,
ADD COLUMN IF NOT EXISTS `TGmon` smallint(10) DEFAULT NULL AFTER TCweather,
ADD COLUMN IF NOT EXISTS `TGegg` smallint(10) DEFAULT NULL AFTER TGmon,
ADD COLUMN IF NOT EXISTS `TGraid` smallint(10) DEFAULT NULL AFTER TGegg,
ADD COLUMN IF NOT EXISTS `TGquest` smallint(10) DEFAULT NULL AFTER TGraid,
ADD COLUMN IF NOT EXISTS `TGinvasion` smallint(10) DEFAULT NULL AFTER TGquest,
ADD COLUMN IF NOT EXISTS `TGweather` smallint(10) DEFAULT NULL AFTER TGinvasion,
ADD COLUMN IF NOT EXISTS `TGnest` INT DEFAULT NULL AFTER TGweather,
ADD COLUMN IF NOT EXISTS `TGgym` INT DEFAULT NULL AFTER TGnest,
ADD COLUMN IF NOT EXISTS `noSend` smallint(10) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `minMsgT` `minMsgSqlT` decimal(10,2) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `maxMsgT` `maxMsgSqlT` decimal(10,2) DEFAULT NULL,
CHANGE COLUMN IF EXISTS `avgMsgT` `avgMsgSqlT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `minMsgDtsT` decimal(10,2) DEFAULT NULL AFTER avgMsgSqlT,
ADD COLUMN IF NOT EXISTS `maxMsgDtsT` decimal(10,2) DEFAULT NULL AFTER minMsgDtsT,
ADD COLUMN IF NOT EXISTS `avgMsgDtsT` decimal(10,2) DEFAULT NULL AFTER maxMsgDtsT,
ADD COLUMN IF NOT EXISTS `minPvpT` decimal(10,2) DEFAULT NULL AFTER avgMsgDtsT,
ADD COLUMN IF NOT EXISTS `maxPvpT` decimal(10,2) DEFAULT NULL AFTER minPvpT,
ADD COLUMN IF NOT EXISTS `avgPvpT` decimal(10,2) DEFAULT NULL AFTER maxPvpT,
ADD COLUMN IF NOT EXISTS `minPvpT0` decimal(10,2) DEFAULT NULL AFTER avgMsgT0,
ADD COLUMN IF NOT EXISTS `maxPvpT0` decimal(10,2) DEFAULT NULL AFTER minPvpT0,
ADD COLUMN IF NOT EXISTS `avgPvpT0` decimal(10,2) DEFAULT NULL AFTER maxPvpT0,
ADD COLUMN IF NOT EXISTS `minNomT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `maxNomT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `avgNomT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `minTileT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `maxTileT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `avgTileT` decimal(10,2) DEFAULT NULL
;


ALTER TABLE `discord`
ADD COLUMN IF NOT EXISTS `errorCantSend` smallint(10) DEFAULT NULL AFTER `errorUA`,
ADD COLUMN IF NOT EXISTS `errorNoPerm` smallint(10) DEFAULT NULL AFTER `errorCantSend`,
ADD COLUMN IF NOT EXISTS `errorNoAccess` smallint(10) DEFAULT NULL AFTER `errorNoPerm`,
ADD COLUMN IF NOT EXISTS `UmsgSend` smallint(10) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `CmsgSend` smallint(10) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `WmsgSend` smallint(10) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `minCmsgT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `maxCmsgT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `avgCmsgT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `minUmsgT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `maxUmsgT` decimal(10,2) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `avgUmsgT` decimal(10,2) DEFAULT NULL
;

ALTER TABLE `general`
ADD COLUMN IF NOT EXISTS `whReceived` INT DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `whDiscarded` INT DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `workerIn` INT DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `poracleRes` smallint(10) DEFAULT NULL
;

ALTER TABLE `error`
ADD COLUMN IF NOT EXISTS `errorAddress` smallint(10) DEFAULT NULL
;

ALTER TABLE `middleman`
ADD COLUMN IF NOT EXISTS `total` smallint(10) DEFAULT NULL AFTER `RPL`
;

ALTER TABLE `users`
ADD COLUMN IF NOT EXISTS `name` varchar(255) DEFAULT NULL AFTER `id`,
ADD COLUMN IF NOT EXISTS `mnc` smallint(10) DEFAULT NULL AFTER `stopUR`,
ADD COLUMN IF NOT EXISTS `weather` smallint(10) DEFAULT NULL AFTER `invasion`,
ADD COLUMN IF NOT EXISTS `nest` smallint(10) DEFAULT NULL AFTER `weather`,
ADD COLUMN IF NOT EXISTS `gym` smallint(10) DEFAULT NULL AFTER `nest`
;

-- update version
INSERT IGNORE INTO version values ('poraclestats',1);
UPDATE version set version = 18 where version.key = 'poraclestats';
